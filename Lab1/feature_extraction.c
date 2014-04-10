#include <stdio.h>
#include <math.h>

/*

(from wolfram alpha for 1.234)

sign digit | 0
exponent | 01111111
significand | 00111011111001110110110

from print_bits

byte 1 = 00111111
byte 2 = 10011101
byte 3 = 11110011
byte 4 = 10110110

they match!

00111111100111011111001110110110
00111111100111011111001110110110

*/

void print_bits(signed char *ch, int max){
    int i;
    ch = ch + 3;
    for (i = 0; i < max; i++){ 

        int output[8];

        // converts hexidemical byte to binary bit pattern
        printf("byte %d = ", i+1, *ch); 
        int j;
        for (j = 7; j >= 0; j--) {
          output[j] = (*ch >> j) & 1;
          printf("%d", output[j]); 
        }  
        printf("\n");
        ch--; //next byte
    }
}

// prints mantissa, sign, exponent for a given bit pattern
void print_mse(signed char *ch, int max){

    int output[8*4];
    int k = 0;
    int i;
    ch = ch + 3;
    for (i = 0; i < max; i++){

        int j;
        for (j = 7; j >= 0; j--) {
          output[k] = (*ch >> j) & 1;
          k++;
        }  
        ch--; //next byte
    }

    // now we split the binary string

    int sign[1];
    printf("sign bit: ");
    for (k = 0; k < 1; k++){
        sign[0] = output[k];
        printf("%d",output[k]);
    }
    int exponent[8];
    printf("\nexponent bits: ");
    for (k = 1; k < 9; k++){
        exponent[k-1] = output[k];
        printf("%d",output[k]);
    }
    int mantissa[23];
    printf("\nmantissa bits: ");
    for (k = 9; k < 32; k++){
        mantissa[k-9] = output[k];
        printf("%d",output[k]);
    }



}

int main(void){

    float f = 1.234;
    int max = sizeof(typeof(f));
    printf("input: %f %e \n", f, f);
    unsigned char *ch; //signed or unsigned chars... i still don't know?
    ch = (unsigned char *)(&f);

    print_mse(ch,max);

    /*
    print_bits(ch, max);

    f = -1;
    max = sizeof(typeof(f));
    printf("input: %f %e \n", f, f);
    ch = (unsigned char *)(&f);
    print_bits(ch, max);

    printf("\n");
    return 0;
    */
}


