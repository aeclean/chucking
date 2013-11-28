//sound chain
Impulse imp => ResonZ filter => dac;

//set frequency
800.0 => filter.freq;
400 => filter.Q;

while(true)
{
    //generate 1 for one sample
    200.0 => imp.next;
    Math.random2f(0.05, 0.02)::second => now;
    Math.random2f(1000, 3000) => filter.freq;
}