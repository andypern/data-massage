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

open(INPUT, $inputfile);

my @input = <INPUT>;
close(INPUT);

my $iteration = 0;

open (OUTPUT, ">>", $outputfile);
foreach my $line(@input){
	chomp($line);
	$line =~ s/^/$iteration,/;
	print OUTPUT "$line\n";
	$iteration += 1;
}

close(OUTPUT);


