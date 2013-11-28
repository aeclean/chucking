SinOsc vibrato => SawOsc violin => ADSR env => dac;
(.5::second, 1.0::second, .6, .5::second) => env.set;

//change pitch
660.0 => violin.freq;
//vribrato frequency
6.0 => vibrato.freq;
//set sync mode to FM (2)
2 => violin.sync;

10 => vibrato.gain;

.4 => violin.gain;

1 => env.keyOn; //turns envelope on

2.0::second => now;

1 => env.keyOff; //turns envelope off
 
2.0::second => now;