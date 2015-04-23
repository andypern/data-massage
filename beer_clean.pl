#!/usr/bin/perl -w
#
#to clean up 'transformed2.csv' file, which has some entries that don't have an ABV
#
use strict;
use Text::CSV;

my $inputfile = $ARGV[0];

unless(-e $inputfile) {
	die "you need to specify an input file\n";
}

my $outputfile = $ARGV[1];

if(-e $outputfile) {
	print "deleting existing $outputfile\n";
	unlink $outputfile;
}else {
	system("touch $outputfile");
}

open(my $fh, $inputfile);

#my @input = <INPUT>;
#close(INPUT);

my $parser = Text::CSV->new({
    quote_null => 0,
    empty_is_undef => 1 });


open (OUTPUT, ">>", $outputfile);
while ( my $line = <$fh>) {
	
	chomp($line);
    if ($parser->parse($line)) {
        my @columns = $parser->fields();
		
		if($columns[3] =~/[0-9]+\.[0-9]+/){
			print OUTPUT "$line\n";
		}	
	
	}
}

close(OUTPUT);


