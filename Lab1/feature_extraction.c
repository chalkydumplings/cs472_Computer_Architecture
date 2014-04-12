#include <stdio.h>
#include <math.h>

/*

note:

okay, this is weird. The lab instructions ask
for the sign bit if a value is treated as a long,
but long appears to use 2's complement instead of
a sign bit.

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

// prints mantissa, sign, exponent
void print_mse_as_float(signed char *ch, int max){

	printf("if this were a float...\n");

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

	// now we split the string
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
	printf("\n");
}

// prints value and sign
void print_vs_as_long(signed char *ch){

	printf("if this were a long...\n");

	int output[8*4];
	int k = 0;
	int i;
	ch = ch + 3;
	for (i = 0; i < 4; i++){
		int j;
		for (j = 7; j >= 0; j--) {
			output[k] = (*ch >> j) & 1;
			k++;
	}  
	ch--; //next byte
	}

	// now we split the string
	int sign[1];
	printf("sign bit: ");
	for (k = 0; k < 1; k++){
		sign[0] = output[k];
		printf("%d",output[k]);
	}
	int exponent[32];
	printf("\nvalue bits: ");
	for (k = 1; k < 32; k++){
		exponent[k-1] = output[k];
		printf("%d",output[k]);
	}
	printf("\n");
	ch = ch + 3;
}

// prints sign, exponent, mantissa...
// in this case the lenghts are: 1, 11, 52
void print_mse_as_double(signed char *ch){

	printf("if this were a double...\n");

	int output[8*8];
	int k = 0;
	int i;
	ch = ch + 3;
	for (i = 0; i < 8; i++){
		int j;
		for (j = 7; j >= 0; j--) {
			output[k] = (*ch >> j) & 1;
			k++;
	}
	ch--; //next byte
	}

	// now we split the string
	int sign[1];
	printf("sign bit: ");
	for (k = 0; k < 1; k++){
		sign[0] = output[k];
		printf("%d",output[k]);
	}
	int exponent[11];
	printf("\nexponent bits: ");
	for (k = 1; k < 11; k++){
		exponent[k-1] = output[k];
		printf("%d",output[k]);
	}
	int mantissa[52];
	printf("\nmantissa bits: ");
	for (k = 11; k < 52; k++){
		mantissa[k-11] = output[k];
		printf("%d",output[k]);
	}
	printf("\n");
}

//assumes string is 8 chars long,
//prints each set of 8 bits as a char
void print_chars(signed char *ch){

	printf("if this were 8 chars...\n");

	int output[8*8];
	int i, j, k;
	k = 0;
	ch = ch + 3;
	for (i = 0; i < 8; i++){
		int j;
		for (j = 7; j >= 0; j--) {
			output[k] = (*ch >> j) & 1;
			k++;
	}
	ch--; //next byte
	}

	// now we split the string...
	k = 0;
	for (i = 0; i < 8; i++){
		printf("char %d: ",i);
		for (j = 0; j < 8; j++){
			printf("%d",output[k]);
			k++;
		}
		printf("\n");
	}
   
	printf("\n");
}

void noop_message(int argc, char *argv[]){
	printf("**************feature_extraction.c************\n");
	printf("****By Drake Bridgewater and Ryan Phillips****\n");
	printf("Usage: %s VALUE TYPE \n",argv[0]);
	printf("where TYPE is f,d,i,l,c \nfor float,double,int,long, or char\n");
	printf("or: %s t\tto display test output \n\n\n\n",argv[0]);
}

int main(int argc, char *argv[]){

	if (argc ==1) {
		noop_message(argc, argv);
	}
	else if(argv[1][0] == 't'){
		float f = -1.234;
		int max = sizeof(typeof(f));
		printf("\nfloat: %f \n", f);
		unsigned char *ch; //signed or unsigned chars... i still don't know?
		ch = (unsigned char *)(&f);

		print_mse_as_float(ch,max);
		print_mse_as_double(ch);
		print_vs_as_long(ch);
		print_chars(ch);

		int i = 1;
		printf("\nint: %d \n", i);
		unsigned char *ch2; 
		ch2 = (unsigned char *)(&i);

		print_mse_as_float(ch2,max);
		print_mse_as_double(ch2);
		print_vs_as_long(ch2);
		print_chars(ch2);

		long int l = -1000;
		printf("\nlong: %d \n", l);
		unsigned char *ch3; 
		ch3 = (unsigned char *)(&l);

		print_mse_as_float(ch3,max);
		print_mse_as_double(ch3);
		print_vs_as_long(ch3);
		print_chars(ch3);

	} else if(argv[2][0] == 'i'){ //int
		int as_int = argv[1][0] - '0';

		unsigned char *user_in; 
		user_in = (unsigned char *)(&as_int);
		printf("\nInput is the following INT: %d \n", as_int);
		print_mse_as_double(user_in);
		print_vs_as_long(user_in);
		print_chars(user_in);

	} else if(argv[2][0] == 'f'){ //float
		float as_float = strtof(argv[1],NULL);

		unsigned char *user_in; 
		user_in = (unsigned char *)(&as_float);

		printf("\nInput is the following FLOAT: %f \n", as_float);
		print_mse_as_double(user_in);
		print_vs_as_long(user_in);
		print_chars(user_in);

	} else if(argv[2][0] == 'd'){ //double
		double as_double = strtod(argv[1],NULL);

		unsigned char *user_in; 
		user_in = (unsigned char *)(&as_double);

		printf("\nInput is the following DOUBLE: %f \n", as_double);
		print_mse_as_double(user_in);
		print_vs_as_long(user_in);
		print_chars(user_in);

	} else if(argv[2][0] == 'l'){ //long
		long as_long = strtol(argv[1],NULL);

		unsigned char *user_in; 
		user_in = (unsigned char *)(&as_long);

		printf("\nInput is the following LONG: %f \n", as_long);
		print_mse_as_double(user_in);
		print_vs_as_long(user_in);
		print_chars(user_in);

	} else if(argv[2][0] == 'c'){ //chars
		char as_char = argv[1];

		unsigned char *user_in; 
		user_in = (unsigned char *)(&as_char);

		printf("\nInput is the following CHAR: %c \n", as_char);
		print_mse_as_double(user_in);
		print_vs_as_long(user_in);
		print_chars(user_in);
	} else {
		noop_message(argc, argv);
	} 

}
