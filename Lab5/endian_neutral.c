#include <stdio.h>
#include <stdint.h>

#define IS_BIG_ENDIAN (*(uint16_t *)"\0\xff" < 0x100)

int main(int argc, char **argv)
{
        printf("%d\n",IS_BIG_ENDIAN); //0 if false

        short val;
        char *p_val;
        p_val = (char *) &val;

        if (IS_BIG_ENDIAN){
          p_val[0] = 0x12;
          p_val[1] = 0x34;
        } else {
          p_val[0] = 0x34;
          p_val[1] = 0x12;
        }
        printf("%x\n", val);

        return 0;
}