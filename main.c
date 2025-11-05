#include <inttypes.h>
#include <stdio.h>

extern void *_mall_ok(uint16_t size);

int main() {

  int *a = _mall_ok(4);
  printf("%p", a);
  int *b = _mall_ok(4);
  printf("%p", b);
  int *c = _mall_ok(4);
  printf("%p", c);

  *a = 2;
  *b = 33;
  *c = 67;


	printf("a = %d , b = %d , c = %d" , *a , *b , *c);
  return 0;
}
