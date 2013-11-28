///Sound Chain
Noise noise => ADSR env => Delay d => dac;
d => d; //feedback
0.99 => d.gain;
(0.005::second, 0.001::second, 0.0, 0.001::second) => env.set;
1 => env.keyOn;
0.005::second => d.delay;
2.0::second => now;

