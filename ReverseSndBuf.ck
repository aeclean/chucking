//sound chain
SndBuf mySound => dac;

me.dir() + "/audio/snare_01.wav" => string filename;
filename => mySound.read;

mySound.samples() => int numSamples;
<<< "samples: " + numSamples >>>;

while(true)
{
    numSamples => mySound.pos;
    -3.0 => mySound.rate;
    
    500::ms => now;
}