//Sound Chain
adc => PitShift pit => dac;
0.9 => pit.shift;

while(true)
{
    1.0::second => now;
}