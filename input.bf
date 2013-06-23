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


[-]
>4 [-]
<<2 [-]
<1 [-]

; New line
++++++++++ . ----------





<0 [ >>2+ <<-]

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


