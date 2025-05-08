
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 88 09 00 00       	push   $0x988
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 d1 05 00 00       	call   620 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 b1 02 00 00       	call   310 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 44 04 00 00       	call   4ab <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 9b 09 00 00       	push   $0x99b
  8a:	6a 01                	push   $0x1
  8c:	e8 8f 05 00 00       	call   620 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 47 04 00 00       	call   4f3 <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 0c 04 00 00       	call   4d3 <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 03 04 00 00       	call   4db <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 a5 09 00 00       	push   $0x9a5
  df:	6a 01                	push   $0x1
  e1:	e8 3a 05 00 00       	call   620 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 f8 03 00 00       	call   4f3 <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 bc 03 00 00       	call   4cb <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 bb 03 00 00       	call   4db <close>

  wait();
 120:	e8 96 03 00 00       	call   4bb <wait>

  exit();
 125:	e8 89 03 00 00       	call   4b3 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <thread_create>:
#include "user.h"
#include "x86.h"

int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	83 ec 10             	sub    $0x10,%esp
  void *stack;
  int pid;
  
  // Allocate a page for the stack
  stack = malloc(4096); // PGSIZE
 14b:	68 00 10 00 00       	push   $0x1000
 150:	e8 2b 07 00 00       	call   880 <malloc>
  if(stack == 0)
 155:	83 c4 10             	add    $0x10,%esp
 158:	85 c0                	test   %eax,%eax
 15a:	74 32                	je     18e <thread_create+0x4e>
 15c:	89 c3                	mov    %eax,%ebx
    return -1;
    
  // Ensure stack is page-aligned
  if((uint)stack % 4096) {
    stack = (void*)((uint)stack + (4096 - ((uint)stack % 4096)));
 15e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 163:	05 00 10 00 00       	add    $0x1000,%eax
 168:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 16e:	0f 45 d8             	cmovne %eax,%ebx
  }

  // Call clone system call to create the thread
  pid = clone(start_routine, arg1, arg2, stack);
 171:	53                   	push   %ebx
 172:	ff 75 10             	pushl  0x10(%ebp)
 175:	ff 75 0c             	pushl  0xc(%ebp)
 178:	ff 75 08             	pushl  0x8(%ebp)
 17b:	e8 d3 03 00 00       	call   553 <clone>
  
  if(pid == 0) {
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	74 02                	je     189 <thread_create+0x49>
    // Child thread - just return 0
    return 0;
  } else if(pid < 0) {
 187:	78 0c                	js     195 <thread_create+0x55>
    return -1;
  }
  
  // Parent - return the child thread's PID
  return pid;
}
 189:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18c:	c9                   	leave  
 18d:	c3                   	ret    
    return -1;
 18e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 193:	eb f4                	jmp    189 <thread_create+0x49>
    free(stack);
 195:	83 ec 0c             	sub    $0xc,%esp
 198:	53                   	push   %ebx
 199:	e8 52 06 00 00       	call   7f0 <free>
    return -1;
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1a6:	eb e1                	jmp    189 <thread_create+0x49>
 1a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <thread_join>:

int 
thread_join(void) 
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	83 ec 34             	sub    $0x34,%esp
  void *stack;
  int pid;
  
  // Wait for a thread to exit
  pid = join(&stack);
 1ba:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1bd:	50                   	push   %eax
 1be:	e8 98 03 00 00       	call   55b <join>
  
  if(pid > 0) {
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7f 06                	jg     1d0 <thread_join+0x20>
    // Free the thread's stack
    free(stack);
  }
  
  return pid;
}
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    free(stack);
 1d0:	83 ec 0c             	sub    $0xc,%esp
 1d3:	ff 75 f4             	pushl  -0xc(%ebp)
 1d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1d9:	e8 12 06 00 00       	call   7f0 <free>
 1de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <lock_init>:

void 
lock_init(lock_t *lock) 
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 1fa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 200:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <lock_acquire>:

