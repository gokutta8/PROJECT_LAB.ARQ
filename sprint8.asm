init:
lb x1, 0xff(x0)
sb x1, 0xff(x0)
beq x0, x0, init

#init:
#lb x1, 0xff(x0)
#addi x2, zero, 1
#and x3, x1, x2
#slt x7, zero, x3
#sb x7, 0xff(x0)
#beq x0, x0, init
