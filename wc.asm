
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 07 05 00 00       	call   543 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 cd 04 00 00       	call   52b <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 98 04 00 00       	call   503 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 fb 09 00 00       	push   $0x9fb
  73:	6a 01                	push   $0x1
  75:	e8 f6 05 00 00       	call   670 <printf>
      exit();
  7a:	e8 84 04 00 00       	call   503 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 ed 09 00 00       	push   $0x9ed
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 71 04 00 00       	call   503 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 e0 0d 00 00       	push   $0xde0
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 3e 04 00 00       	call   51b <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 e0 0d 00 00 	movsbl 0xde0(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 d8 09 00 00       	push   $0x9d8
 117:	e8 64 02 00 00       	call   380 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 ee 09 00 00       	push   $0x9ee
 15c:	6a 01                	push   $0x1
 15e:	e8 0d 05 00 00       	call   670 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 de 09 00 00       	push   $0x9de
 175:	6a 01                	push   $0x1
 177:	e8 f4 04 00 00       	call   670 <printf>
    exit();
 17c:	e8 82 03 00 00       	call   503 <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <thread_create>:
#include "user.h"
#include "x86.h"

int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	53                   	push   %ebx
 198:	83 ec 10             	sub    $0x10,%esp
  void *stack;
  int pid;
  
  // Allocate a page for the stack
  stack = malloc(4096); // PGSIZE
 19b:	68 00 10 00 00       	push   $0x1000
 1a0:	e8 2b 07 00 00       	call   8d0 <malloc>
  if(stack == 0)
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	85 c0                	test   %eax,%eax
 1aa:	74 32                	je     1de <thread_create+0x4e>
 1ac:	89 c3                	mov    %eax,%ebx
    return -1;
    
  // Ensure stack is page-aligned
  if((uint)stack % 4096) {
    stack = (void*)((uint)stack + (4096 - ((uint)stack % 4096)));
 1ae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 1b3:	05 00 10 00 00       	add    $0x1000,%eax
 1b8:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 1be:	0f 45 d8             	cmovne %eax,%ebx
  }

  // Call clone system call to create the thread
  pid = clone(start_routine, arg1, arg2, stack);
 1c1:	53                   	push   %ebx
 1c2:	ff 75 10             	pushl  0x10(%ebp)
 1c5:	ff 75 0c             	pushl  0xc(%ebp)
 1c8:	ff 75 08             	pushl  0x8(%ebp)
 1cb:	e8 d3 03 00 00       	call   5a3 <clone>
  
  if(pid == 0) {
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	85 c0                	test   %eax,%eax
 1d5:	74 02                	je     1d9 <thread_create+0x49>
    // Child thread - just return 0
    return 0;
  } else if(pid < 0) {
 1d7:	78 0c                	js     1e5 <thread_create+0x55>
    return -1;
  }
  
  // Parent - return the child thread's PID
  return pid;
}
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    
    return -1;
 1de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e3:	eb f4                	jmp    1d9 <thread_create+0x49>
    free(stack);
 1e5:	83 ec 0c             	sub    $0xc,%esp
 1e8:	53                   	push   %ebx
 1e9:	e8 52 06 00 00       	call   840 <free>
    return -1;
 1ee:	83 c4 10             	add    $0x10,%esp
 1f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1f6:	eb e1                	jmp    1d9 <thread_create+0x49>
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <thread_join>:

int 
thread_join(void) 
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	83 ec 34             	sub    $0x34,%esp
  void *stack;
  int pid;
  
  // Wait for a thread to exit
  pid = join(&stack);
 20a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 20d:	50                   	push   %eax
 20e:	e8 98 03 00 00       	call   5ab <join>
  
  if(pid > 0) {
 213:	83 c4 10             	add    $0x10,%esp
 216:	85 c0                	test   %eax,%eax
 218:	7f 06                	jg     220 <thread_join+0x20>
    // Free the thread's stack
    free(stack);
  }
  
  return pid;
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    free(stack);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	ff 75 f4             	pushl  -0xc(%ebp)
 226:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 229:	e8 12 06 00 00       	call   840 <free>
 22e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	c9                   	leave  
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <lock_init>:

