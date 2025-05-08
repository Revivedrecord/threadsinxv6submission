
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   a:	e8 41 00 00 00       	call   50 <forktest>
  exit();
   f:	e8 af 04 00 00       	call   4c3 <exit>
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <printf>:
{
  20:	f3 0f 1e fb          	endbr32 
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %ebx
  28:	83 ec 10             	sub    $0x10,%esp
  2b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2e:	53                   	push   %ebx
  2f:	e8 ac 02 00 00       	call   2e0 <strlen>
  34:	83 c4 0c             	add    $0xc,%esp
  37:	50                   	push   %eax
  38:	53                   	push   %ebx
  39:	ff 75 08             	pushl  0x8(%ebp)
  3c:	e8 a2 04 00 00       	call   4e3 <write>
}
  41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  44:	83 c4 10             	add    $0x10,%esp
  47:	c9                   	leave  
  48:	c3                   	ret    
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000050 <forktest>:
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	53                   	push   %ebx
  for(n=0; n<N; n++){
  58:	31 db                	xor    %ebx,%ebx
{
  5a:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  5d:	68 18 07 00 00       	push   $0x718
  62:	e8 79 02 00 00       	call   2e0 <strlen>
  67:	83 c4 0c             	add    $0xc,%esp
  6a:	50                   	push   %eax
  6b:	68 18 07 00 00       	push   $0x718
  70:	6a 01                	push   $0x1
  72:	e8 6c 04 00 00       	call   4e3 <write>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	eb 15                	jmp    91 <forktest+0x41>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	74 58                	je     da <forktest+0x8a>
  for(n=0; n<N; n++){
  82:	83 c3 01             	add    $0x1,%ebx
  85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8b:	0f 84 92 00 00 00    	je     123 <forktest+0xd3>
    pid = fork();
  91:	e8 25 04 00 00       	call   4bb <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 26 04 00 00       	call   4cb <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 36                	js     df <forktest+0x8f>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 18 04 00 00       	call   4cb <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 49                	jne    101 <forktest+0xb1>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 4a 07 00 00       	push   $0x74a
  c0:	e8 1b 02 00 00       	call   2e0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 4a 07 00 00       	push   $0x74a
  ce:	6a 01                	push   $0x1
  d0:	e8 0e 04 00 00       	call   4e3 <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
      exit();
  da:	e8 e4 03 00 00       	call   4c3 <exit>
  write(fd, s, strlen(s));
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	68 23 07 00 00       	push   $0x723
  e7:	e8 f4 01 00 00       	call   2e0 <strlen>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	50                   	push   %eax
  f0:	68 23 07 00 00       	push   $0x723
  f5:	6a 01                	push   $0x1
  f7:	e8 e7 03 00 00       	call   4e3 <write>
      exit();
  fc:	e8 c2 03 00 00       	call   4c3 <exit>
  write(fd, s, strlen(s));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	68 37 07 00 00       	push   $0x737
 109:	e8 d2 01 00 00       	call   2e0 <strlen>
 10e:	83 c4 0c             	add    $0xc,%esp
 111:	50                   	push   %eax
 112:	68 37 07 00 00       	push   $0x737
 117:	6a 01                	push   $0x1
 119:	e8 c5 03 00 00       	call   4e3 <write>
    exit();
 11e:	e8 a0 03 00 00       	call   4c3 <exit>
  write(fd, s, strlen(s));
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	68 58 07 00 00       	push   $0x758
 12b:	e8 b0 01 00 00       	call   2e0 <strlen>
 130:	83 c4 0c             	add    $0xc,%esp
 133:	50                   	push   %eax
 134:	68 58 07 00 00       	push   $0x758
 139:	6a 01                	push   $0x1
 13b:	e8 a3 03 00 00       	call   4e3 <write>
    exit();
 140:	e8 7e 03 00 00       	call   4c3 <exit>
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <thread_create>:
#include "user.h"
#include "x86.h"

int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	53                   	push   %ebx
 158:	83 ec 10             	sub    $0x10,%esp
  void *stack;
  int pid;
  
  // Allocate a page for the stack
  stack = malloc(4096); // PGSIZE
 15b:	68 00 10 00 00       	push   $0x1000
 160:	e8 ab 04 00 00       	call   610 <malloc>
  if(stack == 0)
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	74 32                	je     19e <thread_create+0x4e>
 16c:	89 c3                	mov    %eax,%ebx
    return -1;
    
  // Ensure stack is page-aligned
  if((uint)stack % 4096) {
    stack = (void*)((uint)stack + (4096 - ((uint)stack % 4096)));
 16e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 173:	05 00 10 00 00       	add    $0x1000,%eax
 178:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 17e:	0f 45 d8             	cmovne %eax,%ebx
  }

  // Call clone system call to create the thread
  pid = clone(start_routine, arg1, arg2, stack);
 181:	53                   	push   %ebx
 182:	ff 75 10             	pushl  0x10(%ebp)
 185:	ff 75 0c             	pushl  0xc(%ebp)
 188:	ff 75 08             	pushl  0x8(%ebp)
 18b:	e8 d3 03 00 00       	call   563 <clone>
  
  if(pid == 0) {
 190:	83 c4 10             	add    $0x10,%esp
 193:	85 c0                	test   %eax,%eax
 195:	74 02                	je     199 <thread_create+0x49>
    // Child thread - just return 0
    return 0;
  } else if(pid < 0) {
 197:	78 0c                	js     1a5 <thread_create+0x55>
    return -1;
  }
  
  // Parent - return the child thread's PID
  return pid;
}
 199:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19c:	c9                   	leave  
 19d:	c3                   	ret    
    return -1;
 19e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1a3:	eb f4                	jmp    199 <thread_create+0x49>
    free(stack);
 1a5:	83 ec 0c             	sub    $0xc,%esp
 1a8:	53                   	push   %ebx
 1a9:	e8 d2 03 00 00       	call   580 <free>
    return -1;
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1b6:	eb e1                	jmp    199 <thread_create+0x49>
 1b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <thread_join>:

int 
thread_join(void) 
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	83 ec 34             	sub    $0x34,%esp
  void *stack;
  int pid;
  
  // Wait for a thread to exit
  pid = join(&stack);
 1ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1cd:	50                   	push   %eax
 1ce:	e8 98 03 00 00       	call   56b <join>
  
  if(pid > 0) {
 1d3:	83 c4 10             	add    $0x10,%esp
 1d6:	85 c0                	test   %eax,%eax
 1d8:	7f 06                	jg     1e0 <thread_join+0x20>
    // Free the thread's stack
    free(stack);
  }
  
  return pid;
}
 1da:	c9                   	leave  
 1db:	c3                   	ret    
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    free(stack);
 1e0:	83 ec 0c             	sub    $0xc,%esp
 1e3:	ff 75 f4             	pushl  -0xc(%ebp)
 1e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1e9:	e8 92 03 00 00       	call   580 <free>
 1ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <lock_init>:

void 
lock_init(lock_t *lock) 
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 20a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 210:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <lock_acquire>:

void 
lock_acquire(lock_t *lock) 
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 225:	b9 01 00 00 00       	mov    $0x1,%ecx
 22a:	89 e5                	mov    %esp,%ebp
 22c:	8b 55 08             	mov    0x8(%ebp),%edx
 22f:	90                   	nop
 230:	89 c8                	mov    %ecx,%eax
 232:	f0 87 02             	lock xchg %eax,(%edx)
  // Simple test and set approach for xv6
  // Use the existing xchg function from x86.h
  while(xchg(&lock->ticket, 1) != 0)
 235:	85 c0                	test   %eax,%eax
 237:	75 f7                	jne    230 <lock_acquire+0x10>
    ; // Spin
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <lock_release>:

void 
lock_release(lock_t *lock) 
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
  lock->ticket = 0;
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    
 252:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 265:	31 c0                	xor    %eax,%eax
{
 267:	89 e5                	mov    %esp,%ebp
 269:	53                   	push   %ebx
 26a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 270:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 274:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 277:	83 c0 01             	add    $0x1,%eax
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strcpy+0x10>
    ;
  return os;
}
 27e:	89 c8                	mov    %ecx,%eax
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	53                   	push   %ebx
 298:	8b 4d 08             	mov    0x8(%ebp),%ecx
 29b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 29e:	0f b6 01             	movzbl (%ecx),%eax
 2a1:	0f b6 1a             	movzbl (%edx),%ebx
 2a4:	84 c0                	test   %al,%al
 2a6:	75 19                	jne    2c1 <strcmp+0x31>
 2a8:	eb 26                	jmp    2d0 <strcmp+0x40>
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2b4:	83 c1 01             	add    $0x1,%ecx
 2b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ba:	0f b6 1a             	movzbl (%edx),%ebx
 2bd:	84 c0                	test   %al,%al
 2bf:	74 0f                	je     2d0 <strcmp+0x40>
 2c1:	38 d8                	cmp    %bl,%al
 2c3:	74 eb                	je     2b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2c5:	29 d8                	sub    %ebx,%eax
}
 2c7:	5b                   	pop    %ebx
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2d2:	29 d8                	sub    %ebx,%eax
}
 2d4:	5b                   	pop    %ebx
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax

