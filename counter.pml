/*
    terminate counter example
    $ spin counter.pml
    $ sping -a counter.pml && gcc pan.c && ./a.out
*/

byte count = 10;

proctype counter() {
    do
    :: (count != 0) ->
        if
        :: count++;
        :: count--;
        fi;
    :: (count == 0) -> break;
    od
}

init { run counter() }
