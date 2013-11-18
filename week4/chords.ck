//Sound chain
TriOsc chord[3];
Gain master => dac;

for(0 => int i; i < chord.cap(); i++)
{
    //user array to chuck unit generator to master
    chord[i] => master;
    1.0/chord.cap() => chord[i].gain;
}

//root: the base chord note
//quality: if minor or major note
//length: duration of the chord
fun void playChord(int root, string quality, float length)
{
    //major or minor chord
    
    //root - tonica
    Std.mtof(root) => chord[0].freq;
    
    //thirth - terceira
    if(quality == "major")
    {
        Std.mtof(root+4) => chord[1].freq;
    }
    else if(quality == "minor")
    {
        Std.mtof(root+3) => chord[1].freq;
    }
    else
    {
        <<< "Must specify major or minor" >>>;
    }
    
    //fifth - quinta
    Std.mtof(root+7) => chord[2].freq;
    
    length::ms => now;
}

//main program
while(true)
{
    playChord(Math.random2(60, 72), "major", 250.0);
    playChord(Math.random2(60, 72), "minor", 500.0);
}