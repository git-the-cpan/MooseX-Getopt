package MooseX::Getopt::Meta::Attribute;
BEGIN {
  $MooseX::Getopt::Meta::Attribute::AUTHORITY = 'cpan:STEVAN';
}
{
  $MooseX::Getopt::Meta::Attribute::VERSION = '0.38';
}
# ABSTRACT: Optional meta attribute for custom option names

use Moose;
use Moose::Util::TypeConstraints;

extends 'Moose::Meta::Attribute'; # << Moose extending Moose :)
   with 'MooseX::Getopt::Meta::Attribute::Trait';

no Moose;

# register this as a metaclass alias ...
package # stop confusing PAUSE
    Moose::Meta::Attribute::Custom::Getopt;
sub register_implementation { 'MooseX::Getopt::Meta::Attribute' }

1;


__END__
=pod

=encoding utf-8

=head1 NAME

MooseX::Getopt::Meta::Attribute - Optional meta attribute for custom option names

=head1 SYNOPSIS

  package App;
  use Moose;

  with 'MooseX::Getopt';

  has 'data' => (
      metaclass => 'MooseX::Getopt::Meta::Attribute',
      is        => 'ro',
      isa       => 'Str',
      default   => 'file.dat',

      # tells MooseX::Getopt to use --somedata as the
      # command line flag instead of the normal
      # autogenerated one (--data)
      cmd_flag  => 'somedata',

      # tells MooseX::Getopt to also allow --moosedata,
      # -m, and -d as aliases for this same option on
      # the commandline.
      cmd_aliases => [qw/ moosedata m d /],

      # Or, you can use a plain scalar for a single alias:
      cmd_aliases => 'm',
  );

=head1 DESCRIPTION

This is a custom attribute metaclass which can be used to specify a
the specific command line flag to use instead of the default one
which L<MooseX::Getopt> will create for you.

This is certainly not the prettiest way to go about this, but for
now it works for those who might need such a feature.

=head2 Custom Metaclass alias

This now takes advantage of the Moose 0.19 feature to support
custom attribute metaclass aliases. This means you can also
use this as the B<Getopt> alias, like so:

  has 'foo' => (metaclass => 'Getopt', cmd_flag => 'f');

=head1 METHODS

=head2 B<cmd_flag>

Changes the commandline flag to be this value, instead of the default,
which is the same as the attribute name.

=head2 B<cmd_aliases>

Adds more aliases for this commandline flag, useful for short options
and such.

=head2 B<has_cmd_flag>

=head2 B<has_cmd_aliases>

=head1 AUTHORS

=over 4

=item *

Stevan Little <stevan@iinteractive.com>

=item *

Brandon L. Black <blblack@gmail.com>

=item *

Yuval Kogman <nothingmuch@woobling.org>

=item *

Ryan D Johnson <ryan@innerfence.com>

=item *

Drew Taylor <drew@drewtaylor.com>

=item *

Tomas Doran <bobtfish@bobtfish.net>

=item *

Florian Ragwitz <rafl@debian.org>

=item *

Dagfinn Ilmari Mannsåker <ilmari@ilmari.org>

=item *

Ævar Arnfjörð Bjarmason <avar@cpan.org>

=item *

Chris Prather <perigrin@cpan.org>

=item *

Karen Etheridge <ether@cpan.org>

=item *

Jonathan Swartz <swartz@pobox.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Infinity Interactive, Inc.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