void 
lock_acquire(lock_t *lock) 
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 215:	b9 01 00 00 00       	mov    $0x1,%ecx
 21a:	89 e5                	mov    %esp,%ebp
 21c:	8b 55 08             	mov    0x8(%ebp),%edx
 21f:	90                   	nop
 220:	89 c8                	mov    %ecx,%eax
 222:	f0 87 02             	lock xchg %eax,(%edx)
  // Simple test and set approach for xv6
  // Use the existing xchg function from x86.h
  while(xchg(&lock->ticket, 1) != 0)
 225:	85 c0                	test   %eax,%eax
 227:	75 f7                	jne    220 <lock_acquire+0x10>
    ; // Spin
}
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <lock_release>:

void 
lock_release(lock_t *lock) 
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
  lock->ticket = 0;
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 240:	5d                   	pop    %ebp
 241:	c3                   	ret    
 242:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 255:	31 c0                	xor    %eax,%eax
{
 257:	89 e5                	mov    %esp,%ebp
 259:	53                   	push   %ebx
 25a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 25d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 260:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 264:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 267:	83 c0 01             	add    $0x1,%eax
 26a:	84 d2                	test   %dl,%dl
 26c:	75 f2                	jne    260 <strcpy+0x10>
    ;
  return os;
}
 26e:	89 c8                	mov    %ecx,%eax
 270:	5b                   	pop    %ebx
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	53                   	push   %ebx
 288:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 28e:	0f b6 01             	movzbl (%ecx),%eax
 291:	0f b6 1a             	movzbl (%edx),%ebx
 294:	84 c0                	test   %al,%al
 296:	75 19                	jne    2b1 <strcmp+0x31>
 298:	eb 26                	jmp    2c0 <strcmp+0x40>
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2a4:	83 c1 01             	add    $0x1,%ecx
 2a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2aa:	0f b6 1a             	movzbl (%edx),%ebx
 2ad:	84 c0                	test   %al,%al
 2af:	74 0f                	je     2c0 <strcmp+0x40>
 2b1:	38 d8                	cmp    %bl,%al
 2b3:	74 eb                	je     2a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2b5:	29 d8                	sub    %ebx,%eax
}
 2b7:	5b                   	pop    %ebx
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2c2:	29 d8                	sub    %ebx,%eax
}
 2c4:	5b                   	pop    %ebx
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <strlen>:

uint
strlen(const char *s)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2da:	80 3a 00             	cmpb   $0x0,(%edx)
 2dd:	74 21                	je     300 <strlen+0x30>
 2df:	31 c0                	xor    %eax,%eax
 2e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e8:	83 c0 01             	add    $0x1,%eax
 2eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2ef:	89 c1                	mov    %eax,%ecx
 2f1:	75 f5                	jne    2e8 <strlen+0x18>
    ;
  return n;
}
 2f3:	89 c8                	mov    %ecx,%eax
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 300:	31 c9                	xor    %ecx,%ecx
}
 302:	5d                   	pop    %ebp
 303:	89 c8                	mov    %ecx,%eax
 305:	c3                   	ret    
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi

00000310 <memset>:

void*
memset(void *dst, int c, uint n)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	57                   	push   %edi
 318:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 31b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31e:	8b 45 0c             	mov    0xc(%ebp),%eax
 321:	89 d7                	mov    %edx,%edi
 323:	fc                   	cld    
 324:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <strchr>:

char*
strchr(const char *s, char c)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33e:	0f b6 10             	movzbl (%eax),%edx
 341:	84 d2                	test   %dl,%dl
 343:	75 16                	jne    35b <strchr+0x2b>
 345:	eb 21                	jmp    368 <strchr+0x38>
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax
 350:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 354:	83 c0 01             	add    $0x1,%eax
 357:	84 d2                	test   %dl,%dl
 359:	74 0d                	je     368 <strchr+0x38>
    if(*s == c)
 35b:	38 d1                	cmp    %dl,%cl
 35d:	75 f1                	jne    350 <strchr+0x20>
      return (char*)s;
  return 0;
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 368:	31 c0                	xor    %eax,%eax
}
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <gets>:

