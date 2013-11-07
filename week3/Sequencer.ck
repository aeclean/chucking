//sequencer
Gain master => Chorus c => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

.1 => master.gain;

//load drum parts
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

.5 => hihat.gain;

0 => int counter;

while(true)
{
    counter % 4 => int beat;
    if(beat == 0 || beat == 4)
    {
        0 => kick.pos;
    }
    if(beat == 2 || beat == 6)
    {
        0 => snare.pos;
        Math.random2f(.6, 1.4) => snare.rate;
    }
    
    0 => hihat.pos;
    Math.random2f(0.2, 1.0) => hihat.rate;
    
    counter++;
    
    250::ms => now;
}
