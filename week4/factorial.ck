//Factorial func
SndBuf snare => dac;

//load file
me.dir() + "/../audio/snare_01.wav" => snare.read;

//set pos 0
snare.samples() => snare.pos;

fun int drumRoll(int index)
{
    <<< index >>>;
    if(index >= 1)
    {
        //play with duration of index
        0 => snare.pos;
        index::ms => now;
        //call drumRoll recursively, reducing index
        return drumRoll(index-1);
    }
    else if(index == 0)
    {
        return 0;
    }
}

//main program
//call drumRoll recursivley
drumRoll(120);