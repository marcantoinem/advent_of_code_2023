use warnings;
use strict;
use Set::Scalar;

my $filename = 'input.txt';

open(FH, '<', $filename) or die $!;

my $sum = 0;

while(<FH>){
    my $winningnumber = Set::Scalar->new;
    my $mynumber = Set::Scalar->new;
    my $i = 2;
    my @list = split ' ', $_;
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
    if ($value != 0) {
        $sum += 2 ** ($value - 1);
    }
}

print $sum, "\n";

close(FH);