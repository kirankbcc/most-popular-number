#!/usr/bin/perl

##########################################
# FileName: mostPopularNumber.pl
# Description: Generate most Popular Number
#
# CreatedBy: Kiran Babu Chinnam on 21-11-2018
# ModifiedBy: Kiran Babu Chinnam on 21-11-2018
##########################################

use strict;
use warnings;

##########################################
# uncomment these lines if you have to read from a file (single value per line)
##########################################
#my $file = "./csv2.txt";
#open(FH, "<$file");
#my @arr = <FH>;

##########################################
# Read from array
##########################################
my @arr = (1,2,3,23,32,43,44,34,43,44,44,54,43,66);
my %pop;

foreach my $val(@arr)
{
	my $num = grep(/\b$val\b/, @arr);
	push @{$pop{$num}},$val if(!grep/$val/,@{$pop{$num}});
}
my $fin = (sort {$b <=> $a} keys %pop)[0];

my $pluN = (scalar @{$pop{$fin}})>1?'s':'';
my $pluT = $fin>1?'s':'';
my $vrb = (scalar @{$pop{$fin}})>1?'are':'is';
my $popout = join ',', @{$pop{$fin}};

print "\nInput: ".join "-",@arr;
print "\nOutput: $popout $vrb the most popular number$pluN, repeated for $fin time$pluT.\n\n";