void 
lock_init(lock_t *lock) 
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 24a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 250:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <lock_acquire>:

void 
lock_acquire(lock_t *lock) 
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 265:	b9 01 00 00 00       	mov    $0x1,%ecx
 26a:	89 e5                	mov    %esp,%ebp
 26c:	8b 55 08             	mov    0x8(%ebp),%edx
 26f:	90                   	nop
 270:	89 c8                	mov    %ecx,%eax
 272:	f0 87 02             	lock xchg %eax,(%edx)
  // Simple test and set approach for xv6
  // Use the existing xchg function from x86.h
  while(xchg(&lock->ticket, 1) != 0)
 275:	85 c0                	test   %eax,%eax
 277:	75 f7                	jne    270 <lock_acquire+0x10>
    ; // Spin
}
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <lock_release>:

void 
lock_release(lock_t *lock) 
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
  lock->ticket = 0;
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 290:	5d                   	pop    %ebp
 291:	c3                   	ret    
 292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a5:	31 c0                	xor    %eax,%eax
{
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	53                   	push   %ebx
 2aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 2b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2b7:	83 c0 01             	add    $0x1,%eax
 2ba:	84 d2                	test   %dl,%dl
 2bc:	75 f2                	jne    2b0 <strcpy+0x10>
    ;
  return os;
}
 2be:	89 c8                	mov    %ecx,%eax
 2c0:	5b                   	pop    %ebx
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2de:	0f b6 01             	movzbl (%ecx),%eax
 2e1:	0f b6 1a             	movzbl (%edx),%ebx
 2e4:	84 c0                	test   %al,%al
 2e6:	75 19                	jne    301 <strcmp+0x31>
 2e8:	eb 26                	jmp    310 <strcmp+0x40>
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2f4:	83 c1 01             	add    $0x1,%ecx
 2f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2fa:	0f b6 1a             	movzbl (%edx),%ebx
 2fd:	84 c0                	test   %al,%al
 2ff:	74 0f                	je     310 <strcmp+0x40>
 301:	38 d8                	cmp    %bl,%al
 303:	74 eb                	je     2f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 305:	29 d8                	sub    %ebx,%eax
}
 307:	5b                   	pop    %ebx
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 310:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 312:	29 d8                	sub    %ebx,%eax
}
 314:	5b                   	pop    %ebx
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <strlen>:

uint
strlen(const char *s)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 32a:	80 3a 00             	cmpb   $0x0,(%edx)
 32d:	74 21                	je     350 <strlen+0x30>
 32f:	31 c0                	xor    %eax,%eax
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	83 c0 01             	add    $0x1,%eax
 33b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 33f:	89 c1                	mov    %eax,%ecx
 341:	75 f5                	jne    338 <strlen+0x18>
    ;
  return n;
}
 343:	89 c8                	mov    %ecx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 350:	31 c9                	xor    %ecx,%ecx
}
 352:	5d                   	pop    %ebp
 353:	89 c8                	mov    %ecx,%eax
 355:	c3                   	ret    
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 36b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	89 d7                	mov    %edx,%edi
 373:	fc                   	cld    
 374:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <strchr>:

char*
strchr(const char *s, char c)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 38e:	0f b6 10             	movzbl (%eax),%edx
 391:	84 d2                	test   %dl,%dl
 393:	75 16                	jne    3ab <strchr+0x2b>
 395:	eb 21                	jmp    3b8 <strchr+0x38>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
 3a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3a4:	83 c0 01             	add    $0x1,%eax
 3a7:	84 d2                	test   %dl,%dl
 3a9:	74 0d                	je     3b8 <strchr+0x38>
    if(*s == c)
 3ab:	38 d1                	cmp    %dl,%cl
 3ad:	75 f1                	jne    3a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3b8:	31 c0                	xor    %eax,%eax
}
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <gets>:

