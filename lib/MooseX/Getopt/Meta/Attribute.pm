
package MooseX::Getopt::Meta::Attribute;
use Moose;
use Moose::Util::TypeConstraints;

our $VERSION   = '0.04';
our $AUTHORITY = 'cpan:STEVAN';

extends 'Moose::Meta::Attribute'; # << Moose extending Moose :)

has 'cmd_flag' => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_cmd_flag',
);

# This subtype is to support scalar -> arrayref coercion
#  without polluting the built-in types
subtype '_MooseX_Getopt_CmdAliases' => as 'ArrayRef';
    
coerce '_MooseX_Getopt_CmdAliases'
    => from 'Str'
        => via { [$_] };

has 'cmd_aliases' => (
    is        => 'rw',
    isa       => '_MooseX_Getopt_CmdAliases',
    predicate => 'has_cmd_aliases',
    coerce    => 1,
);

no Moose;

# register this as a metaclass alias ...
package Moose::Meta::Attribute::Custom::Getopt;
sub register_implementation { 'MooseX::Getopt::Meta::Attribute' }

1;

__END__

=pod

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

These methods are of little use to most users, they are used interally 
within L<MooseX::Getopt>.

=over 4

=item B<cmd_flag>

Changes the commandline flag to be this value, instead of the default,
which is the same as the attribute name.

=item B<cmd_aliases>

Adds more aliases for this commandline flag, useful for short options
and such.

=item B<has_cmd_flag>

=item B<has_cmd_aliases>

=item B<meta>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no 
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

Brandon L. Black, E<lt>blblack@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
