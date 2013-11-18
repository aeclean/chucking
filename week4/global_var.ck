//global variable
0 => int x;

//
function void funOne()
{
    x+1 => x; //add one to x
    1::second => now;
    <<< x >>>;
}

function void funTwo()
{
    x-1 => x;//subtract 1
    1::second => now;
    <<< x >>>;
}

//main program
//infinite loop
while(true)
{
    funOne();
    funTwo(); //wait until funOne complete
}