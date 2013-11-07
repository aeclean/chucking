//sample management
SndBuf snare => dac;

//
string snare_samples[3];

//load samples into array
me.dir() + "/audio/kick_01.wav" => snare_samples[0]; 
me.dir() + "/audio/kick_02.wav" => snare_samples[1];
me.dir() + "/audio/kick_03.wav" => snare_samples[2];

while(true)
{
    snare_samples[Math.random2(0, snare_samples.cap()-1)] => snare.read;
    200::ms => now;
}