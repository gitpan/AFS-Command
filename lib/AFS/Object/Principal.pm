#
# $Id: Principal.pm,v 3.1 2003/10/08 21:08:24 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

package AFS::Object::Principal;

use strict;

our $VERSION = '1.2';

sub _addOwned {
    my $self = shift;
    my $owned = shift;
    return $self->{_owned}->{$owned}++;
}

sub getOwned {
    my $self = shift;
    return unless ref $self->{_owned};
    return keys %{$self->{_owned}};
}

sub _addMembership {
    my $self = shift;
    my $membership = shift;
    return $self->{_membership}->{$membership}++;
}

sub getMembership {
    my $self = shift;
    return unless ref $self->{_membership};
    return keys %{$self->{_membership}};
}

1;