000002e0 <strlen>:

uint
strlen(const char *s)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2ea:	80 3a 00             	cmpb   $0x0,(%edx)
 2ed:	74 21                	je     310 <strlen+0x30>
 2ef:	31 c0                	xor    %eax,%eax
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2f8:	83 c0 01             	add    $0x1,%eax
 2fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2ff:	89 c1                	mov    %eax,%ecx
 301:	75 f5                	jne    2f8 <strlen+0x18>
    ;
  return n;
}
 303:	89 c8                	mov    %ecx,%eax
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 310:	31 c9                	xor    %ecx,%ecx
}
 312:	5d                   	pop    %ebp
 313:	89 c8                	mov    %ecx,%eax
 315:	c3                   	ret    
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi

00000320 <memset>:

void*
memset(void *dst, int c, uint n)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 32b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 32e:	8b 45 0c             	mov    0xc(%ebp),%eax
 331:	89 d7                	mov    %edx,%edi
 333:	fc                   	cld    
 334:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <strchr>:

char*
strchr(const char *s, char c)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	8b 45 08             	mov    0x8(%ebp),%eax
 34a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34e:	0f b6 10             	movzbl (%eax),%edx
 351:	84 d2                	test   %dl,%dl
 353:	75 16                	jne    36b <strchr+0x2b>
 355:	eb 21                	jmp    378 <strchr+0x38>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax
 360:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 364:	83 c0 01             	add    $0x1,%eax
 367:	84 d2                	test   %dl,%dl
 369:	74 0d                	je     378 <strchr+0x38>
    if(*s == c)
 36b:	38 d1                	cmp    %dl,%cl
 36d:	75 f1                	jne    360 <strchr+0x20>
      return (char*)s;
  return 0;
}
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 378:	31 c0                	xor    %eax,%eax
}
 37a:	5d                   	pop    %ebp
 37b:	c3                   	ret    
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <gets>:

char*
gets(char *buf, int max)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 389:	31 f6                	xor    %esi,%esi
{
 38b:	53                   	push   %ebx
 38c:	89 f3                	mov    %esi,%ebx
 38e:	83 ec 1c             	sub    $0x1c,%esp
 391:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 394:	eb 33                	jmp    3c9 <gets+0x49>
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3a0:	83 ec 04             	sub    $0x4,%esp
 3a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a6:	6a 01                	push   $0x1
 3a8:	50                   	push   %eax
 3a9:	6a 00                	push   $0x0
 3ab:	e8 2b 01 00 00       	call   4db <read>
    if(cc < 1)
 3b0:	83 c4 10             	add    $0x10,%esp
 3b3:	85 c0                	test   %eax,%eax
 3b5:	7e 1c                	jle    3d3 <gets+0x53>
      break;
    buf[i++] = c;
 3b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bb:	83 c7 01             	add    $0x1,%edi
 3be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3c1:	3c 0a                	cmp    $0xa,%al
 3c3:	74 23                	je     3e8 <gets+0x68>
 3c5:	3c 0d                	cmp    $0xd,%al
 3c7:	74 1f                	je     3e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 3c9:	83 c3 01             	add    $0x1,%ebx
 3cc:	89 fe                	mov    %edi,%esi
 3ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3d1:	7c cd                	jl     3a0 <gets+0x20>
 3d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3de:	5b                   	pop    %ebx
 3df:	5e                   	pop    %esi
 3e0:	5f                   	pop    %edi
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e7:	90                   	nop
 3e8:	8b 75 08             	mov    0x8(%ebp),%esi
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ee:	01 de                	add    %ebx,%esi
 3f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 3f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <stat>:

int
stat(const char *n, struct stat *st)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	56                   	push   %esi
 408:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 409:	83 ec 08             	sub    $0x8,%esp
 40c:	6a 00                	push   $0x0
 40e:	ff 75 08             	pushl  0x8(%ebp)
 411:	e8 ed 00 00 00       	call   503 <open>
  if(fd < 0)
 416:	83 c4 10             	add    $0x10,%esp
 419:	85 c0                	test   %eax,%eax
 41b:	78 2b                	js     448 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 41d:	83 ec 08             	sub    $0x8,%esp
 420:	ff 75 0c             	pushl  0xc(%ebp)
 423:	89 c3                	mov    %eax,%ebx
 425:	50                   	push   %eax
 426:	e8 f0 00 00 00       	call   51b <fstat>
  close(fd);
 42b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 42e:	89 c6                	mov    %eax,%esi
  close(fd);
 430:	e8 b6 00 00 00       	call   4eb <close>
  return r;
 435:	83 c4 10             	add    $0x10,%esp
}
 438:	8d 65 f8             	lea    -0x8(%ebp),%esp
 43b:	89 f0                	mov    %esi,%eax
 43d:	5b                   	pop    %ebx
 43e:	5e                   	pop    %esi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 448:	be ff ff ff ff       	mov    $0xffffffff,%esi
 44d:	eb e9                	jmp    438 <stat+0x38>
 44f:	90                   	nop

