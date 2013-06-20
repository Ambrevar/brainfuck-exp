Fibonacci in Brainfuck; only works with input above '2'

,------------------------------------------------
- #0 is the nth fibo we want; we substract one so that F3 = 2

>1                             #1 is 0
>2 +                           #2 is 1
>3 +                           #3 is #2 backup
<<<0
[
        >1 Move #1 on top of #2 and #4
        [
                > +
                >> +
                <<< -
        ]

       >>3 Move #3 back to one; plus on top of 4
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


       <<<<0 -
]

Print result in an unsuitable format (19 is ':')
>>2
++++++++++++++++++++++++++++++++++++++++++++++++ .
------------------------------------------------
<<0 [-] ++++++++++ .

We divide #2 by 10 recursively
#0 is zero
#1 is the dividend 10
#3 is the bufremainder
#4 is the quotient
#5 is the pointer to the current remainder
#6 is last digit (remainder 1)
#n is first digit (last remainder)

>>2
[
        Reset
        <<0 [-]
        >>>3 [-]
        >4 [-]
        <<<1 [-] ++++++++++

        ; Subtract 10 from #2 if possible
        ; We go to zero to make an 'if'
        1 [
          >2 [ >3+ <2- [ <<0 + >>2 - ] ]
          <<0 [ >>2+ <<0- ] 
          >1 -
        ]


        ; If subtraction did not make #2 null
        >2
        ++++++++++++++++++++++++++++++++++++++++++++++++ .
        ------------------------------------------------
        [
                ; Quotient
                >>4 +

                ; Reset bufremainder and dividend 10
                <3 [-]
                <<1 [-] ++++++++++

                1 [
                          >2 [ >3+ <2- [ <<0 + >>2 - ] ]
                          <<0 [ >>2+ <<0- ] 
                          >1 -
                ]

                >2
        ]

        ; Replace #2 with quotient
        >>4 [ << 2 + >>4 - ]

        ; Print remainder
        ; This is backward for now
        <3 ++++++++++++++++++++++++++++++++++++++++++++++++ .

        <2
]

Print newline
<<0 [-] ++++++++++ .
