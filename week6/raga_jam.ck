//Raga Jam
Sitar s => Gain master => dac;

//global variables
[62, 63, 65, 67, 69, 70, 72, 74] @=> int raga[];

0.2 => float beattime;

for(0 => int i; i < raga.cap(); i++)
{
    Std.mtof(raga[i]) => s.freq;
    1::second => now;
}