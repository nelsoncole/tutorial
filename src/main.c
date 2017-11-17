    // Arquivo main.c

    unsigned short *video = (unsigned short*)0xB8000;  // Memória de vídeo
    
    static void puts(char *string,int attr);

    void main()
    {

        puts("Eu amo Kernel!",0xE);

    } 



    // Função imprime caracter na tela

    static void puts(char *string,int attr)
    {

       while(*string !=0)
        {

        *video = *string | (attr << 8);
        string++;
        video++;
        }

    }
