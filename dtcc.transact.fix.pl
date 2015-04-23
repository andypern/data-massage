#!/usr/bin/perl -w

use strict;

my $infile = "andyp-create-transact";
my $output_file = "create-transact-fixed";
if(! -e $output_file) {
    `touch $output_file`;
}
open(OUTPUT, ">$output_file");

open(INFILE, "<", $infile) or die "can't open $infile: $!";

my $line;

while (defined ($line = <INFILE>)) {
	chomp($line);
	if($line =~/(\w+) character\(([0-9]+)\),/){
		my $colname = $1;
		my $length = $2;
		print OUTPUT "cast($colname as varchar($length)) as $colname,\n";
	}elsif($line =~/(\w+) date,/){
		my $colname = $1;
		print OUTPUT "cast($colname as varchar(30)) as $colname,\n";
	}elsif($line =~/(\w+) numeric\(([0-9]+),.+,/) {
		my $colname = $1;
		my $length = $2;
		print OUTPUT "cast($colname as float($length)) as $colname,\n";
	}elsif($line =~/(\w+) character varying\(([0-9]+)\)/){
		my $colname = $1;
		my $length = $2;
		print OUTPUT "cast($colname as varchar($length)) as $colname,\n";
	}elsif($line =~/(\w+) character varying,/){
		my $colname = $1;
		print OUTPUT "cast($colname as varchar(255)) as $colname,\n";
	}elsif($line =~/(\w+) text,/){
		my $colname = $1;
		print OUTPUT "cast($colname as varchar(255)) as $colname,\n";
	}else {
		print OUTPUT "$line\n";
	}
}
