    /* Arquivo kernel.ld  */

    /* Não sei vocês, mas eu sempre, alinho meus códigos para 4 KiB, devido a paginação  */
	


    OUTPUT_FORMAT("binary")
    OUTPUT_ARCH(i386)
    ENTRY(start)

    phys = 0x100000;

    SECTIONS
    {
        .text phys : AT(phys) {
        code = .;
        *(.text)
        *(.rodata)
        . = ALIGN(4096);
    }
        .data : AT(phys + (data - code))
    {
        data = .;
        *(.data)
        . = ALIGN(4096);
    }
      .bss : AT(phys + (bss - code))
    {
        bss = .;
        *(.bss)
        . = ALIGN(4096);
    }
         end = .;
    }
