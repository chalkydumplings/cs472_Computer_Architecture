/*
 *	Author:  Drake Bridgewater and Ryan Phillips
 *	Created:  04/16/2014 
 *	Filename:  palindrome.c
 *
 *	Description:
 *
 *	Checks an odd length string input to see if it is a palindrome.
*/

#include <stdio.h>    
#include <math.h>
#include <string.h>       

void noop_message(int argc, char *argv[]){
  printf("**************palindrome.c************\n");
  printf("****By Drake Bridgewater and Ryan Phillips****\n");
  printf("Usage: %s INPUT_STRING_HERE \n",argv[0]);
  printf("Note: Only accepts odd length input strings \n");

}

int main(int argc, char *argv[]){

  char *in_string;
  in_string = argv[1]; //
  int in_length = strlen(in_string);

  // should have just one additional arg, and it should be an odd length string
  if (argc == 1 || argc > 2 || ((in_length%2) != 1)) {
    noop_message(argc, argv);
  } else {

    int ret = 1;
    int i;
    for (i = 0; i < (in_length-1)/2; i++){
      if (in_string[i] != in_string[in_length-i-1])
        ret = 0;
    }

    //for testing
    //printf("%s %d",in_string, in_length);

  printf("%d\n", ret);
  return ret;

  }
}