char*
gets(char *buf, int max)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 379:	31 f6                	xor    %esi,%esi
{
 37b:	53                   	push   %ebx
 37c:	89 f3                	mov    %esi,%ebx
 37e:	83 ec 1c             	sub    $0x1c,%esp
 381:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 384:	eb 33                	jmp    3b9 <gets+0x49>
 386:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 390:	83 ec 04             	sub    $0x4,%esp
 393:	8d 45 e7             	lea    -0x19(%ebp),%eax
 396:	6a 01                	push   $0x1
 398:	50                   	push   %eax
 399:	6a 00                	push   $0x0
 39b:	e8 2b 01 00 00       	call   4cb <read>
    if(cc < 1)
 3a0:	83 c4 10             	add    $0x10,%esp
 3a3:	85 c0                	test   %eax,%eax
 3a5:	7e 1c                	jle    3c3 <gets+0x53>
      break;
    buf[i++] = c;
 3a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3ab:	83 c7 01             	add    $0x1,%edi
 3ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3b1:	3c 0a                	cmp    $0xa,%al
 3b3:	74 23                	je     3d8 <gets+0x68>
 3b5:	3c 0d                	cmp    $0xd,%al
 3b7:	74 1f                	je     3d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 3b9:	83 c3 01             	add    $0x1,%ebx
 3bc:	89 fe                	mov    %edi,%esi
 3be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3c1:	7c cd                	jl     390 <gets+0x20>
 3c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ce:	5b                   	pop    %ebx
 3cf:	5e                   	pop    %esi
 3d0:	5f                   	pop    %edi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d7:	90                   	nop
 3d8:	8b 75 08             	mov    0x8(%ebp),%esi
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	01 de                	add    %ebx,%esi
 3e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 3e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f9:	83 ec 08             	sub    $0x8,%esp
 3fc:	6a 00                	push   $0x0
 3fe:	ff 75 08             	pushl  0x8(%ebp)
 401:	e8 ed 00 00 00       	call   4f3 <open>
  if(fd < 0)
 406:	83 c4 10             	add    $0x10,%esp
 409:	85 c0                	test   %eax,%eax
 40b:	78 2b                	js     438 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 40d:	83 ec 08             	sub    $0x8,%esp
 410:	ff 75 0c             	pushl  0xc(%ebp)
 413:	89 c3                	mov    %eax,%ebx
 415:	50                   	push   %eax
 416:	e8 f0 00 00 00       	call   50b <fstat>
  close(fd);
 41b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 41e:	89 c6                	mov    %eax,%esi
  close(fd);
 420:	e8 b6 00 00 00       	call   4db <close>
  return r;
 425:	83 c4 10             	add    $0x10,%esp
}
 428:	8d 65 f8             	lea    -0x8(%ebp),%esp
 42b:	89 f0                	mov    %esi,%eax
 42d:	5b                   	pop    %ebx
 42e:	5e                   	pop    %esi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 438:	be ff ff ff ff       	mov    $0xffffffff,%esi
 43d:	eb e9                	jmp    428 <stat+0x38>
 43f:	90                   	nop

00000440 <atoi>:

int
atoi(const char *s)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	53                   	push   %ebx
 448:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 44b:	0f be 02             	movsbl (%edx),%eax
 44e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 451:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 454:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 459:	77 1a                	ja     475 <atoi+0x35>
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop
    n = n*10 + *s++ - '0';
 460:	83 c2 01             	add    $0x1,%edx
 463:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 466:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 46a:	0f be 02             	movsbl (%edx),%eax
 46d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 470:	80 fb 09             	cmp    $0x9,%bl
 473:	76 eb                	jbe    460 <atoi+0x20>
  return n;
}
 475:	89 c8                	mov    %ecx,%eax
 477:	5b                   	pop    %ebx
 478:	5d                   	pop    %ebp
 479:	c3                   	ret    
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000480 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	57                   	push   %edi
 488:	8b 45 10             	mov    0x10(%ebp),%eax
 48b:	8b 55 08             	mov    0x8(%ebp),%edx
 48e:	56                   	push   %esi
 48f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 492:	85 c0                	test   %eax,%eax
 494:	7e 0f                	jle    4a5 <memmove+0x25>
 496:	01 d0                	add    %edx,%eax
  dst = vdst;
 498:	89 d7                	mov    %edx,%edi
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4a1:	39 f8                	cmp    %edi,%eax
 4a3:	75 fb                	jne    4a0 <memmove+0x20>
  return vdst;
 4a5:	5e                   	pop    %esi
 4a6:	89 d0                	mov    %edx,%eax
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    

