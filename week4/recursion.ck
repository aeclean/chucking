//recursion
fun int fatorial(int x)
{
    if(x <= 1)
    {
        return 1;
    }
    else
    {
        return (x*fatorial(x-1));
    }
}

//main program
<<< fatorial(6) >>>;
