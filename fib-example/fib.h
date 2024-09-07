void (*pc)();

void *k, *v, *n;

struct kont;
typedef struct kont kont;
struct kont {
  enum {
    _emptyr__m__k_kont,
    _outerr__m__k_kont,
    _innerr__m__k_kont
  } tag;
  union {
    struct { void *_jumpout; } _emptyr__m__k;
    struct { void *_nr__ex__; void *_kr__ex__; } _outerr__m__k;
    struct { void *_vr__ex__; void *_kr__ex__; } _innerr__m__k;
  } u;
};

void *kontr_emptyr__m__k(void *jumpout);
void *kontr_outerr__m__k(void *nr__ex__, void *kr__ex__);
void *kontr_innerr__m__k(void *vr__ex__, void *kr__ex__);

void applyr__m__k();
void fibr__m__cps();
int main();
int mount_tram();

struct _trstr;
typedef struct _trstr _trstr;
struct _trstr {
  jmp_buf *jmpbuf;
  int value;
};

