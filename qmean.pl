#!/usr/bin/perl -w
use strict;
use warnings;
# Create a user agent object
use LWP::UserAgent;
use HTTP::Request;
my $ua = LWP::UserAgent->new;
my $url = 'https://swissmodel.expasy.org/qmean/submit/';

# The name of the file input field on the HTML form/
# You'll need to change this to whatever the correct name is.
my $file_input = 'structure';

open JSON,">json.csv";
open LOG,">log.csv";
open(FILE,"100-best.txt") or die('Falha ao abrir ARQUIVO!');
my $i=0;
while (my $line=<FILE>){	
	chomp $line;
	# Path to the local file that you want to upload
	my $file_path = "/home/allan/NR-11-19/Modelagem/Cluster_24/$line";
	my $req = $ua->post($url,
	Content_Type => 'multipart/form-data',
	Content => [
  	$file_input => [ $file_path ],
  	email => 'pires.allansilva@gmail.com',
  	method => 'qmean',
	project => 'classI',
  	],
	);
	my $json="";
	# Check the outcome of the response
	if ($req->is_success) {
		print LOG "$line;It's workin, bitch";
		print "It's workin, bitch\n";
		$json = $req->content;		
		my @json1 = split /,/,$json;
		print JSON $json1[0];
		$i=0;
	}else{
		if($i<10){
			redo;
			$i++;		
			print $req->status_line, "n";
		}			
	}
	
}
close JSON;
close FILE;
close LOG;
