#
# $Id: Makefile.PL,v 1.3 2003/08/14 18:37:43 wpm Exp $
#
# (c) 2003 Morgan Stanley and Co.
# See ..../src/LICENSE for terms of distribution.
#

require 5.6.0;

use ExtUtils::MakeMaker;

WriteMakefile
  (
   NAME			=> 'AFS::Command',
   VERSION_FROM		=> 'lib/AFS/Command/Base.pm', # finds $VERSION
   PREREQ_PM         	=> {},	# e.g., Module::Name => 1.1
   AUTHOR     		=> 'W. Phillip Moore <Phil.Moore@MorganStanley.com>',
  );

