/* описания для main.c */
 .text
      .global Start_DSP
      .global InI
      .global InJ
      .global ArrayFirst
      .global ArraySecond


/* сегмент кода */
Start_DSP:
        MOVE 1, R0.L  /* I */
        MOVE 1, R2.L /* J */
        MOVE ArrayFirst, A1
        MOVE ArraySecond, A7
        DO 5,end1
            DO 5,end2
            SUBL R2.L,R0.L,R4.L
            MOVE R4.L,(A1)+
            MOVE R4.L,(A7)+
            ADDL 1,R2.L,R2.L
            end2: NOP
        MOVE 1,R2.L
        ADDL 1,R0.L,R0.L
        end1: NOP



         MOVE ArrayFirst, A1


         MOVE 5,R1.L /*const*/
         MOVE 5,R3.L /*const*/


         MOVE 1,R0.L  /*I - not a const*/
         MOVE 1,R10.L  /*J - not a const*/
        DO 5,ii
                SUBL R0.L,R1.L,R2.L /*const J*/

                DO R2,jj
                        MOVE ArrayFirst, A3 /* указатель на первый элемент */
                        MOVE (A1),R4.L

                        SUBL R10.L,R1.L,R6.L

                        MPYL R6.L,R3.L,R6.D

                        ADDL R6.L,R2.L,R6.L

                        DO R6, miniI
                                (A3)+
                        miniI: NOP


                        MOVE (A3),R8.L

                        MOVE R4.L,(A3)

                        MOVE R8.L,(A1)

                       ADDL 1,R10.L,R10.L

                       (A1)+
                jj:NOP
                ADDL 1,R0.L,R0.L
                MOVE 1,R10.L /* J - not a const */
                (A1)+
        ii:NOP

        STOP




/* сегмент данных */
 .data
InI:  .word 1
InJ:  .word 1
ArrayFirst: .space 5*5*4, 0x00
ArraySecond: .space 5*5*4, 0x00
 .end
