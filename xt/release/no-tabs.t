use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.05

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/MooseX/Getopt.pm',
    'lib/MooseX/Getopt/Basic.pm',
    'lib/MooseX/Getopt/Dashes.pm',
    'lib/MooseX/Getopt/GLD.pm',
    'lib/MooseX/Getopt/Meta/Attribute.pm',
    'lib/MooseX/Getopt/Meta/Attribute/NoGetopt.pm',
    'lib/MooseX/Getopt/Meta/Attribute/Trait.pm',
    'lib/MooseX/Getopt/Meta/Attribute/Trait/NoGetopt.pm',
    'lib/MooseX/Getopt/OptionTypeMap.pm',
    'lib/MooseX/Getopt/ProcessedArgv.pm',
    'lib/MooseX/Getopt/Strict.pm'
);

notabs_ok($_) foreach @files;
done_testing;
