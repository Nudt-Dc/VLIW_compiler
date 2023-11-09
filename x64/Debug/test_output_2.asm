.global DSP_fir_r4

DSP_fir_r4:

.preparation:
; cycle(4)
        SMOVIL          -1, R61                         ;initial the high word of the stack size in R-buf
        SMOVIL          -64, R60                        ;assign the of size of the scalar stack expansion to the register buf
        SADDA           R61:R60, AR15, AR15             ;expand the scalar stack size
        SMOVIL          0, R61                          ;initial the high word of in R-buf

; cycle(9)
        SADD.M2         15, R18, R3
|       SMOVIL          0, R8
        SSHFLR          4, R3, R3
        SADDU.M2        1, R3, R3
|       SMOVIH          0, R8
        SSHFLR          1, R3, R3
        SMVCGC          R8, SMR
        VMOVIL          528, VR0
        SMVAGA36.M1     R13:R12, AR10
|       VMOVIL          16, VR1
        VMOVIH          528, VR0
        SADD.M1         0, R8, R21
|       SADD.M2         0, R8, R23
|       VMOVIH          16, VR1

; cycle(14)
        SMOVIL          0, R20
        SMOVIH          0x40160000, R20
        SMOVIL          0x02020202, R9
        SMOVIL          0x04020301, R17
        SMVAGA36.M1     R21:R20, AR11
|       SMOVIH          0x04020301, R17
        SMOVIH          0x02020202, R9
        SADDU.M2        R9, R17, R17
|       SSTW            R17, *AR11++[1]
        SADDU.M2        R9, R17, R17
|       SSTW            R17, *AR11++[1]
        SADDU.M2        R9, R17, R17
|       SSTW            R17, *AR11++[1]
        SADDU.M2        R9, R17, R17
|       SSTW            R17, *AR11++[1]
        SADDU.M2        R9, R17, R17
|       SMOVIL          16, R20
|       SSTW            R17, *AR11++[1]
        SADDU.M2        R9, R17, R17
|       SMOVIH          0, R20
|       SSTW            R17, *AR11++[1]
        SMVAGA36.M1     R21:R20, OR0
|       SADDU.M2        R9, R17, R17
|       SSTW            R17, *AR11++[1]
        SSTW            R17, *AR11++[1]

.loop_i:
; cycle(14)
        SLDH            *AR10++[1], R19
        SLDH            *AR10++[1], R24
        SLDH            *AR10++[1], R25
        SLDH            *AR10++[1], R26
        SNOP            3
        SVBCAST.M2      R19, VR2
        SVBCAST.M1      R24, VR3
|       SVBCAST.M2      R25, VR4
        SVBCAST.M1      R26, VR5
        SSHFLL          1, R8, R22
        SMOVIL          0, R27
        SADD.M2         R22, R10, R28
|       SMOVIH          0, R27
        SADD.M1         0, R27, R29
|       SADD.M2         0, R27, R43

.loop_j:
; unroll (10)
; cycle(83)
        SSHFLL          1, R27, R44
        SADD.M2         R28, R44, R22
        SMVAGA36.M1     R23:R22, AR0
        SNOP            1
        SSHFLL          6, R29, R42
|       VLDW            *AR0, VR6
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
        SMVAGA36.M1     R43:R42, AR1
|       SSHFLL          1, R27, R45
        SADD.M2         R28, R45, R22
        SMVAGA36.M1     R23:R22, AR3
        SADD.M2         1, R29, R29
        SSHFLL          6, R29, R42
|       VLDW            *AR3, VR14
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R0
|       VLDH            *AR0, VR7
        SMVAGA36.M1     R43:R42, AR4
|       SSHFLL          1, R27, R46
|       VSHUFH          VR6, VR6, VR11
|       VLDH            *+AR2[2], VR8
|       VLDW            *AR1, VR9
        SADD.M2         R28, R46, R22
