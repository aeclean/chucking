<<< "Assignment_2_Make_Melody_Make" >>>;
//Make a random bass melody
SinOsc left => dac.left;
SinOsc right => dac.right;

1.0 => left.gain;
1.0 => right.gain;

[26, 32, 38, 41, 53, 59, 65, 69, 80] @=> int scale[];

now + 30::second => time later;
while(now < later)
{
    //get a random note from scale for left Osc
    Math.mtof(scale[Math.random2(0, 8)]) => float leftFreq;
    //set the value for left Osc
    leftFreq => left.freq;
    
    //get a random note from scale for right Osc
    scale[Math.random2(0, 8)] + 80 => int rightFreq;
    //set the value for right Osc
    rightFreq => right.freq;
    
    //get a random value for left gain
    Math.random2f(0, 1) => float leftGain;
    //set the gain
    leftGain => left.gain;
    
    //get a random value for right gain
    Math.random2f(0, 1) => float rightGain;
    rightGain => right.gain;
    
    .25::second => now;
}