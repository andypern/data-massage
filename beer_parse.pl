#!/usr/bin/perl -w
use strict;

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



open (OUTPUT, ">>", $outputfile);
while ( my $line = <$fh>) {
	#if line contains shit..then grab what we want and insert with a trailing comma
	#unless the line ends with a slew of whitespace..meaning its the last field of a record
	#in that case, don't insert a comma at the end of the line
	# if line is blank, then insert a newline into the file.
	
	if($line =~ /([a-zA-Z]+\/[a-zA-Z]+: )(.+)([\s+][^\n])$/){
		chomp($line);
		print OUTPUT "\"$2\"";
	}
	elsif($line =~ /([a-zA-Z]+\/[a-zA-Z]+: )(.+)/){
		chomp($line);
		print OUTPUT "\"$2\",";
	}elsif($line =~ /^\s*$/){
		print OUTPUT "\n";
	}
	
}

close(OUTPUT);


