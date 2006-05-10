package PPI::Structure::Subscript;

=pod

=head1 NAME

PPI::Structure::Subscript - Braces that represent an array or hash subscript

=head1 SYNOPSIS

  # The end braces for all of the following are subscripts
  $foo->[...]
  $foo[...]
  $foo{...}[...]
  $foo->{...}
  $foo{...}
  $foo[]{...}

=head1 INHERITANCE

  PPI::Structure::Subscript
  isa PPI::Structure
      isa PPI::Node
          isa PPI::Element

=head1 DESCRIPTION

C<PPI::Structure::Subscript> is the class used for square and curly
braces that specify one element of an array or hash (or a slice/subset
of an array or hash)

=head1 METHODS

C<PPI::Structure::Subscript> has no methods beyond those provided by the
standard L<PPI::Structure>, L<PPI::Node> and L<PPI::Element> methods.

Got any ideas for methods? Submit a report to rt.cpan.org!

=cut

use strict;
use base 'PPI::Structure';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '1.113';
}

1;

=pod

=head1 SUPPORT

See the L<support section|PPI/SUPPORT> in the main module

=head1 AUTHOR

Adam Kennedy, L<http://ali.as/>, cpan@ali.as

=head1 COPYRIGHT

Copyright (c) 2001 - 2005 Adam Kennedy. All rights reserved.

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut
