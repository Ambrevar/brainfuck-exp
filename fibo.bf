+++++                          #0 is the nth fibo we want
>1                             #1 is 0
>2 +                           #2 is 1 CENTRAL
>3 +                           #3 is Cell 2 backup
<<<0
[
        >1 Move #1 on top of #2 and #4
        [
                > +
                >> +
                <<< -
        ]

       >>3 Move #3 back to one, plus on top of 4
       [
                > +
                <<< +
                >> -
       ]

       >4 Move #4 to #3
       [
                < +
                > -
       ]


       <<<< -                   Cell 0 decr
]

>> ++++++++++++++++++++++++++++++++++++++++++++++++ .
