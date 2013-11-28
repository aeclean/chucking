//sound chain
PulseOsc p => dac;
.3 => p.gain;

while(true)
{
    Math.random2f(0.01, 0.5) => p.width;
    0.1::second => now;
    
    if(Math.random2(0,1) == 1)
    {
        89 => p.freq;
    }
    else
    {
        100 => p.freq;
    }
}