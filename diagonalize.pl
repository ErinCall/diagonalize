#! /usr/bin/perl -w

use strict;
$|++;
local $/;

use Getopt::Long;

GetOptions(
    'c|code-tags' => \my $code_tags,
);

my $filename = shift;
my $str;

print "Enter text\n";
my $str = <STDIN>;
my @words = split /\s/, $str;
for my $i ( 0 .. $#words) {
    my $word = $words[$i];
    my @word = split '', $word;
    for my $l ( 0 .. $#word){
        $words[$i] = ref $words[$i] ? $words[$i] : [];
        push @{$words[$i]}, (' ' x $l) . $word[$l];
    }
}
print '[code]' if $code_tags;
map { map {print $_; print "\n"} @$_; } @words;
print "[/code]\n" if $code_tags;
