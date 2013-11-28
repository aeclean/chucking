//sound chain
Mandolin m => dac;
1.0 => m.noteOn; //plucks string
0.4 => m.stringDetune;
2.0::second => now;
