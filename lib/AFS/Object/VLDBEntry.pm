#
# $Id: VLDBEntry.pm,v 3.1 2003/10/08 21:08:26 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

package AFS::Object::VLDBEntry;

use strict;

our @ISA = qw(AFS::Object);
our $VERSION = '1.2';

sub getVLDBSites {
    my $self = shift;
    return unless ref $self->{_sites};
    return @{$self->{_sites}};
}

sub _addVLDBSite {
    my $self = shift;
    my $site = shift;
    unless ( ref $site && $site->isa("AFS::Object::VLDBSite") ) {
	$self->_Croak("Invalid argument: must be an AFS::Object::VLDBSite object");
    }
    return push( @{$self->{_sites}}, $site );
}

1;
