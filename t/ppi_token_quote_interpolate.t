#!/usr/bin/perl -w

# Unit testing for PPI, generated by Test::Inline

use strict;
use lib ();
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		$FindBin::Bin = $FindBin::Bin; # Avoid a warning
		chdir catdir( $FindBin::Bin, updir() );
		lib->import(
			catdir('blib', 'arch'),
			catdir('blib', 'lib' ),
			catdir('lib'),
			);
	}
}

# Load the API to test
BEGIN { $PPI::XS_DISABLE = 1 }
use PPI;

# Execute the tests
use Test::More tests => 8;

# =begin testing string 8
{
my $Document = PPI::Document->new( \"print qq{foo}, qq!bar!, qq <foo>;" );
isa_ok( $Document, 'PPI::Document' );
my $Interpolate = $Document->find('Token::Quote::Interpolate');
is( scalar(@$Interpolate), 3, '->find returns three objects' );
isa_ok( $Interpolate->[0], 'PPI::Token::Quote::Interpolate' );
isa_ok( $Interpolate->[1], 'PPI::Token::Quote::Interpolate' );
isa_ok( $Interpolate->[2], 'PPI::Token::Quote::Interpolate' );
is( $Interpolate->[0]->string, 'foo', '->string returns as expected' );
is( $Interpolate->[1]->string, 'bar', '->string returns as expected' );
is( $Interpolate->[2]->string, 'foo', '->string returns as expected' );
}


1;