//sound chain
SinOsc s => dac;

fun float halfValue(float original)
{
    return (original * .5);
}

<<< "Full Gain: ", s.gain() >>>;

1::second => now;
halfValue(s.freq()) => s.freq;
1::second => now;

//Sound Chain