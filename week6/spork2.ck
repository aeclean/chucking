//shared objects
ModalBar modal => NRev reverb => dac.left;
ModalBar modal2 => NRev reverb2 => dac.right;

//set reverb mix
.1 => reverb.mix;
//modalbar parameters
7 => modal.preset;
.9 => modal.strikePosition;

//set reverb mix
.1 => reverb2.mix;
//modalbar parameters
3 => modal2.preset;
.9 => modal2.strikePosition;

fun void one()
{
    while(true)
    {
        //note!
        1 => modal.strike;
        300::ms => now;
        //note!
        .7 => modal.strike;
        300::ms => now;
        repeat(6)
        {
            .7 => modal.strike;
            100::ms => now;
        }
    }
}

fun void two()
{
    while(true)
    {
        150::ms => now;
        //note!
        1 => modal2.strike;
        300::ms => now;
        //note!
        .75 => modal2.strike;
        300::ms => now;
        //note!
        .5 => modal2.strike;
        300::ms => now;
        //note!
        .25 => modal2.strike;
        300::ms => now;
    }
}

spork ~ tune();
spork ~ one();
spork ~ two();

while(true) 1::second => now;

fun void tune()
{
    <<< "tune!" >>>;
    while(true)
    {
        //update frequency
        84 + Math.sin(now/second*Math.PI*2.5) * .5 => Std.mtof => modal.freq;
        //advance time
        5::ms => now;
    }
}