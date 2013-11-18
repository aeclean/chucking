//sound chain
SinOsc s => dac;

[60, 62, 63, 65, 63, 64, 65, 58, 57] @=> int A[];

for(0 => int i; i < A.cap(); i++)
{
    Std.mtof(A[i]) => s.freq;
    swell(.4, 1.0, .05);
    100::ms => now;
}


fun void swell(float begin, float end, float grain)
{
    //volume sweller
    for(begin => float j; j < end; j+grain => j)
    {
        j => s.gain;//set volume
        .01::second => now;//advance time
    }
    
    for(end => float k; k > begin; k-grain => k)
    {
        k => s.gain;
        .01::second => now;
    }
}


