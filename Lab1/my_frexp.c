/*
 *	Author:  Drake Bridgewater and Ryan Phillips
 *	Created:  04//14/2014 
 *	Filename:  my_frexp.c
 *
 *	Description:
 *
 *	Source: http://read.pudn.com/downloads65/sourcecode/os/234548/libc/math/frexp.c__.htm
*/

#include <stdio.h>    
#include <math.h>       
#include <float.h>


//pexp is a pointer to the exponent
double my_frexp(double value, int *pexp){

    double r;  
    *pexp = 0;  
  
  	/* 
     * return value must be strictly less than 1.0 and >=0.5 . 
     */  
    if ((r = fabs(value)) >= 1.0)  
        for(; (r >= 1.0); (*pexp)++, r /= 2.0);  
    else  
        for(; (r < 0.5); (*pexp)--, r *= 2.0);  

    return (value < 0 ? -r : r);  
    }  
     

int main (){
  double result;
  int n;

  float float_in = 1.0;
  double double_in = 1.0;

  result = my_frexp (float_in , &n);
  printf ("%f = %f * 2^%d\n", float_in, result, n);

  //compare to frexp from math.h
  result = frexp (double_in , &n);
  printf ("%f = %f * 2^%d\n", double_in, result, n);

  printf("\n");
  return 0;
}


