/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <leiu@zhaw.ch> wrote this file.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.   P. Leibundgut
 * ----------------------------------------------------------------------------
 */

#include <arith.h>

#include <stdint.h>
#include <stdio.h>

#define EXIT_SUCCESS 0

static void 
print_operation( char operator, uint32_t a, uint32_t b, uint32_t c );


static void 
print_operation( char operator, uint32_t a, uint32_t b, uint32_t c )
{
  ( void )fprintf( stdout, "%10u %c %10u = %10u\n", a, operator, b, c );
}


int 
main( int argc, char** argv )
{
  uint32_t a, b, c;

  a = 42;
  b =  7;
  c = 0x00000000;
  
  c = _add( a, b );
  print_operation( '+', a, b, c );
  c = _sub( a, b );
  print_operation( '-', a, b, c );
  c = _mul( a, b );
  print_operation( '*', a, b, c );
  c = _div( a, b );
  print_operation( '/', a, b, c );
  
  return EXIT_SUCCESS;
}

