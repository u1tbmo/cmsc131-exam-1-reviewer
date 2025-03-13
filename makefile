.SILENT:

TEMP_GDB = temp.gdb
INIT_GDB = _init.gdb
DISP_GDB = _dispose.gdb
FILE = a.out

run:
	echo 'usage: make <file_number>'
	echo 'e.g. make 00'

define assemble
	nasm -felf64 $1.asm
	ld $1.o
	@cat ${INIT_GDB} > ${TEMP_GDB}
endef

define add_gdb
	@echo $1 >> ${TEMP_GDB}
endef

define quit
	@cat ${DISP_GDB} >> ${TEMP_GDB}
	echo 'temp.gdb ------------------------'
	cat ${TEMP_GDB}
	echo '---------------------------------'
	gdb -q -x ${TEMP_GDB}
endef

define dispose
	rm ${TEMP_GDB}
	rm $1.o
	rm ${FILE}
endef

00:
	$(call assemble, 00-data-movement)
	$(call add_gdb, "r")
	$(call add_gdb, "x/uw &value")
	$(call add_gdb, "x/ub &num")
	$(call add_gdb, "x/ub &ans")
	${call quit}
	$(call dispose, 00-data-movement)

01:
	$(call assemble, 01-addressing-modes)
	$(call add_gdb, "r")
	$(call add_gdb, "i r al")
	$(call add_gdb, "i r bl")
	$(call add_gdb, "i r cl")
	$(call add_gdb, "x/ub &val")
	$(call add_gdb, "i r rdx")
	${call quit}
	$(call dispose, 01-addressing-modes)

02:
	$(call assemble, 02-arithmetic)
	$(call add_gdb, "b*subtract")
	$(call add_gdb, "b*multiply")
	$(call add_gdb, "b*divide")
	$(call add_gdb, "r")
	$(call add_gdb, "x/ub &ans")
	$(call add_gdb, "c")
	$(call add_gdb, "x/ub &ans2")
	$(call add_gdb, "c")
	$(call add_gdb, "x/uh &ans3")
	$(call add_gdb, "c")
	$(call add_gdb, "x/ub &ans4")
	$(call add_gdb, "x/ub &rem")
	${call quit}
	$(call dispose, 02-arithmetic)

03:
	$(call assemble, 03-control-flow)
	$(call add_gdb, "info functions")
	$(call add_gdb, "b*_start")
	$(call add_gdb, "b*equal")
	$(call add_gdb, "b*not_equal")
	$(call add_gdb, "b*finally_equal")
	$(call add_gdb, "b*below")
	$(call add_gdb, "b*below2")
	$(call add_gdb, "b*above")
	$(call add_gdb, "b*above2")
	$(call add_gdb, "b*delusion_equal")
	$(call add_gdb, "b*greater")
	$(call add_gdb, "b*lesser")
	$(call add_gdb, "b*terminate")
	$(call add_gdb, "r")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	$(call add_gdb, "c")
	${call quit}
	$(call dispose, 03-control-flow)
