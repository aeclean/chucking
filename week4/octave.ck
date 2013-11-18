SinOsc s => dac;
.2 => s.gain;
SinOsc t => dac;
.2 => t.gain;
SinOsc u => dac;
.2 => u.gain;

//main program
for(20 => float i; i < 500; i+.5 => i)
{
    i => s.freq;
    octave(i) => t.freq;
    fifth(i) => u.freq;
    10::ms => now;
}


fun float octave(float freq)
{
    return (freq*2);
}


fun float fifth(float freq)
{
    return freq*1.5;
}