000004ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ab:	b8 01 00 00 00       	mov    $0x1,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <exit>:
SYSCALL(exit)
 4b3:	b8 02 00 00 00       	mov    $0x2,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <wait>:
SYSCALL(wait)
 4bb:	b8 03 00 00 00       	mov    $0x3,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <pipe>:
SYSCALL(pipe)
 4c3:	b8 04 00 00 00       	mov    $0x4,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <read>:
SYSCALL(read)
 4cb:	b8 05 00 00 00       	mov    $0x5,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <write>:
SYSCALL(write)
 4d3:	b8 10 00 00 00       	mov    $0x10,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <close>:
SYSCALL(close)
 4db:	b8 15 00 00 00       	mov    $0x15,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <kill>:
SYSCALL(kill)
 4e3:	b8 06 00 00 00       	mov    $0x6,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <exec>:
SYSCALL(exec)
 4eb:	b8 07 00 00 00       	mov    $0x7,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <open>:
SYSCALL(open)
 4f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <mknod>:
SYSCALL(mknod)
 4fb:	b8 11 00 00 00       	mov    $0x11,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <unlink>:
SYSCALL(unlink)
 503:	b8 12 00 00 00       	mov    $0x12,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <fstat>:
SYSCALL(fstat)
 50b:	b8 08 00 00 00       	mov    $0x8,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <link>:
SYSCALL(link)
 513:	b8 13 00 00 00       	mov    $0x13,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <mkdir>:
SYSCALL(mkdir)
 51b:	b8 14 00 00 00       	mov    $0x14,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <chdir>:
SYSCALL(chdir)
 523:	b8 09 00 00 00       	mov    $0x9,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <dup>:
SYSCALL(dup)
 52b:	b8 0a 00 00 00       	mov    $0xa,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <getpid>:
SYSCALL(getpid)
 533:	b8 0b 00 00 00       	mov    $0xb,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <sbrk>:
SYSCALL(sbrk)
 53b:	b8 0c 00 00 00       	mov    $0xc,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <sleep>:
SYSCALL(sleep)
 543:	b8 0d 00 00 00       	mov    $0xd,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <uptime>:
SYSCALL(uptime)
 54b:	b8 0e 00 00 00       	mov    $0xe,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <clone>:
