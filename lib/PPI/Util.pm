package PPI::Util;

# Provides some common utility functions that can be imported

use strict;
use base 'Exporter';
use Digest::MD5   ();
use Params::Util '_INSTANCE',
                 '_SCALAR';

use vars qw{$VERSION @EXPORT_OK};
BEGIN {
	$VERSION   = '1.111';
	@EXPORT_OK = qw{_Document _slurp};
}

# Down here so we don't get into circular troubles
use PPI::Document ();





#####################################################################
# Functions

# Allows a sub that takes a L<PPI::Document> to handle the full range
# of different things, including file names, SCALAR source, etc.
sub _Document {
	shift if @_ > 1;
	return undef unless defined $_[0];
	return PPI::Document->new( shift ) unless ref $_[0];
	return PPI::Document->new( shift ) if _SCALAR($_[0]);
	return shift if _INSTANCE($_[0], 'PPI::Document');
	undef;
}

# Provide a single _slurp implementation
sub _slurp {
	my $file = shift;
	local $/ = undef;
	open( PPIUTIL, '<', $file ) or return "open($file) failed: $!";
	my $source = <PPIUTIL>;
	close( PPIUTIL ) or return "close($file) failed: $!";
	\$source;
}

# Provides a version of Digest::MD5's md5hex that explicitly
# works on the unix-newlined version of the content.
sub md5hex {
	my $string = shift;
	$string =~ s/(?:\015{1,2}\012|\015|\012)/\015/gs;
	Digest::MD5::md5_hex($string);
}

# As above but slurps and calculates the id for a file by name
sub md5hex_file {
	my $file    = shift;
	my $content = _slurp($file);
	return undef unless ref $content;
	$$content =~ s/(?:\015{1,2}\012|\015|\012)/\n/gs;
	md5hex($$content);
}

1;