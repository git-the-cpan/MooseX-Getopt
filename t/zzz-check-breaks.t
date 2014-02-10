use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::CheckBreaks 0.002

use Test::More;

SKIP: {
    eval 'require Moose::Conflicts; 1' and Moose::Conflicts->check_conflicts;
    if ($INC{'Moose/Conflicts.pm'}) {
        diag $@ if $@;
        pass 'conflicts checked via Moose::Conflicts';
    }
    else {
        skip 'no Moose::Conflicts module found', 1;
    }
}

pass 'no x_breaks data to check';

done_testing;