char*
gets(char *buf, int max)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c9:	31 f6                	xor    %esi,%esi
{
 3cb:	53                   	push   %ebx
 3cc:	89 f3                	mov    %esi,%ebx
 3ce:	83 ec 1c             	sub    $0x1c,%esp
 3d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3d4:	eb 33                	jmp    409 <gets+0x49>
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3e6:	6a 01                	push   $0x1
 3e8:	50                   	push   %eax
 3e9:	6a 00                	push   $0x0
 3eb:	e8 2b 01 00 00       	call   51b <read>
    if(cc < 1)
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	85 c0                	test   %eax,%eax
 3f5:	7e 1c                	jle    413 <gets+0x53>
      break;
    buf[i++] = c;
 3f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fb:	83 c7 01             	add    $0x1,%edi
 3fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 401:	3c 0a                	cmp    $0xa,%al
 403:	74 23                	je     428 <gets+0x68>
 405:	3c 0d                	cmp    $0xd,%al
 407:	74 1f                	je     428 <gets+0x68>
  for(i=0; i+1 < max; ){
 409:	83 c3 01             	add    $0x1,%ebx
 40c:	89 fe                	mov    %edi,%esi
 40e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 411:	7c cd                	jl     3e0 <gets+0x20>
 413:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 415:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 418:	c6 03 00             	movb   $0x0,(%ebx)
}
 41b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5f                   	pop    %edi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	8b 75 08             	mov    0x8(%ebp),%esi
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	01 de                	add    %ebx,%esi
 430:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 432:	c6 03 00             	movb   $0x0,(%ebx)
}
 435:	8d 65 f4             	lea    -0xc(%ebp),%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5f                   	pop    %edi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <stat>:

int
stat(const char *n, struct stat *st)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	56                   	push   %esi
 448:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 449:	83 ec 08             	sub    $0x8,%esp
 44c:	6a 00                	push   $0x0
 44e:	ff 75 08             	pushl  0x8(%ebp)
 451:	e8 ed 00 00 00       	call   543 <open>
  if(fd < 0)
 456:	83 c4 10             	add    $0x10,%esp
 459:	85 c0                	test   %eax,%eax
 45b:	78 2b                	js     488 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 45d:	83 ec 08             	sub    $0x8,%esp
 460:	ff 75 0c             	pushl  0xc(%ebp)
 463:	89 c3                	mov    %eax,%ebx
 465:	50                   	push   %eax
 466:	e8 f0 00 00 00       	call   55b <fstat>
  close(fd);
 46b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 46e:	89 c6                	mov    %eax,%esi
  close(fd);
 470:	e8 b6 00 00 00       	call   52b <close>
  return r;
 475:	83 c4 10             	add    $0x10,%esp
}
 478:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47b:	89 f0                	mov    %esi,%eax
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 488:	be ff ff ff ff       	mov    $0xffffffff,%esi
 48d:	eb e9                	jmp    478 <stat+0x38>
 48f:	90                   	nop

00000490 <atoi>:

int
atoi(const char *s)
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	53                   	push   %ebx
 498:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 49b:	0f be 02             	movsbl (%edx),%eax
 49e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4a9:	77 1a                	ja     4c5 <atoi+0x35>
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
    n = n*10 + *s++ - '0';
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ba:	0f be 02             	movsbl (%edx),%eax
 4bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
  return n;
}
 4c5:	89 c8                	mov    %ecx,%eax
 4c7:	5b                   	pop    %ebx
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	8b 45 10             	mov    0x10(%ebp),%eax
 4db:	8b 55 08             	mov    0x8(%ebp),%edx
 4de:	56                   	push   %esi
 4df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e2:	85 c0                	test   %eax,%eax
 4e4:	7e 0f                	jle    4f5 <memmove+0x25>
 4e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4e8:	89 d7                	mov    %edx,%edi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4f1:	39 f8                	cmp    %edi,%eax
 4f3:	75 fb                	jne    4f0 <memmove+0x20>
  return vdst;
 4f5:	5e                   	pop    %esi
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    

000004fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fb:	b8 01 00 00 00       	mov    $0x1,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <exit>:
SYSCALL(exit)
 503:	b8 02 00 00 00       	mov    $0x2,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <wait>:
SYSCALL(wait)
 50b:	b8 03 00 00 00       	mov    $0x3,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <pipe>:
SYSCALL(pipe)
 513:	b8 04 00 00 00       	mov    $0x4,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <read>:
SYSCALL(read)
 51b:	b8 05 00 00 00       	mov    $0x5,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <write>:
SYSCALL(write)
 523:	b8 10 00 00 00       	mov    $0x10,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <close>:
SYSCALL(close)
 52b:	b8 15 00 00 00       	mov    $0x15,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <kill>:
SYSCALL(kill)
 533:	b8 06 00 00 00       	mov    $0x6,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <exec>:
SYSCALL(exec)
 53b:	b8 07 00 00 00       	mov    $0x7,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <open>:
SYSCALL(open)
 543:	b8 0f 00 00 00       	mov    $0xf,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mknod>:
SYSCALL(mknod)
 54b:	b8 11 00 00 00       	mov    $0x11,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <unlink>:
SYSCALL(unlink)
 553:	b8 12 00 00 00       	mov    $0x12,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <fstat>:
SYSCALL(fstat)
 55b:	b8 08 00 00 00       	mov    $0x8,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <link>:
SYSCALL(link)
 563:	b8 13 00 00 00       	mov    $0x13,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <mkdir>:
SYSCALL(mkdir)
 56b:	b8 14 00 00 00       	mov    $0x14,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <chdir>:
SYSCALL(chdir)
 573:	b8 09 00 00 00       	mov    $0x9,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <dup>:
SYSCALL(dup)
 57b:	b8 0a 00 00 00       	mov    $0xa,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getpid>:
SYSCALL(getpid)
 583:	b8 0b 00 00 00       	mov    $0xb,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sbrk>:
SYSCALL(sbrk)
 58b:	b8 0c 00 00 00       	mov    $0xc,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <sleep>:
SYSCALL(sleep)
 593:	b8 0d 00 00 00       	mov    $0xd,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <uptime>:
SYSCALL(uptime)
 59b:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <clone>:
SYSCALL(clone)
 5a3:	b8 16 00 00 00       	mov    $0x16,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <join>:
 5ab:	b8 17 00 00 00       	mov    $0x17,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    
 5b3:	66 90                	xchg   %ax,%ax
 5b5:	66 90                	xchg   %ax,%ax
 5b7:	66 90                	xchg   %ax,%ax
 5b9:	66 90                	xchg   %ax,%ax
 5bb:	66 90                	xchg   %ax,%ax
 5bd:	66 90                	xchg   %ax,%ax
 5bf:	90                   	nop