|       VMOVIL          0, VR10
        SMVAGA36.M1     R23:R22, AR5
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR10
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR11, VR12
|       VLDW            *AR5, VR22
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R1
|       VBEXT           VR1, VR11, VR13
|       VLDH            *AR3, VR15
        SMVAGA36.M1     R43:R42, AR6
|       SSHFLL          1, R27, R47
|       VSHUFH          VR14, VR14, VR19
|       VLDH            *+AR2[2], VR16
|       VLDW            *AR4, VR17
        SADD.M2         R28, R47, R22
|       VMOVIL          0, VR18
        SMVAGA36.M1     R23:R22, AR7
|       VMULAS16T.M2    VR7, VR2, VR10, VR10
|       VMULAS16T.M3    VR8, VR4, VR9, VR9
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR18
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR19, VR20
|       VLDW            *AR7, VR30
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R2
|       VMULAS16T.M2    VR12, VR3, VR10, VR10
|       VMULAS16T.M3    VR13, VR5, VR9, VR9
|       VBEXT           VR1, VR19, VR21
|       VLDH            *AR5, VR23
        SMVAGA36.M1     R43:R42, AR0
|       SSHFLL          1, R27, R48
|       VSHUFH          VR22, VR22, VR27
|       VLDH            *+AR2[2], VR24
|       VLDW            *AR6, VR25
        SADD.M2         R28, R48, R22
|       VMOVIL          0, VR26
        SMVAGA36.M1     R23:R22, AR1
|       VADD.M1         VR10, VR9, VR9
|       VMULAS16T.M2    VR15, VR2, VR18, VR18
|       VMULAS16T.M3    VR16, VR4, VR17, VR17
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR26
|       VSTW            VR9, *AR1
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR27, VR28
|       VLDH            *AR7, VR31
|       VLDW            *AR1, VR38
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R0
|       SSTW            R0, *+AR15[0]                   ;save "loop_j_9" in memory
|       VMULAS16T.M2    VR20, VR3, VR18, VR18
|       VMULAS16T.M3    VR21, VR5, VR17, VR17
|       VBEXT           VR1, VR27, VR29
|       VLDH            *+AR2[2], VR32
|       VLDW            *AR0, VR33
        SMVAGA36.M1     R43:R42, AR3
|       SSHFLL          1, R27, R49
|       VSHUFH          VR30, VR30, VR35
        SADD.M2         R28, R49, R22
|       VMOVIL          0, VR34
        SMVAGA36.M1     R23:R22, AR4
|       VADD.M1         VR18, VR17, VR17
|       VMULAS16T.M2    VR23, VR2, VR26, VR26
|       VMULAS16T.M3    VR24, VR4, VR25, VR25
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR34
|       VSTW            VR17, *AR4
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR35, VR36
|       VLDW            *AR4, VR46
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R1
|       SSTW            R1, *+AR15[1]                   ;save "loop_j_8" in memory
|       VMULAS16T.M2    VR28, VR3, VR26, VR26
|       VMULAS16T.M3    VR29, VR5, VR25, VR25
|       VBEXT           VR1, VR35, VR37
|       VLDH            *AR1, VR39
        SMVAGA36.M1     R43:R42, AR5
|       SSHFLL          1, R27, R50
|       VSHUFH          VR38, VR38, VR43
|       VLDH            *+AR2[2], VR40
|       VLDW            *AR3, VR41
        SADD.M2         R28, R50, R22
|       VMULAS16T.M2    VR31, VR2, VR34, VR34
|       VMULAS16T.M3    VR32, VR4, VR33, VR33
|       VMOVIL          0, VR42
        SMVAGA36.M1     R23:R22, AR6
|       VADD.M3         VR26, VR25, VR25
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR42
|       VSTW            VR25, *AR6
        SSHFLL          6, R29, R42
|       VMULAS16T.M2    VR36, VR3, VR34, VR34
|       VMULAS16T.M3    VR37, VR5, VR33, VR33
|       VBEXT           VR0, VR43, VR44
|       VLDW            *AR6, VR54
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R2
|       SSTW            R2, *+AR15[2]                   ;save "loop_j_7" in memory
|       VBEXT           VR1, VR43, VR45
|       VLDH            *AR4, VR47
        SMVAGA36.M1     R43:R42, AR7
