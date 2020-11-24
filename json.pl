#!/usr/bin/perl -w
use strict;
use warnings;
open(FILE,"json.csv") or die('Falha ao abrir ARQUIVO!');
open OUTPUT,">qmean_zscore.csv";
while (my $line=<FILE>){
	chomp $line;
	my @ID=split /[.\/]/, $line;
	my $code=$ID[6];
	system ("wget $line");
	open(CODE,"$code.json") or die('Falha ao abrir ARQUIVO!');
	while (my $ln=<CODE>){
		if($ln=~/qmean4_z_score/){
			my @z_score= split /[:,]/, $ln;
			print OUTPUT "$code;".@z_score[1]."\n";
		}
	}
	close CODE;
}
close FILE;

