//samples
adc => Gain g => blackhole;

while(true)
{
    if(adc.last() > 0.1) //too loud
    {
        <<< "Alto!" >>>;
    }
    1.0::samp => now;
}