|       SSHFLL          1, R27, R51
|       VSHUFH          VR46, VR46, VR51
|       VLDH            *+AR2[2], VR48
|       VLDW            *AR5, VR49
        SADD.M2         R28, R51, R22
|       VADD.M3         VR34, VR33, VR33
|       VMOVIL          0, VR50
        SMVAGA36.M1     R23:R22, AR0
|       VMULAS16T.M2    VR39, VR2, VR42, VR42
|       VMULAS16T.M3    VR40, VR4, VR41, VR41
|       VSTW            VR33, *AR0
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR50
|       VLDH            *AR6, VR55
|       VLDH            *+AR2[2], VR56
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR51, VR52
|       VLDW            *AR7, VR57
|       VLDW            *AR0, VR62
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R0
|       SSTW            R0, *+AR15[3]                   ;save "loop_j_6" in memory
|       VMULAS16T.M2    VR44, VR3, VR42, VR42
|       VMULAS16T.M3    VR45, VR5, VR41, VR41
|       VBEXT           VR1, VR51, VR53
        SMVAGA36.M1     R43:R42, AR1
|       SSHFLL          1, R27, R52
|       VSHUFH          VR54, VR54, VR59
        SADD.M2         R28, R52, R22
|       VMOVIL          0, VR58
        SMVAGA36.M1     R23:R22, AR3
|       VADD.M1         VR42, VR41, VR41
|       VMULAS16T.M2    VR47, VR2, VR50, VR50
|       VMULAS16T.M3    VR48, VR4, VR49, VR49
        SADD.M2         1, R29, R29
|       VMOVIH          0, VR58
|       VSTW            VR41, *AR3
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR59, VR60
|       VLDW            *AR3, VR10
        SADD.M1         R42, R14, R42
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R1
|       SSTW            R1, *+AR15[4]                   ;save "loop_j_5" in memory
|       VMULAS16T.M2    VR52, VR3, VR50, VR50
|       VMULAS16T.M3    VR53, VR5, VR49, VR49
|       VBEXT           VR1, VR59, VR61
        SMVAGA36.M1     R43:R42, AR4
|       SSHFLL          1, R27, R53
|       VMULAS16T.M2    VR55, VR2, VR58, VR58
|       VMULAS16T.M3    VR56, VR4, VR57, VR57
|       VSHUFH          VR62, VR62, VR11
        SADD.M2         R28, R53, R22
|       VMOVIL          0, VR8
        SMVAGA36.M1     R23:R22, AR5
|       VADD.M1         VR50, VR49, VR49
        SADD.M2         1, R29, R29
|       VMULAS16T.M2    VR60, VR3, VR58, VR58
|       VMULAS16T.M3    VR61, VR5, VR57, VR57
|       VMOVIH          0, VR8
|       VSTW            VR49, *AR5
        SSHFLL          6, R29, R42
|       VBEXT           VR0, VR11, VR12
|       VLDW            *AR5, VR18
        SADD.M2         R42, R14, R42
|       VBEXT           VR1, VR11, VR13
        SMVAGA36.M1     R43:R42, AR6
|       SADD.M2         16, R27, R27
|       SLT             R27, R18, R2
|       SSTW            R2, *+AR15[5]                   ;save "loop_j_4" in memory
|       VADD.M3         VR58, VR57, VR57
|       VSHUFH          VR10, VR10, VR19
        SSHFLL          1, R27, R54
|       VMOVIL          0, VR16
|       VSTW            VR57, *AR7
|       VLDH            *AR0, VR63
        SADD.M1         1, R29, R29
|       SADD.M2         R28, R54, R22
|       VLDH            *+AR2[2], VR6
|       VLDW            *AR1, VR7
        SMVAGA36.M1     R23:R22, AR7
|       SSHFLL          6, R29, R42
|       VMOVIH          0, VR16
|       VLDH            *AR3, VR9
|       VLDH            *+AR2[2], VR14
        SADD.M2         R42, R14, R42
