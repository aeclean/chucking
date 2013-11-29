//sound chain
//Shakers - common sound effects
// * something like a percussion
Shakers s => dac;

//for(0 => int i; i < 23; i++)
//{
//    i => s.preset;
//    1 => s.noteOn;
//    1.2::second => now;
//}

17 => s.preset;

while(true)
{
    Math.random2f(10.0, 128.0) => s.objects;
    //decay
    Math.random2f(0.0, 1.0) => s.decay;
    1.0 => s.energy;
    
    0.5::second => now;
}