ModalBar one => dac.left;
ModalBar two => dac.right;

//set initial parameters
7 => one.preset;
4 => two.preset;
.9 => one.strikePosition => two.strikePosition;
60 => Std.mtof => one.freq;
64 => Std.mtof => two.freq;

fun void foo()
{
    while(true)
    {
        <<< "Foo!", "" >>>;
        1 => one.strike;
        250::ms => now;
    }
}

fun void bar()
{
    while(true)
    {
        <<< "Barrrr!!" >>>;
        1 => two.strike;
        1.0::second => now;
    }
}

//sport the function foo on new shred
spork ~ foo();
spork ~ bar();

//infinite time loop
// keep parent shred alive in order to child live
while(true) 1::second => now;
