//Sound chain
SndBuf click => dac;
SndBuf kick => dac;

//open sound files
me.dir() + "/../audio/kick_01.wav" => kick.read;
me.dir() + "/../audio/snare_03.wav" => click.read;

click.samples() => click.pos;
kick.samples() => kick.pos;

[1, 0, 0, 0, 1, 0, 0, 0] @=> int kick_ptrn_1[];
[1, 0, 1, 0, 1, 0, 1, 0] @=> int click_ptrn_1[];

[0, 0, 1, 0, 0, 0, 1, 0] @=> int kick_ptrn_2[];
[1, 1, 1, 1, 1, 1, 1, 1] @=> int click_ptrn_2[];

[0, 1, 1, 0, 0, 0, 1, 1] @=> int kick_ptrn_3[];
[1, 1, 1, 1, 1, 1, 1, 1] @=> int click_ptrn_3[];


fun void section(int kickArray[], int clickArray[], float beatTime)
{
    //sequencer for bass drum and snare drum beats
    for(0 => int i; i < kickArray.cap(); i++)
    {
        //if 1 in the array than play kick
        if(kickArray[i] == 1)
        {
            0 => kick.pos;
        }
        //if 1 in array than play click
        if(clickArray[i] == 1)
        {
            0 => click.pos;
        }
        
        beatTime::second => now;
    }
}

//main program
while(true)
{
    //Procedural - ABA form
    //section(kick_ptrn_1, click_ptrn_1, .2);
    //section(kick_ptrn_2, click_ptrn_2, .2);
    section(kick_ptrn_3, click_ptrn_3, .2);
}