00000450 <atoi>:

int
atoi(const char *s)
{
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	53                   	push   %ebx
 458:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 45b:	0f be 02             	movsbl (%edx),%eax
 45e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 461:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 464:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 469:	77 1a                	ja     485 <atoi+0x35>
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
    n = n*10 + *s++ - '0';
 470:	83 c2 01             	add    $0x1,%edx
 473:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 476:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 47a:	0f be 02             	movsbl (%edx),%eax
 47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 480:	80 fb 09             	cmp    $0x9,%bl
 483:	76 eb                	jbe    470 <atoi+0x20>
  return n;
}
 485:	89 c8                	mov    %ecx,%eax
 487:	5b                   	pop    %ebx
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000490 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	57                   	push   %edi
 498:	8b 45 10             	mov    0x10(%ebp),%eax
 49b:	8b 55 08             	mov    0x8(%ebp),%edx
 49e:	56                   	push   %esi
 49f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4a2:	85 c0                	test   %eax,%eax
 4a4:	7e 0f                	jle    4b5 <memmove+0x25>
 4a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4a8:	89 d7                	mov    %edx,%edi
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4b1:	39 f8                	cmp    %edi,%eax
 4b3:	75 fb                	jne    4b0 <memmove+0x20>
  return vdst;
 4b5:	5e                   	pop    %esi
 4b6:	89 d0                	mov    %edx,%eax
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    

000004bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bb:	b8 01 00 00 00       	mov    $0x1,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <exit>:
SYSCALL(exit)
 4c3:	b8 02 00 00 00       	mov    $0x2,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <wait>:
SYSCALL(wait)
 4cb:	b8 03 00 00 00       	mov    $0x3,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <pipe>:
SYSCALL(pipe)
 4d3:	b8 04 00 00 00       	mov    $0x4,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <read>:
SYSCALL(read)
 4db:	b8 05 00 00 00       	mov    $0x5,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <write>:
SYSCALL(write)
 4e3:	b8 10 00 00 00       	mov    $0x10,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <close>:
SYSCALL(close)
 4eb:	b8 15 00 00 00       	mov    $0x15,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <kill>:
SYSCALL(kill)
 4f3:	b8 06 00 00 00       	mov    $0x6,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <exec>:
SYSCALL(exec)
 4fb:	b8 07 00 00 00       	mov    $0x7,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <open>:
SYSCALL(open)
 503:	b8 0f 00 00 00       	mov    $0xf,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mknod>:
SYSCALL(mknod)
 50b:	b8 11 00 00 00       	mov    $0x11,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <unlink>:
SYSCALL(unlink)
 513:	b8 12 00 00 00       	mov    $0x12,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <fstat>:
SYSCALL(fstat)
 51b:	b8 08 00 00 00       	mov    $0x8,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <link>:
SYSCALL(link)
 523:	b8 13 00 00 00       	mov    $0x13,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mkdir>:
SYSCALL(mkdir)
 52b:	b8 14 00 00 00       	mov    $0x14,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <chdir>:
SYSCALL(chdir)
 533:	b8 09 00 00 00       	mov    $0x9,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <dup>:
SYSCALL(dup)
 53b:	b8 0a 00 00 00       	mov    $0xa,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <getpid>:
SYSCALL(getpid)
 543:	b8 0b 00 00 00       	mov    $0xb,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <sbrk>:
SYSCALL(sbrk)
 54b:	b8 0c 00 00 00       	mov    $0xc,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <sleep>:
SYSCALL(sleep)
 553:	b8 0d 00 00 00       	mov    $0xd,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <uptime>:
SYSCALL(uptime)
 55b:	b8 0e 00 00 00       	mov    $0xe,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <clone>:
SYSCALL(clone)
 563:	b8 16 00 00 00       	mov    $0x16,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <join>:
 56b:	b8 17 00 00 00       	mov    $0x17,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    
 573:	66 90                	xchg   %ax,%ax
 575:	66 90                	xchg   %ax,%ax
 577:	66 90                	xchg   %ax,%ax
 579:	66 90                	xchg   %ax,%ax
 57b:	66 90                	xchg   %ax,%ax
 57d:	66 90                	xchg   %ax,%ax
 57f:	90                   	nop

