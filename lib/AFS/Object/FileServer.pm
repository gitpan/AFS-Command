#
# $Id: FileServer.pm,v 5.1 2003/11/05 22:52:39 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

package AFS::Object::FileServer;

use strict;

our @ISA = qw(AFS::Object);
our $VERSION = '1.4';

sub getPartitionNames {
    my $self = shift;
    return unless ref $self->{_partitions};
    return keys %{$self->{_partitions}};
}

sub getPartitions {
    my $self = shift;
    return unless ref $self->{_partitions};
    return values %{$self->{_partitions}};
}

sub getPartition {
    my $self = shift;
    my $partname = shift;
    return unless ref $self->{_partitions};
    return $self->{_partitions}->{$partname};
}

sub _addPartition {
    my $self = shift;
    my $partition = shift;
    unless ( ref $partition && $partition->isa("AFS::Object::Partition") ) {
	$self->_Croak("Invalid argument: must be an AFS::Object::Partition object");
    }
    return $self->{_partitions}->{$partition->partition()} = $partition;
}

1;
