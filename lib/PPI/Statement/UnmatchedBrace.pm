package PPI::Statement::UnmatchedBrace;

=pod

=head1 NAME

PPI::Statement::UnmatchedBrace - Isolated unmatched brace

=head1 SYNOPSIS

  sub foo {
      1;
  }
  
  } # <--- This is an unmatched brace

=head1 INHERITANCE

  PPI::Statement::UnmatchedBrace
  isa PPI::Statement
      isa PPI::Node
          isa PPI::Element

=head1 DESCRIPTION

The C<PPI::Statement::UnmatchedBrace> class is a miscellaneous utility
class. Objects of this type should be rare, or not exist at all in normal
valid L<PPI::Document> objects.

It can be either a round ')', square ']' or curly '}' brace, this class
does not distinguish. Objects of this type are only allocated at a
structural level, not a lexical level (as they are lexically invalid
anyway).

The presence of a C<PPI::Statement::UnmatchedBrace> indicated a broken
or invalid document. Or maybe a bug in PPI, but B<far> more likely a
broken Document. :)

=head1 METHODS

C<PPI::Statement::UnmatchedBrace> has no additional methods beyond the
default ones provided by L<PPI::Statement>, L<PPI::Node> and
L<PPI::Element>.

=cut

use strict;
use base 'PPI::Statement';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '1.111';
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