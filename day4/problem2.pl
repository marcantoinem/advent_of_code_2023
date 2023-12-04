use warnings;
use strict;
use Set::Scalar;

my $filename = "input.txt";

open(FH, '<', $filename) or die $!;

my @result = ();
my @stacking_cards = ();

while(<FH>){
    my $winningnumber = Set::Scalar->new;
    my $mynumber = Set::Scalar->new;
    my $i = 2;
    my @list = split " ", $_;
    while ($list[$i] ne "|") {
        $winningnumber->insert($list[$i]);
        $i += 1;
    }
    $i += 1;
    while ($i <= $#list) {
        $mynumber->insert($list[$i]);
        $i += 1;
    }
    my $mywinningnumber = $winningnumber->intersection($mynumber);
    my $value =  $mywinningnumber->size();
    push(@stacking_cards, 1);
    push(@result, $value);
}

my $sum = 0;
my $i = 0; #last element doesn't have any card to win
while ($i <= $#result) {
    my $j = $i + $result[$i];
    if ($j > $#result) {
        $j = $#result;
    }
    while ($j > $i) {
        $stacking_cards[$j] += $stacking_cards[$i];
        $j -= 1;
    }
    $sum += $stacking_cards[$i];
    $i += 1;
}

print $sum, "\n";
close(FH);