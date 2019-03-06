# readGoTemp
read Temperature from GoTemp and hiddev0


od -x /dev/usb/hiddev0
0000000 0046 0001 0001 0000 0046 0001 fff6 ffff
0000020 0046 0001 0030 0000 0046 0001 000c 0000
0000040 0046 0001 ffb0 ffff 0046 0001 000b 0000
*
 
wobei
0x0c: byte count ist  Hier 0c:f6
0x0024: sind die niedriege byte von temp Hier: 0x0024:30
0x002c: sind die high byte von temp, Hier: 0x0c
 
Umrechnung (+-2°C): y= x/110.0;
da 11200 war bei 100°C gemessen
200 war bei 0°C gemessen
Kalibrierung ist noch nötig.
