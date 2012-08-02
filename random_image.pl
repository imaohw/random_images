#!/usr/bin/perl
#
# Create 2500 random images
#

use strict;
use warnings;

use GD;

for(my $i = 0; $i < 2500; $i++) {
    my $im = new GD::Image(1024,1024,1);
    for(my $x = 0; $x < 1024; $x++) {
        for(my $y = 0; $y < 1024; $y++) {
            my $color = $im->colorAllocate(int(rand(255)), int(rand(255)), int(rand(255)));
            $im->setPixel($x, $y, $color);
        }
    }

    open FILE, ">image$i.jpg" or die $!;
        binmode FILE;
        print FILE $im->jpeg(100);
    close FILE;
}
