#
# $Id: ACL.pm,v 5.1 2003/11/05 22:52:38 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

package AFS::Object::ACL;

use strict;

our @ISA = qw(AFS::Object);
our $VERSION = '1.4';

sub getPrincipals {
    my $self = shift;
    return unless ref $self->{_principals};
    return keys %{$self->{_principals}};
}

sub getRights {
    my $self = shift;
    my $principal = shift;
    return unless ref $self->{_principals};
    return $self->{_principals}->{$principal};
}

sub getEntries {
    my $self = shift;
    return unless ref $self->{_principals};
    return %{$self->{_principals}};
}

sub _addEntry {
    my $self = shift;
    my $principal = shift;
    my $rights = shift;
    return $self->{_principals}->{$principal} = $rights;
}

1;
