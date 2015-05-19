/* mutex sample in http://spinroot.com/spin/Doc/SpinTutorial.pdf */

byte turn[2];
byte mutex;

proctype P(bit i) {
    do
    ::  turn[i] = 1;
            turn[i] = turn[1-i] + 1;
            (turn[1-i] == 0) || (turn[i] < turn[1-i])
            mutex++;
            // printf("%d", i); /* infinite loop */
            mutex--;
            turn[i] = 0;
    od;
}

proctype monitor() {
    assert(mutex != 2);
}

init {
    run P(0);
    run P(1);
    run monitor()
}
