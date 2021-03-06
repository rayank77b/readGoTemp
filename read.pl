#!/usr/bin/perl
#
my $buf,number_read,$n46, $tmp1, $tmp2, $tmp3, $cnt,$tmp_low, $tmp_high;
my $temp, $real;

    open(DEV, "/dev/usb/hiddev0") || die "couldn't open device file";
    $number_read = read(DEV, $buf, 8);
    ($n46, $tmp1, $tmp2, $tmp3) = unpack("s s s s", $buf);

    $number_read = read(DEV, $buf, 8);
    ($n64, $tmp1, $cnt, $tmp2, $tmp3) = unpack("s s C C s", $buf);

    $number_read = read(DEV, $buf, 8);
    ($n46, $tmp1, $tmp_low, $tmp2, $tmp3) = unpack("s s C C s", $buf);

    $number_read = read(DEV, $buf, 8);
    ($n46, $tmp1, $tmp_high, $tmp2, $tmp3) = unpack("s s C C s", $buf);

    $number_read = read(DEV, $buf, 8);
    ($n46, $tmp1, $tmp2, $tmp3) = unpack("s s s s", $buf);
    $number_read = read(DEV, $buf, 8);
    ($n46, $tmp1, $tmp2, $tmp3) = unpack("s s s s", $buf);

    $temp = $tmp_high*255+$tmp_low;
    $real = $temp/110.0;  # simple calculation 100°~ 11200  0°~200
    printf("%d\n",$real);
    close DEV;