|       VBEXT           VR0, VR19, VR20
|       VLDW            *AR4, VR15
|       VLDH            *AR5, VR17
        SMVAGA36.M1     R43:R42, AR0
|       VBEXT           VR1, VR19, VR21
|       VLDH            *+AR2[2], VR22
|       VLDW            *AR7, VR26
        VSHUFH          VR18, VR18, VR27
|       VLDW            *AR6, VR23
|       VLDH            *AR7, VR25
        VMOVIL          0, VR24
|       VLDH            *+AR7[2], VR30
|       VLDW            *AR0, VR31
        SNOP            1
        VMOVIH          0, VR24
        VBEXT           VR0, VR27, VR28
        VMULAS16T.M3    VR63, VR2, VR8, VR8
|       VBEXT           VR1, VR27, VR29
        VMOVIL          0, VR32
        VMULAS16T.M1    VR6, VR4, VR7, VR7
|       VMULAS16T.M2    VR9, VR2, VR16, VR16
|       VMULAS16T.M3    VR14, VR4, VR15, VR15
|       VSHUFH          VR26, VR26, VR35
        SADD.M2         16, R27, R27
|       SLT             R27, R18, R0
|       SSTW            R0, *+AR15[6]                   ;save "loop_j_3" in memory
|       VMULAS16T.M2    VR12, VR3, VR8, VR8
|       VMULAS16T.M3    VR17, VR2, VR24, VR24
|       VMOVIH          0, VR32
        SLT             R27, R18, R1
|       SSTW            R1, *+AR15[7]                   ;save "loop_j_2" in memory
|       VMULAS16T.M1    VR22, VR4, VR23, VR23
|       VMULAS16T.M2    VR25, VR2, VR32, VR32
|       VMULAS16T.M3    VR30, VR4, VR31, VR31
[R1]    SBR             .loop_j
|       VMULAS16T.M1    VR13, VR5, VR7, VR7
|       VMULAS16T.M2    VR20, VR3, VR16, VR16
|       VMULAS16T.M3    VR21, VR5, VR15, VR15
|       VBEXT           VR0, VR35, VR36
        VMULAS16T.M3    VR28, VR3, VR24, VR24
|       VBEXT           VR1, VR35, VR37
        VMULAS16T.M1    VR29, VR5, VR23, VR23
|       VMULAS16T.M2    VR36, VR3, VR32, VR32
|       VMULAS16T.M3    VR37, VR5, VR31, VR31
        VADD.M1         VR8, VR7, VR7
|       VADD.M2         VR16, VR15, VR15
        SNOP            1
        VADD.M2         VR24, VR23, VR23
|       VADD.M3         VR32, VR31, VR31
|       VSTW            VR7, *AR1
|       VSTW            VR15, *AR4
        SADD.M2         1, R29, R29
|       VSTW            VR23, *AR6
|       VSTW            VR31, *AR0

; cycle(9)
        SADD.M2         4, R8, R8
        SLT             R8, R16, R2
[R2]    SBR             .loop_i
        SNOP            6

; cycle(4)
        SMVAGA36.M1     R15:R14, AR1
        SNOP            1
        SMVAGA36.M1     R15:R14, AR3
|       SMOVIL          0, R29
        SMOVIH          0, R29

.update_store:
; cycle(12)
        VLDDWM2         *AR1++[OR0], VR39:VR38
        SNOP            2
        SADD.M2         1, R29, R29
        SLT             R29, R3, R0
[R0]    SBR             .update_store
        SNOP            2
        VSHFAR          15, VR39, VR39
        VSHFAR          15, VR38, VR38
        VBALE2          VR38, VR39, VR38
        VSTW            VR38, *AR3++[OR0]

.restoration:
; cycle(7)
        SMOVIL          64, R60                         ;assign the of size of the scalar stack restoration to the register buf
|       SBR             R62
        SADDA           R61:R60, AR15, AR15             ;restore the scalar stack register
        SNOP            5

.size DSP_fir_r4, .-DSP_fir_r4