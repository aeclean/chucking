//sound chain
//Clarinet
Flute f => dac;

330 => f.freq;
//0.4 => c.gain;

while(true)
{
    1.0 => f.noteOn; //start blowing
    Math.random2f(0.1, 0.2) => f.jetDelay;
    0.2::second => now;
    1 => f.noteOff;
    0.5::second => now;
}
