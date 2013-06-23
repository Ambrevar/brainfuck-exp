; Fibonacci in Brainfuck; only works with input above '2'
; There is no multidigit support for now

; #0 holds input sums
; #1 holds current input

>>2 + ; Inner end condition
>3 + ; Outer end condition

3
[
        <<1 ,

        ; Backup #1 to #4
        [>>>4 + >5+ <<<<1-]
        >>>>5 [<<<<1+ >>>>5-]
        <<<<1

        ; Test if #1 holds 61
        -------------------------------------------------------------
        1 [
             ; End condition is false
             >2- 

             ; Print #4
             >>4 .

             <<<1 [+] ; Clear

             ; Put the content of #0 ten times to #1
             <0 [ >1 ++++++++++ <- ]

             ; Put it back to #0
             >1 [ <0 + >1 - ]

             ; Move #4 to #0
             >>>4 [ <<<<+ >>>>- ]
             <<<< 0 ------------------------------------------------

             > 1             
        ] ; Now #1 is null in any case

        ; If #1 was null then #2 is not and we finish the loop
        ; by setting nulling #3
        >2 [ >3- <[-] ]

        2 [-] + ; Reset #2 to 1

        >3
]


3 [-]
>4 [-]
>5 [-]
<<<2 [-]
<1 [-]

; New line
++++++++++ . ----------

<0 ; End input phase on #0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Fibonacci algorithm
; The simplest part X_x

; #0 is the nth fibo we want; we substract one so that Fibo(3) = 2
-

>1                             ; #1 is Fibo(n)
>2 +                           ; #2 is Fibo(n plus 1)
>3 +                           ; #3 is #2 backup
<<<0
[
        ; Move #1 on top of #2 and #4
        >1
        [
                > +
                >> +
                <<< -
        ]

        ; Move #3 back to one; plus on top of 4
        >>3
        [
                > +
                <<< +
                >> -
        ]

        ; Move #4 to #3
        >4 [
                < +
                > -
        ]

        <<<<0 -
]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Let's print #2

; We divide #2 by 10 recursively
; #0 is zero; it is used as temp buffer for various operations
; #1 is the dividend 10
; #3 holds the current remainder for one loop
; #4 is the quotient

; Once we have the remainder in #3 we translate it to the remainder array to
; store it across loops
; The remainder array is made of 3 bytes cells
; Byte #1 = 0 means this is the first cell after the last one
; Byte #2 is a copy buffer for the remainder translation
; Byte #3 is the remainder value of the cell

; DMZ to split calculus zone from remainder array
; We use it to know where to stop when we rewind back from the end of the array
; to the calculus zone
; #5 is 0
; #6 is a copy buffer for remainder translation
; #7 is 0

; #8 is the first cell of the remainder array
; #9 is a remainder copy buffer
; #10 is the first remainder; which is the last digit of our final result
; and so on

; #8 plus 3n is 0; this is the end

>>2
[
        ; Reset
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
        >>4 [ <<2 + >>4 - ]

        ; Move remainder from #3 to #6
        <3 [ >>>+ <<<- ]

        >>>>>8 [
            << [ >>> + <<<- ] ; move remainder one cell forward
            >>
            >>>             ; next cell
        ]

        ; last cell
        +                   ; set index to one
        << [ >>>> + <<<<- ] ; copy remainder last time
        >>

        [ <<< ] ; rewind to 5

        <<<2
]

>>>>>>8
[>>>]   ; Fast forward to first empty cell
<<<     ; last cell
[
  >>
  ++++++++++++++++++++++++++++++++++++++++++++++++ .
  ------------------------------------------------
  <<
  <<< ; previous cell
]
; Finished on #5

; Print newline
<<<<<0 [-] ++++++++++ .
