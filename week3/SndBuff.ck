//SndBuff
SndBuf mySound => Pan2 p => dac;
//file path
me.dir() => string path;

//define filename
path + "/audio/snare_01.wav" => string filename;

//open up sound file
filename => mySound.read;
<<< mySound.pos >>>;

//control
.8 => mySound.gain;
0 => mySound.pos;
1.0 => mySound.rate;

//infinite loop
while(true)
{
    Math.random2f(0.2,0.8) => mySound.gain;
    Math.random2f(0.5,6.0) => mySound.rate;
    Math.random2f(-1.0, 1.0) => p.pan;
    
    0 => mySound.pos;
    100::ms => now;
}