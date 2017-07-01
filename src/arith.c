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


uint32_t _add( uint32_t a, uint32_t b )
{
  uint32_t ret_val = 0x00000000;
  ret_val = a + b;
  return ret_val;
}


uint32_t _sub( uint32_t a, uint32_t b )
{
  uint32_t ret_val = 0x00000000;
  ret_val = a - b;
  return ret_val;
}


uint32_t _mul( uint32_t a, uint32_t b )
{
  uint32_t ret_val = 0x00000000;
  ret_val = a * b;
  return ret_val;
}


uint32_t _div( uint32_t a, uint32_t b )
{
  uint32_t ret_val = 0x00000000;
  ret_val = a / b;
  return ret_val;
}

