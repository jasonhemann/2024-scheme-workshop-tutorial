#include <setjmp.h>
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include "fib.h"

void *kontr_emptyr__m__k(void *jumpout) {
kont* _data = (kont*)malloc(sizeof(kont));
if(!_data) {
  fprintf(stderr, "Out of memory\n");
  exit(1);
}
  _data->tag = _emptyr__m__k_kont;
  _data->u._emptyr__m__k._jumpout = jumpout;
  return (void *)_data;
}

void *kontr_outerr__m__k(void *nr__ex__, void *kr__ex__) {
kont* _data = (kont*)malloc(sizeof(kont));
if(!_data) {
  fprintf(stderr, "Out of memory\n");
  exit(1);
}
  _data->tag = _outerr__m__k_kont;
  _data->u._outerr__m__k._nr__ex__ = nr__ex__;
  _data->u._outerr__m__k._kr__ex__ = kr__ex__;
  return (void *)_data;
}

void *kontr_innerr__m__k(void *vr__ex__, void *kr__ex__) {
kont* _data = (kont*)malloc(sizeof(kont));
if(!_data) {
  fprintf(stderr, "Out of memory\n");
  exit(1);
}
  _data->tag = _innerr__m__k_kont;
  _data->u._innerr__m__k._vr__ex__ = vr__ex__;
  _data->u._innerr__m__k._kr__ex__ = kr__ex__;
  return (void *)_data;
}

int main()
{
n = (void *)(void *)5;
pc = &fibr__m__cps;
mount_tram();
printf("%d\n", (int)v);}

void fibr__m__cps()
{
if((n == 0)) {
  v = (void *)(void *)0;
pc = &applyr__m__k;

} else if(((void *)((int)n - (int)(void *)1) == 0)) {
v = (void *)(void *)1;
pc = &applyr__m__k;
}
 else {
  k = (void *)kontr_outerr__m__k(n,k);
n = (void *)(void *)((int)n - (int)(void *)1);
pc = &fibr__m__cps;

}
}

void applyr__m__k()
{
kont* _c = (kont*)k;
switch (_c->tag) {
case _emptyr__m__k_kont: {
void *jumpout = _c->u._emptyr__m__k._jumpout;
_trstr *trstr = (_trstr *)jumpout;
longjmp(*trstr->jmpbuf, 1);
break; }
case _outerr__m__k_kont: {
void *nr__ex__ = _c->u._outerr__m__k._nr__ex__;
void *kr__ex__ = _c->u._outerr__m__k._kr__ex__;
k = (void *)kontr_innerr__m__k(v,kr__ex__);
n = (void *)(void *)((int)nr__ex__ - (int)(void *)2);
pc = &fibr__m__cps;
break; }
case _innerr__m__k_kont: {
void *vr__ex__ = _c->u._innerr__m__k._vr__ex__;
void *kr__ex__ = _c->u._innerr__m__k._kr__ex__;
k = (void *)kr__ex__;
v = (void *)(void *)((int)vr__ex__ + (int)v);
pc = &applyr__m__k;
break; }
}
}

int mount_tram ()
{
srand (time (NULL));
jmp_buf jb;
_trstr trstr;
void *dismount;
int _status = setjmp(jb);
trstr.jmpbuf = &jb;
dismount = &trstr;
if(!_status) {
k= (void *)kontr_emptyr__m__k(dismount);
for(;;) {
pc();
}
}
return 0;
}
