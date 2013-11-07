//sound chain
SndBuf mySound => dac;

//read file
me.dir() + "/audio/stereo_fx_01.wav" => string filename;

<<< filename >>>;
filename => mySound.read;

while(true)
{
    Math.random2f(0.5, 3.0) => float random;
    random =>  mySound.rate;
    0 => mySound.pos;
    1::second => now;
}