#
# $Id: Path.pm,v 5.1 2003/11/05 22:52:40 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

package AFS::Object::Path;

use strict;

our @ISA = qw(AFS::Object);
our $VERSION = '1.4';

sub getACL {
    my $self = shift;
    my $type = shift || 'normal';
    return unless ref $self->{_acl};
    return $self->{_acl}->{"_$type"};
}

sub getACLNormal {
    my $self = shift;
    return $self->getACL();
}

sub getACLNegative {
    my $self = shift;
    return $self->getACL('negative');
}

sub _setACLNormal {

    my $self = shift;
    my $acl = shift;

    unless ( ref $acl && $acl->isa("AFS::Object::ACL") ) {
	$self->_Croak("Invalid argument: must be an AFS::Object::ACL object");
    }

    return $self->{_acl}->{_normal} = $acl;

}

sub _setACLNegative {

    my $self = shift;
    my $acl = shift;

    unless ( ref $acl && $acl->isa("AFS::Object::ACL") ) {
	$self->_Croak("Invalid argument: must be an AFS::Object::ACL object");
    }

    return $self->{_acl}->{_negative} = $acl;

}

1;