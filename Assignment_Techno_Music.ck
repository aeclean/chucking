//techno music
SndBuf hihat => dac;
SndBuf kick => dac;
SndBuf snare => dac;
SndBuf melody => dac;

//load audio files
me.dir() + "/week3/audio/hihat_03.wav" => hihat.read;
me.dir() + "/week3/audio/kick_01.wav" => kick.read;
me.dir() + "/week3/audio/snare_02.wav" => snare.read;
me.dir() + "/week3/audio/stereo_fx_03.wav" => melody.read;

//set all audio as "mute"
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
melody.samples() => melody.pos;

0.2 => hihat.gain;

0 => int counter;

now => time moment;
now + 10::second => time limit;

while(true)
{
    counter%2 => int beat;
    
    if(beat == 0) {
        0 => kick.pos;
        0 => snare.pos;
        0 => melody.pos;
    }
    
    if (moment >= limit) {
        Math.random2f(.5, 1.0) => melody.rate;
        limit - 10::second => moment;
    }
    
    0 => hihat.pos;
    
    counter++;
    
    250::ms => now;
    
    <<< moment, limit >>>;
    moment + 250::ms => moment;
}