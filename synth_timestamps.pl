#!/usr/bin/perl -w
use strict;
use DateTime;

my $start_time = 1404205200;
#my $end_time = 1404206200;

#my $end_time = 1404291600;
my $end_time = 1404209989;
for my $ts ($start_time .. $end_time) {
	#my $divisor = $ts / 5;
	#print "$divisor\n";
	#if($divisor =~ /^[+-]?\d+\z/) {
		#print "$ts\n";
		my $dt = DateTime->from_epoch( epoch => $ts);
		# #my $datestamp = $dt->month . "/" . $dt->day . "/" . $dt->year . "," . $dt->hms;
		my $datestamp = $dt->mdy("/") . "," . $dt->hms;
		print "$datestamp\n";
	#}
}
 