000005c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 3c             	sub    $0x3c,%esp
 5c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5cc:	89 d1                	mov    %edx,%ecx
{
 5ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5d1:	85 d2                	test   %edx,%edx
 5d3:	0f 89 7f 00 00 00    	jns    658 <printint+0x98>
 5d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5dd:	74 79                	je     658 <printint+0x98>
    neg = 1;
 5df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5e8:	31 db                	xor    %ebx,%ebx
 5ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5f0:	89 c8                	mov    %ecx,%eax
 5f2:	31 d2                	xor    %edx,%edx
 5f4:	89 cf                	mov    %ecx,%edi
 5f6:	f7 75 c4             	divl   -0x3c(%ebp)
 5f9:	0f b6 92 18 0a 00 00 	movzbl 0xa18(%edx),%edx
 600:	89 45 c0             	mov    %eax,-0x40(%ebp)
 603:	89 d8                	mov    %ebx,%eax
 605:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 608:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 60b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 60e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 611:	76 dd                	jbe    5f0 <printint+0x30>
  if(neg)
 613:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 616:	85 c9                	test   %ecx,%ecx
 618:	74 0c                	je     626 <printint+0x66>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 61f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 621:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 626:	8b 7d b8             	mov    -0x48(%ebp),%edi
 629:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 62d:	eb 07                	jmp    636 <printint+0x76>
 62f:	90                   	nop
 630:	0f b6 13             	movzbl (%ebx),%edx
 633:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 636:	83 ec 04             	sub    $0x4,%esp
 639:	88 55 d7             	mov    %dl,-0x29(%ebp)
 63c:	6a 01                	push   $0x1
 63e:	56                   	push   %esi
 63f:	57                   	push   %edi
 640:	e8 de fe ff ff       	call   523 <write>
  while(--i >= 0)
 645:	83 c4 10             	add    $0x10,%esp
 648:	39 de                	cmp    %ebx,%esi
 64a:	75 e4                	jne    630 <printint+0x70>
    putc(fd, buf[i]);
}
 64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 658:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 65f:	eb 87                	jmp    5e8 <printint+0x28>
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	57                   	push   %edi
 678:	56                   	push   %esi
 679:	53                   	push   %ebx
 67a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 67d:	8b 75 0c             	mov    0xc(%ebp),%esi
 680:	0f b6 1e             	movzbl (%esi),%ebx
 683:	84 db                	test   %bl,%bl
 685:	0f 84 b4 00 00 00    	je     73f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 68b:	8d 45 10             	lea    0x10(%ebp),%eax
 68e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 691:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 694:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 696:	89 45 d0             	mov    %eax,-0x30(%ebp)
 699:	eb 33                	jmp    6ce <printf+0x5e>
 69b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
 6a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	74 17                	je     6c4 <printf+0x54>
  write(fd, &c, 1);
 6ad:	83 ec 04             	sub    $0x4,%esp
 6b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6b3:	6a 01                	push   $0x1
 6b5:	57                   	push   %edi
 6b6:	ff 75 08             	pushl  0x8(%ebp)
 6b9:	e8 65 fe ff ff       	call   523 <write>
 6be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c4:	0f b6 1e             	movzbl (%esi),%ebx
 6c7:	83 c6 01             	add    $0x1,%esi
 6ca:	84 db                	test   %bl,%bl
 6cc:	74 71                	je     73f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ce:	0f be cb             	movsbl %bl,%ecx
 6d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6d4:	85 d2                	test   %edx,%edx
 6d6:	74 c8                	je     6a0 <printf+0x30>
      }
    } else if(state == '%'){
 6d8:	83 fa 25             	cmp    $0x25,%edx
 6db:	75 e7                	jne    6c4 <printf+0x54>
      if(c == 'd'){
 6dd:	83 f8 64             	cmp    $0x64,%eax
 6e0:	0f 84 9a 00 00 00    	je     780 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ec:	83 f9 70             	cmp    $0x70,%ecx
 6ef:	74 5f                	je     750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f1:	83 f8 73             	cmp    $0x73,%eax
 6f4:	0f 84 d6 00 00 00    	je     7d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fa:	83 f8 63             	cmp    $0x63,%eax
 6fd:	0f 84 8d 00 00 00    	je     790 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 703:	83 f8 25             	cmp    $0x25,%eax
 706:	0f 84 b4 00 00 00    	je     7c0 <printf+0x150>
  write(fd, &c, 1);
 70c:	83 ec 04             	sub    $0x4,%esp
 70f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 713:	6a 01                	push   $0x1
 715:	57                   	push   %edi
 716:	ff 75 08             	pushl  0x8(%ebp)
 719:	e8 05 fe ff ff       	call   523 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 71e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 721:	83 c4 0c             	add    $0xc,%esp
 724:	6a 01                	push   $0x1
 726:	83 c6 01             	add    $0x1,%esi
 729:	57                   	push   %edi
 72a:	ff 75 08             	pushl  0x8(%ebp)
 72d:	e8 f1 fd ff ff       	call   523 <write>
  for(i = 0; fmt[i]; i++){
 732:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 736:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 739:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 73b:	84 db                	test   %bl,%bl
 73d:	75 8f                	jne    6ce <printf+0x5e>
    }
  }
}
 73f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 742:	5b                   	pop    %ebx
 743:	5e                   	pop    %esi
 744:	5f                   	pop    %edi
 745:	5d                   	pop    %ebp
 746:	c3                   	ret    
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 10 00 00 00       	mov    $0x10,%ecx
 758:	6a 00                	push   $0x0
 75a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	8b 13                	mov    (%ebx),%edx
 762:	e8 59 fe ff ff       	call   5c0 <printint>
        ap++;
 767:	89 d8                	mov    %ebx,%eax
 769:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76c:	31 d2                	xor    %edx,%edx
        ap++;
 76e:	83 c0 04             	add    $0x4,%eax
 771:	89 45 d0             	mov    %eax,-0x30(%ebp)
 774:	e9 4b ff ff ff       	jmp    6c4 <printf+0x54>
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 0a 00 00 00       	mov    $0xa,%ecx
 788:	6a 01                	push   $0x1
 78a:	eb ce                	jmp    75a <printf+0xea>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 790:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 796:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
        ap++;
 79a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 79d:	57                   	push   %edi
 79e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7a4:	e8 7a fd ff ff       	call   523 <write>
        ap++;
 7a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 0e ff ff ff       	jmp    6c4 <printf+0x54>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7c3:	83 ec 04             	sub    $0x4,%esp
 7c6:	e9 59 ff ff ff       	jmp    724 <printf+0xb4>
 7cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
        s = (char*)*ap;
 7d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7d5:	83 c0 04             	add    $0x4,%eax
 7d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7db:	85 db                	test   %ebx,%ebx
 7dd:	74 17                	je     7f6 <printf+0x186>
        while(*s != 0){
 7df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7e4:	84 c0                	test   %al,%al
 7e6:	0f 84 d8 fe ff ff    	je     6c4 <printf+0x54>
 7ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ef:	89 de                	mov    %ebx,%esi
 7f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7f4:	eb 1a                	jmp    810 <printf+0x1a0>
          s = "(null)";
 7f6:	bb 0f 0a 00 00       	mov    $0xa0f,%ebx
        while(*s != 0){
 7fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7fe:	b8 28 00 00 00       	mov    $0x28,%eax
 803:	89 de                	mov    %ebx,%esi
 805:	8b 5d 08             	mov    0x8(%ebp),%ebx
 808:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
  write(fd, &c, 1);
 810:	83 ec 04             	sub    $0x4,%esp
          s++;
 813:	83 c6 01             	add    $0x1,%esi
 816:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 819:	6a 01                	push   $0x1
 81b:	57                   	push   %edi
 81c:	53                   	push   %ebx
 81d:	e8 01 fd ff ff       	call   523 <write>
        while(*s != 0){
 822:	0f b6 06             	movzbl (%esi),%eax
 825:	83 c4 10             	add    $0x10,%esp
 828:	84 c0                	test   %al,%al
 82a:	75 e4                	jne    810 <printf+0x1a0>
 82c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 8e fe ff ff       	jmp    6c4 <printf+0x54>
 836:	66 90                	xchg   %ax,%ax
 838:	66 90                	xchg   %ax,%ax
 83a:	66 90                	xchg   %ax,%ax
 83c:	66 90                	xchg   %ax,%ax
 83e:	66 90                	xchg   %ax,%ax

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	f3 0f 1e fb          	endbr32 
 844:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 845:	a1 c0 0d 00 00       	mov    0xdc0,%eax
{
 84a:	89 e5                	mov    %esp,%ebp
 84c:	57                   	push   %edi
 84d:	56                   	push   %esi
 84e:	53                   	push   %ebx
 84f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 852:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 854:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 857:	39 c8                	cmp    %ecx,%eax
 859:	73 15                	jae    870 <free+0x30>
 85b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
 860:	39 d1                	cmp    %edx,%ecx
 862:	72 14                	jb     878 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 864:	39 d0                	cmp    %edx,%eax
 866:	73 10                	jae    878 <free+0x38>
{
 868:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	8b 10                	mov    (%eax),%edx
 86c:	39 c8                	cmp    %ecx,%eax
 86e:	72 f0                	jb     860 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	39 d0                	cmp    %edx,%eax
 872:	72 f4                	jb     868 <free+0x28>
 874:	39 d1                	cmp    %edx,%ecx
 876:	73 f0                	jae    868 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 878:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87e:	39 fa                	cmp    %edi,%edx
 880:	74 1e                	je     8a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 882:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 885:	8b 50 04             	mov    0x4(%eax),%edx
 888:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 88b:	39 f1                	cmp    %esi,%ecx
 88d:	74 28                	je     8b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 88f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 891:	5b                   	pop    %ebx
  freep = p;
 892:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 897:	5e                   	pop    %esi
 898:	5f                   	pop    %edi
 899:	5d                   	pop    %ebp
 89a:	c3                   	ret    
 89b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 8a0:	03 72 04             	add    0x4(%edx),%esi
 8a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a6:	8b 10                	mov    (%eax),%edx
 8a8:	8b 12                	mov    (%edx),%edx
 8aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b3:	39 f1                	cmp    %esi,%ecx
 8b5:	75 d8                	jne    88f <free+0x4f>
    p->s.size += bp->s.size;
 8b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ba:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    p->s.size += bp->s.size;
 8bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8c5:	89 10                	mov    %edx,(%eax)
}
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	f3 0f 1e fb          	endbr32 
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	57                   	push   %edi
 8d8:	56                   	push   %esi
 8d9:	53                   	push   %ebx
 8da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8e0:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e6:	8d 70 07             	lea    0x7(%eax),%esi
 8e9:	c1 ee 03             	shr    $0x3,%esi
 8ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8ef:	85 ff                	test   %edi,%edi
 8f1:	0f 84 a9 00 00 00    	je     9a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8f9:	8b 48 04             	mov    0x4(%eax),%ecx
 8fc:	39 f1                	cmp    %esi,%ecx
 8fe:	73 6d                	jae    96d <malloc+0x9d>
 900:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 906:	bb 00 10 00 00       	mov    $0x1000,%ebx
 90b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 90e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 915:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 918:	eb 17                	jmp    931 <malloc+0x61>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 920:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 922:	8b 4a 04             	mov    0x4(%edx),%ecx
 925:	39 f1                	cmp    %esi,%ecx
 927:	73 4f                	jae    978 <malloc+0xa8>
 929:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
 92f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 931:	39 c7                	cmp    %eax,%edi
 933:	75 eb                	jne    920 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 935:	83 ec 0c             	sub    $0xc,%esp
 938:	ff 75 e4             	pushl  -0x1c(%ebp)
 93b:	e8 4b fc ff ff       	call   58b <sbrk>
  if(p == (char*)-1)
 940:	83 c4 10             	add    $0x10,%esp
 943:	83 f8 ff             	cmp    $0xffffffff,%eax
 946:	74 1b                	je     963 <malloc+0x93>
  hp->s.size = nu;
 948:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 94b:	83 ec 0c             	sub    $0xc,%esp
 94e:	83 c0 08             	add    $0x8,%eax
 951:	50                   	push   %eax
 952:	e8 e9 fe ff ff       	call   840 <free>
  return freep;
 957:	a1 c0 0d 00 00       	mov    0xdc0,%eax
      if((p = morecore(nunits)) == 0)
 95c:	83 c4 10             	add    $0x10,%esp
 95f:	85 c0                	test   %eax,%eax
 961:	75 bd                	jne    920 <malloc+0x50>
        return 0;
  }
}
 963:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 966:	31 c0                	xor    %eax,%eax
}
 968:	5b                   	pop    %ebx
 969:	5e                   	pop    %esi
 96a:	5f                   	pop    %edi
 96b:	5d                   	pop    %ebp
 96c:	c3                   	ret    
    if(p->s.size >= nunits){
 96d:	89 c2                	mov    %eax,%edx
 96f:	89 f8                	mov    %edi,%eax
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 978:	39 ce                	cmp    %ecx,%esi
 97a:	74 54                	je     9d0 <malloc+0x100>
        p->s.size -= nunits;
 97c:	29 f1                	sub    %esi,%ecx
 97e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 981:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 984:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 987:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 98c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 98f:	8d 42 08             	lea    0x8(%edx),%eax
}
 992:	5b                   	pop    %ebx
 993:	5e                   	pop    %esi
 994:	5f                   	pop    %edi
 995:	5d                   	pop    %ebp
 996:	c3                   	ret    
 997:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 9a0:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 9a7:	0d 00 00 
    base.s.size = 0;
 9aa:	bf c4 0d 00 00       	mov    $0xdc4,%edi
    base.s.ptr = freep = prevp = &base;
 9af:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 9b6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9bb:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 9c2:	00 00 00 
    if(p->s.size >= nunits){
 9c5:	e9 36 ff ff ff       	jmp    900 <malloc+0x30>
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 0a                	mov    (%edx),%ecx
 9d2:	89 08                	mov    %ecx,(%eax)
 9d4:	eb b1                	jmp    987 <malloc+0xb7>