SYSCALL(clone)
 553:	b8 16 00 00 00       	mov    $0x16,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <join>:
 55b:	b8 17 00 00 00       	mov    $0x17,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    
 563:	66 90                	xchg   %ax,%ax
 565:	66 90                	xchg   %ax,%ax
 567:	66 90                	xchg   %ax,%ax
 569:	66 90                	xchg   %ax,%ax
 56b:	66 90                	xchg   %ax,%ax
 56d:	66 90                	xchg   %ax,%ax
 56f:	90                   	nop

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
 579:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 57c:	89 d1                	mov    %edx,%ecx
{
 57e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 581:	85 d2                	test   %edx,%edx
 583:	0f 89 7f 00 00 00    	jns    608 <printint+0x98>
 589:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 58d:	74 79                	je     608 <printint+0x98>
    neg = 1;
 58f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 596:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 598:	31 db                	xor    %ebx,%ebx
 59a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 cf                	mov    %ecx,%edi
 5a6:	f7 75 c4             	divl   -0x3c(%ebp)
 5a9:	0f b6 92 b4 09 00 00 	movzbl 0x9b4(%edx),%edx
 5b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5c1:	76 dd                	jbe    5a0 <printint+0x30>
  if(neg)
 5c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5c6:	85 c9                	test   %ecx,%ecx
 5c8:	74 0c                	je     5d6 <printint+0x66>
    buf[i++] = '-';
 5ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5dd:	eb 07                	jmp    5e6 <printint+0x76>
 5df:	90                   	nop
 5e0:	0f b6 13             	movzbl (%ebx),%edx
 5e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ec:	6a 01                	push   $0x1
 5ee:	56                   	push   %esi
 5ef:	57                   	push   %edi
 5f0:	e8 de fe ff ff       	call   4d3 <write>
  while(--i >= 0)
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	39 de                	cmp    %ebx,%esi
 5fa:	75 e4                	jne    5e0 <printint+0x70>
    putc(fd, buf[i]);
}
 5fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 608:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 60f:	eb 87                	jmp    598 <printint+0x28>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62d:	8b 75 0c             	mov    0xc(%ebp),%esi
 630:	0f b6 1e             	movzbl (%esi),%ebx
 633:	84 db                	test   %bl,%bl
 635:	0f 84 b4 00 00 00    	je     6ef <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 63b:	8d 45 10             	lea    0x10(%ebp),%eax
 63e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 641:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 644:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 646:	89 45 d0             	mov    %eax,-0x30(%ebp)
 649:	eb 33                	jmp    67e <printf+0x5e>
 64b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
 650:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 653:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 658:	83 f8 25             	cmp    $0x25,%eax
 65b:	74 17                	je     674 <printf+0x54>
  write(fd, &c, 1);
 65d:	83 ec 04             	sub    $0x4,%esp
 660:	88 5d e7             	mov    %bl,-0x19(%ebp)
 663:	6a 01                	push   $0x1
 665:	57                   	push   %edi
 666:	ff 75 08             	pushl  0x8(%ebp)
 669:	e8 65 fe ff ff       	call   4d3 <write>
 66e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 671:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 674:	0f b6 1e             	movzbl (%esi),%ebx
 677:	83 c6 01             	add    $0x1,%esi
 67a:	84 db                	test   %bl,%bl
 67c:	74 71                	je     6ef <printf+0xcf>
    c = fmt[i] & 0xff;
 67e:	0f be cb             	movsbl %bl,%ecx
 681:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 684:	85 d2                	test   %edx,%edx
 686:	74 c8                	je     650 <printf+0x30>
      }
    } else if(state == '%'){
 688:	83 fa 25             	cmp    $0x25,%edx
 68b:	75 e7                	jne    674 <printf+0x54>
      if(c == 'd'){
 68d:	83 f8 64             	cmp    $0x64,%eax
 690:	0f 84 9a 00 00 00    	je     730 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 696:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 69c:	83 f9 70             	cmp    $0x70,%ecx
 69f:	74 5f                	je     700 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6a1:	83 f8 73             	cmp    $0x73,%eax
 6a4:	0f 84 d6 00 00 00    	je     780 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6aa:	83 f8 63             	cmp    $0x63,%eax
 6ad:	0f 84 8d 00 00 00    	je     740 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6b3:	83 f8 25             	cmp    $0x25,%eax
 6b6:	0f 84 b4 00 00 00    	je     770 <printf+0x150>
  write(fd, &c, 1);
 6bc:	83 ec 04             	sub    $0x4,%esp
 6bf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	57                   	push   %edi
 6c6:	ff 75 08             	pushl  0x8(%ebp)
 6c9:	e8 05 fe ff ff       	call   4d3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ce:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6d1:	83 c4 0c             	add    $0xc,%esp
 6d4:	6a 01                	push   $0x1
 6d6:	83 c6 01             	add    $0x1,%esi
 6d9:	57                   	push   %edi
 6da:	ff 75 08             	pushl  0x8(%ebp)
 6dd:	e8 f1 fd ff ff       	call   4d3 <write>
  for(i = 0; fmt[i]; i++){
 6e2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6e6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6e9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6eb:	84 db                	test   %bl,%bl
 6ed:	75 8f                	jne    67e <printf+0x5e>
    }
  }
}
 6ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 10 00 00 00       	mov    $0x10,%ecx
 708:	6a 00                	push   $0x0
 70a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	8b 13                	mov    (%ebx),%edx
 712:	e8 59 fe ff ff       	call   570 <printint>
        ap++;
 717:	89 d8                	mov    %ebx,%eax
 719:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71c:	31 d2                	xor    %edx,%edx
        ap++;
 71e:	83 c0 04             	add    $0x4,%eax
 721:	89 45 d0             	mov    %eax,-0x30(%ebp)
 724:	e9 4b ff ff ff       	jmp    674 <printf+0x54>
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	eb ce                	jmp    70a <printf+0xea>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 740:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 746:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 748:	6a 01                	push   $0x1
        ap++;
 74a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 74d:	57                   	push   %edi
 74e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 751:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 754:	e8 7a fd ff ff       	call   4d3 <write>
        ap++;
 759:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 75c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75f:	31 d2                	xor    %edx,%edx
 761:	e9 0e ff ff ff       	jmp    674 <printf+0x54>
 766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 770:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
 776:	e9 59 ff ff ff       	jmp    6d4 <printf+0xb4>
 77b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
        s = (char*)*ap;
 780:	8b 45 d0             	mov    -0x30(%ebp),%eax
 783:	8b 18                	mov    (%eax),%ebx
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 78b:	85 db                	test   %ebx,%ebx
 78d:	74 17                	je     7a6 <printf+0x186>
        while(*s != 0){
 78f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 792:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 794:	84 c0                	test   %al,%al
 796:	0f 84 d8 fe ff ff    	je     674 <printf+0x54>
 79c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 79f:	89 de                	mov    %ebx,%esi
 7a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a4:	eb 1a                	jmp    7c0 <printf+0x1a0>
          s = "(null)";
 7a6:	bb ab 09 00 00       	mov    $0x9ab,%ebx
        while(*s != 0){
 7ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ae:	b8 28 00 00 00       	mov    $0x28,%eax
 7b3:	89 de                	mov    %ebx,%esi
 7b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7c3:	83 c6 01             	add    $0x1,%esi
 7c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7c9:	6a 01                	push   $0x1
 7cb:	57                   	push   %edi
 7cc:	53                   	push   %ebx
 7cd:	e8 01 fd ff ff       	call   4d3 <write>
        while(*s != 0){
 7d2:	0f b6 06             	movzbl (%esi),%eax
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	84 c0                	test   %al,%al
 7da:	75 e4                	jne    7c0 <printf+0x1a0>
 7dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 8e fe ff ff       	jmp    674 <printf+0x54>
 7e6:	66 90                	xchg   %ax,%ax
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	f3 0f 1e fb          	endbr32 
 7f4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f5:	a1 1c 0d 00 00       	mov    0xd1c,%eax
{
 7fa:	89 e5                	mov    %esp,%ebp
 7fc:	57                   	push   %edi
 7fd:	56                   	push   %esi
 7fe:	53                   	push   %ebx
 7ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 802:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 804:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 807:	39 c8                	cmp    %ecx,%eax
 809:	73 15                	jae    820 <free+0x30>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
 810:	39 d1                	cmp    %edx,%ecx
 812:	72 14                	jb     828 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	39 d0                	cmp    %edx,%eax
 816:	73 10                	jae    828 <free+0x38>
{
 818:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81a:	8b 10                	mov    (%eax),%edx
 81c:	39 c8                	cmp    %ecx,%eax
 81e:	72 f0                	jb     810 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	39 d0                	cmp    %edx,%eax
 822:	72 f4                	jb     818 <free+0x28>
 824:	39 d1                	cmp    %edx,%ecx
 826:	73 f0                	jae    818 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 828:	8b 73 fc             	mov    -0x4(%ebx),%esi
 82b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 82e:	39 fa                	cmp    %edi,%edx
 830:	74 1e                	je     850 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 832:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 835:	8b 50 04             	mov    0x4(%eax),%edx
 838:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 83b:	39 f1                	cmp    %esi,%ecx
 83d:	74 28                	je     867 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 83f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 841:	5b                   	pop    %ebx
  freep = p;
 842:	a3 1c 0d 00 00       	mov    %eax,0xd1c
}
 847:	5e                   	pop    %esi
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret    
 84b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 850:	03 72 04             	add    0x4(%edx),%esi
 853:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 856:	8b 10                	mov    (%eax),%edx
 858:	8b 12                	mov    (%edx),%edx
 85a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 85d:	8b 50 04             	mov    0x4(%eax),%edx
 860:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 863:	39 f1                	cmp    %esi,%ecx
 865:	75 d8                	jne    83f <free+0x4f>
    p->s.size += bp->s.size;
 867:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 86a:	a3 1c 0d 00 00       	mov    %eax,0xd1c
    p->s.size += bp->s.size;
 86f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 872:	8b 53 f8             	mov    -0x8(%ebx),%edx
 875:	89 10                	mov    %edx,(%eax)
}
 877:	5b                   	pop    %ebx
 878:	5e                   	pop    %esi
 879:	5f                   	pop    %edi
 87a:	5d                   	pop    %ebp
 87b:	c3                   	ret    
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	f3 0f 1e fb          	endbr32 
 884:	55                   	push   %ebp
 885:	89 e5                	mov    %esp,%ebp
 887:	57                   	push   %edi
 888:	56                   	push   %esi
 889:	53                   	push   %ebx
 88a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 890:	8b 3d 1c 0d 00 00    	mov    0xd1c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 896:	8d 70 07             	lea    0x7(%eax),%esi
 899:	c1 ee 03             	shr    $0x3,%esi
 89c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 89f:	85 ff                	test   %edi,%edi
 8a1:	0f 84 a9 00 00 00    	je     950 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8a9:	8b 48 04             	mov    0x4(%eax),%ecx
 8ac:	39 f1                	cmp    %esi,%ecx
 8ae:	73 6d                	jae    91d <malloc+0x9d>
 8b0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8b6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8bb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8be:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8c8:	eb 17                	jmp    8e1 <malloc+0x61>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8d2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8d5:	39 f1                	cmp    %esi,%ecx
 8d7:	73 4f                	jae    928 <malloc+0xa8>
 8d9:	8b 3d 1c 0d 00 00    	mov    0xd1c,%edi
 8df:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8e1:	39 c7                	cmp    %eax,%edi
 8e3:	75 eb                	jne    8d0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8e5:	83 ec 0c             	sub    $0xc,%esp
 8e8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8eb:	e8 4b fc ff ff       	call   53b <sbrk>
  if(p == (char*)-1)
 8f0:	83 c4 10             	add    $0x10,%esp
 8f3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8f6:	74 1b                	je     913 <malloc+0x93>
  hp->s.size = nu;
 8f8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8fb:	83 ec 0c             	sub    $0xc,%esp
 8fe:	83 c0 08             	add    $0x8,%eax
 901:	50                   	push   %eax
 902:	e8 e9 fe ff ff       	call   7f0 <free>
  return freep;
 907:	a1 1c 0d 00 00       	mov    0xd1c,%eax
      if((p = morecore(nunits)) == 0)
 90c:	83 c4 10             	add    $0x10,%esp
 90f:	85 c0                	test   %eax,%eax
 911:	75 bd                	jne    8d0 <malloc+0x50>
        return 0;
  }
}
 913:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 916:	31 c0                	xor    %eax,%eax
}
 918:	5b                   	pop    %ebx
 919:	5e                   	pop    %esi
 91a:	5f                   	pop    %edi
 91b:	5d                   	pop    %ebp
 91c:	c3                   	ret    
    if(p->s.size >= nunits){
 91d:	89 c2                	mov    %eax,%edx
 91f:	89 f8                	mov    %edi,%eax
 921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 928:	39 ce                	cmp    %ecx,%esi
 92a:	74 54                	je     980 <malloc+0x100>
        p->s.size -= nunits;
 92c:	29 f1                	sub    %esi,%ecx
 92e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 931:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 934:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 937:	a3 1c 0d 00 00       	mov    %eax,0xd1c
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 93f:	8d 42 08             	lea    0x8(%edx),%eax
}
 942:	5b                   	pop    %ebx
 943:	5e                   	pop    %esi
 944:	5f                   	pop    %edi
 945:	5d                   	pop    %ebp
 946:	c3                   	ret    
 947:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 950:	c7 05 1c 0d 00 00 20 	movl   $0xd20,0xd1c
 957:	0d 00 00 
    base.s.size = 0;
 95a:	bf 20 0d 00 00       	mov    $0xd20,%edi
    base.s.ptr = freep = prevp = &base;
 95f:	c7 05 20 0d 00 00 20 	movl   $0xd20,0xd20
 966:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 969:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 96b:	c7 05 24 0d 00 00 00 	movl   $0x0,0xd24
 972:	00 00 00 
    if(p->s.size >= nunits){
 975:	e9 36 ff ff ff       	jmp    8b0 <malloc+0x30>
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 980:	8b 0a                	mov    (%edx),%ecx
 982:	89 08                	mov    %ecx,(%eax)
 984:	eb b1                	jmp    937 <malloc+0xb7>
