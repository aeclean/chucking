//play all samples. Get audio file from command line argument
me.dir() + "/week3/audio/" + me.arg(0) => string filename;

SndBuf s => dac;
filename => s.read;
0 => s.pos;

5::second => now;
<<< filename >>>;
