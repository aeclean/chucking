//Sound Chain
SndBuf snare => dac;
SndBuf kick => dac;

//load sound to buffer
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/kick_01.wav" => kick.read;

snare.samples() => snare.pos;
kick.samples() => kick.pos;

//Chords for melody
SinOsc chord[3];
Gain master => Chorus r => dac;
0.5 => master.gain;

//apply the effects in all oscilators
for(0 => int i; i < chord.cap(); i++)
{
    chord[i] => master;
    .3 => chord[i].gain;
}

[51, 53, 55, 56, 58, 60, 61, 63] @=> int notes[];
//melody indication: 0 for major chords, 1 for minor chords
[0, 0, 1, 0] @=> int chordMelody[];
//the chord sequency inside the scale. Using arrat indices
[0, 1, 4, 3] @=> int chordSequency[];

//drum sequency
[0, 0, 1, 0] @=> int drum[];

0 => int counter;
fun void playNoteFromScale(int index)
{
    "major" => string quality;
    if(chordMelody[index] == 0) {
        "major" => quality;
    } else {
        "major" => quality;
    }
    
    playChord(notes[chordSequency[index]], quality, .6);
    .6::second => now;
}

//function to play major or minor chord
fun void playChord(int root, string quality, float length)
{
    //root - tonica
    Std.mtof(root) => chord[0].freq;
    
    //thirth - terceira
    if(quality == "major") {
        Std.mtof(root+4) => chord[1].freq;
    } else if(quality == "minor") {
        Std.mtof(root+3) => chord[1].freq;
    } else {
        <<< "Must specify major or minor" >>>;
    }
    
    //fifth - quinta
    Std.mtof(root+7) => chord[2].freq;
    
    length::ms => now;
}

//the drum sound chain
fun int playDrum(int index)
{
    if(0 == drum[index]) { //play kick
        0 => kick.pos;
    }
    else if(1 == drum[index])
    {
       0 => snare.pos; 
    }
}

//limit the music by thirty seconds
now + 30::second => time later;

while(now < later)
{
    playNoteFromScale(counter);    
    playDrum(counter);
    
    counter+1 => counter;
    if(counter >= chordMelody.cap()) {
        0 => counter;
    }
}
