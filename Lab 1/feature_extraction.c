#include <stdio.h>
#include <math.h>

/*

an example for testing:
(from stack overflow... I'm assuming these values are correct,
but I'm not positive)

1.234 = 0x3F9DF3B6
0x3F = 00111111 =  63
0x9D = 10011101 = -99 (as a signed char)
0xF3 = 11110011 = -13
0xB6 = 10110110 = -74

*/

void print_bits(signed char *ch, int max){
    int i;
    for (i = 0; i < max; i++){

        int output[8];

        // converts hexidemical byte to binary bit pattern
        printf("byte %d: %d = ", i+1, *ch); 
        int j;
        for (j = 7; j >= 0; j--) {
          output[j] = (*ch >> j) & 1;
          printf("%d", output[j]); 
        }  
        printf("\n");
        ch++; //next byte
    }
}

int main(void){

    float f = 1.234;
    int max = sizeof(typeof(f));
    printf("input: %f %e \n", f, f);
    signed char *ch; //signed or unsigned chars... i still don't know?
    ch = (signed char *)(&f);
    print_bits(ch, max);

    f = -1;
    max = sizeof(typeof(f));
    printf("input: %f %e \n", f, f);
    ch = (signed char *)(&f);
    print_bits(ch, max);

    printf("\n");
    return 0;
}


