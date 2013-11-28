//Frequency Modulator
SinOsc mod => SinOsc car => ADSR env => dac;
(0.1::second, 0.01::second, 0.6, 0.2::second) => env.set;

2 => car.sync;
.4 => car.gain;
10000 => mod.gain;

//infinite loop
while(true)
{
    Math.random2f(100.0, 1000.0) => car.freq;
    Math.random2f(100.0, 1000.0) => mod.freq;
    1 => env.keyOn; //turns envelope on
    0.2::second => now;
    1 => env.keyOff; //turns envelope off
    0.2::second => now;
}