00000580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 585:	a1 a0 0a 00 00       	mov    0xaa0,%eax
{
 58a:	89 e5                	mov    %esp,%ebp
 58c:	57                   	push   %edi
 58d:	56                   	push   %esi
 58e:	53                   	push   %ebx
 58f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 592:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 594:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 597:	39 c8                	cmp    %ecx,%eax
 599:	73 15                	jae    5b0 <free+0x30>
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
 5a0:	39 d1                	cmp    %edx,%ecx
 5a2:	72 14                	jb     5b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a4:	39 d0                	cmp    %edx,%eax
 5a6:	73 10                	jae    5b8 <free+0x38>
{
 5a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5aa:	8b 10                	mov    (%eax),%edx
 5ac:	39 c8                	cmp    %ecx,%eax
 5ae:	72 f0                	jb     5a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b0:	39 d0                	cmp    %edx,%eax
 5b2:	72 f4                	jb     5a8 <free+0x28>
 5b4:	39 d1                	cmp    %edx,%ecx
 5b6:	73 f0                	jae    5a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5be:	39 fa                	cmp    %edi,%edx
 5c0:	74 1e                	je     5e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5c5:	8b 50 04             	mov    0x4(%eax),%edx
 5c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5cb:	39 f1                	cmp    %esi,%ecx
 5cd:	74 28                	je     5f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 5d1:	5b                   	pop    %ebx
  freep = p;
 5d2:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 5e0:	03 72 04             	add    0x4(%edx),%esi
 5e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e6:	8b 10                	mov    (%eax),%edx
 5e8:	8b 12                	mov    (%edx),%edx
 5ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ed:	8b 50 04             	mov    0x4(%eax),%edx
 5f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f3:	39 f1                	cmp    %esi,%ecx
 5f5:	75 d8                	jne    5cf <free+0x4f>
    p->s.size += bp->s.size;
 5f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 5fa:	a3 a0 0a 00 00       	mov    %eax,0xaa0
    p->s.size += bp->s.size;
 5ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 602:	8b 53 f8             	mov    -0x8(%ebx),%edx
 605:	89 10                	mov    %edx,(%eax)
}
 607:	5b                   	pop    %ebx
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 620:	8b 3d a0 0a 00 00    	mov    0xaa0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 626:	8d 70 07             	lea    0x7(%eax),%esi
 629:	c1 ee 03             	shr    $0x3,%esi
 62c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 62f:	85 ff                	test   %edi,%edi
 631:	0f 84 a9 00 00 00    	je     6e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 637:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 639:	8b 48 04             	mov    0x4(%eax),%ecx
 63c:	39 f1                	cmp    %esi,%ecx
 63e:	73 6d                	jae    6ad <malloc+0x9d>
 640:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 646:	bb 00 10 00 00       	mov    $0x1000,%ebx
 64b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 64e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 655:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 658:	eb 17                	jmp    671 <malloc+0x61>
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 660:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 662:	8b 4a 04             	mov    0x4(%edx),%ecx
 665:	39 f1                	cmp    %esi,%ecx
 667:	73 4f                	jae    6b8 <malloc+0xa8>
 669:	8b 3d a0 0a 00 00    	mov    0xaa0,%edi
 66f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 671:	39 c7                	cmp    %eax,%edi
 673:	75 eb                	jne    660 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 675:	83 ec 0c             	sub    $0xc,%esp
 678:	ff 75 e4             	pushl  -0x1c(%ebp)
 67b:	e8 cb fe ff ff       	call   54b <sbrk>
  if(p == (char*)-1)
 680:	83 c4 10             	add    $0x10,%esp
 683:	83 f8 ff             	cmp    $0xffffffff,%eax
 686:	74 1b                	je     6a3 <malloc+0x93>
  hp->s.size = nu;
 688:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 68b:	83 ec 0c             	sub    $0xc,%esp
 68e:	83 c0 08             	add    $0x8,%eax
 691:	50                   	push   %eax
 692:	e8 e9 fe ff ff       	call   580 <free>
  return freep;
 697:	a1 a0 0a 00 00       	mov    0xaa0,%eax
      if((p = morecore(nunits)) == 0)
 69c:	83 c4 10             	add    $0x10,%esp
 69f:	85 c0                	test   %eax,%eax
 6a1:	75 bd                	jne    660 <malloc+0x50>
        return 0;
  }
}
 6a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6a6:	31 c0                	xor    %eax,%eax
}
 6a8:	5b                   	pop    %ebx
 6a9:	5e                   	pop    %esi
 6aa:	5f                   	pop    %edi
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret    
    if(p->s.size >= nunits){
 6ad:	89 c2                	mov    %eax,%edx
 6af:	89 f8                	mov    %edi,%eax
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 6b8:	39 ce                	cmp    %ecx,%esi
 6ba:	74 54                	je     710 <malloc+0x100>
        p->s.size -= nunits;
 6bc:	29 f1                	sub    %esi,%ecx
 6be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 6c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 6c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 6c7:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6cf:	8d 42 08             	lea    0x8(%edx),%eax
}
 6d2:	5b                   	pop    %ebx
 6d3:	5e                   	pop    %esi
 6d4:	5f                   	pop    %edi
 6d5:	5d                   	pop    %ebp
 6d6:	c3                   	ret    
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 6e0:	c7 05 a0 0a 00 00 a4 	movl   $0xaa4,0xaa0
 6e7:	0a 00 00 
    base.s.size = 0;
 6ea:	bf a4 0a 00 00       	mov    $0xaa4,%edi
    base.s.ptr = freep = prevp = &base;
 6ef:	c7 05 a4 0a 00 00 a4 	movl   $0xaa4,0xaa4
 6f6:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 6fb:	c7 05 a8 0a 00 00 00 	movl   $0x0,0xaa8
 702:	00 00 00 
    if(p->s.size >= nunits){
 705:	e9 36 ff ff ff       	jmp    640 <malloc+0x30>
 70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 710:	8b 0a                	mov    (%edx),%ecx
 712:	89 08                	mov    %ecx,(%eax)
 714:	eb b1                	jmp    6c7 <malloc+0xb7>
