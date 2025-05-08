
_testthreads:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  
  printf(1, "Thread %d: Exiting\n", thread_id);
  exit();
}

int main(int argc, char *argv[]) {
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	8d 7d bc             	lea    -0x44(%ebp),%edi
  16:	8d 75 c0             	lea    -0x40(%ebp),%esi
  19:	53                   	push   %ebx
  printf(1, "Lock initialized at address: 0x%x\n", &lock);
  
  printf(1, "Starting %d threads, each doing %d iterations\n", num_threads, iterations);
  
  // Create threads
  for(i = 0; i < num_threads; i++) {
  1a:	31 db                	xor    %ebx,%ebx
int main(int argc, char *argv[]) {
  1c:	51                   	push   %ecx
  1d:	83 ec 44             	sub    $0x44,%esp
  int iterations = 3;
  20:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
  lock_init(&lock);
  27:	68 4c 0f 00 00       	push   $0xf4c
  2c:	e8 4f 02 00 00       	call   280 <lock_init>
  printf(1, "Lock initialized at address: 0x%x\n", &lock);
  31:	83 c4 0c             	add    $0xc,%esp
  34:	68 4c 0f 00 00       	push   $0xf4c
  39:	68 48 0a 00 00       	push   $0xa48
  3e:	6a 01                	push   $0x1
  40:	e8 6b 06 00 00       	call   6b0 <printf>
  printf(1, "Starting %d threads, each doing %d iterations\n", num_threads, iterations);
  45:	ff 75 bc             	pushl  -0x44(%ebp)
  48:	6a 05                	push   $0x5
  4a:	68 6c 0a 00 00       	push   $0xa6c
  4f:	6a 01                	push   $0x1
  51:	e8 5a 06 00 00       	call   6b0 <printf>
  for(i = 0; i < num_threads; i++) {
  56:	83 c4 20             	add    $0x20,%esp
    thread_ids[i] = i;
    printf(1, "Creating thread %d, thread_ids[%d] = %d\n", i, i, thread_ids[i]);
  59:	83 ec 0c             	sub    $0xc,%esp
    thread_ids[i] = i;
  5c:	89 1e                	mov    %ebx,(%esi)
    printf(1, "Creating thread %d, thread_ids[%d] = %d\n", i, i, thread_ids[i]);
  5e:	53                   	push   %ebx
  5f:	53                   	push   %ebx
  60:	53                   	push   %ebx
  61:	68 9c 0a 00 00       	push   $0xa9c
  66:	6a 01                	push   $0x1
  68:	e8 43 06 00 00       	call   6b0 <printf>
    pid = thread_create(thread_function, &thread_ids[i], &iterations);
  6d:	83 c4 1c             	add    $0x1c,%esp
  70:	57                   	push   %edi
  71:	56                   	push   %esi
  72:	68 40 01 00 00       	push   $0x140
  77:	e8 54 01 00 00       	call   1d0 <thread_create>
    if(pid < 0) {
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	85 c0                	test   %eax,%eax
  81:	78 7d                	js     100 <main+0x100>
      printf(1, "Error creating thread %d\n", i);
    } else if(pid > 0) {
  83:	0f 85 97 00 00 00    	jne    120 <main+0x120>
  for(i = 0; i < num_threads; i++) {
  89:	83 c3 01             	add    $0x1,%ebx
  8c:	83 c6 04             	add    $0x4,%esi
  8f:	83 fb 05             	cmp    $0x5,%ebx
  92:	75 c5                	jne    59 <main+0x59>
    int j;
    for(j = 0; j < 1000; j++);
  }
  
  // Wait for all threads to complete
  for(i = 0; i < num_threads; i++) {
  94:	31 db                	xor    %ebx,%ebx
    printf(1, "Waiting for thread %d\n", i);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	53                   	push   %ebx
  for(i = 0; i < num_threads; i++) {
  9a:	83 c3 01             	add    $0x1,%ebx
    printf(1, "Waiting for thread %d\n", i);
  9d:	68 5e 0b 00 00       	push   $0xb5e
  a2:	6a 01                	push   $0x1
  a4:	e8 07 06 00 00       	call   6b0 <printf>
    pid = thread_join();
  a9:	e8 92 01 00 00       	call   240 <thread_join>
    printf(1, "Joined thread with PID %d\n", pid);
  ae:	83 c4 0c             	add    $0xc,%esp
  b1:	50                   	push   %eax
  b2:	68 75 0b 00 00       	push   $0xb75
  b7:	6a 01                	push   $0x1
  b9:	e8 f2 05 00 00       	call   6b0 <printf>
  for(i = 0; i < num_threads; i++) {
  be:	83 c4 10             	add    $0x10,%esp
  c1:	83 fb 05             	cmp    $0x5,%ebx
  c4:	75 d0                	jne    96 <main+0x96>
  }
  
  printf(1, "All threads complete. Final counter value: %d\n", counter);
  c6:	83 ec 04             	sub    $0x4,%esp
  c9:	ff 35 3c 0f 00 00    	pushl  0xf3c
  cf:	68 e8 0a 00 00       	push   $0xae8
  d4:	6a 01                	push   $0x1
  d6:	e8 d5 05 00 00       	call   6b0 <printf>
  printf(1, "Expected counter value: %d\n", num_threads * iterations);
  db:	8b 45 bc             	mov    -0x44(%ebp),%eax
  de:	83 c4 0c             	add    $0xc,%esp
  e1:	8d 04 80             	lea    (%eax,%eax,4),%eax
  e4:	50                   	push   %eax
  e5:	68 90 0b 00 00       	push   $0xb90
  ea:	6a 01                	push   $0x1
  ec:	e8 bf 05 00 00       	call   6b0 <printf>
  
  exit();
  f1:	e8 4d 04 00 00       	call   543 <exit>
  f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fd:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, "Error creating thread %d\n", i);
 100:	83 ec 04             	sub    $0x4,%esp
 103:	53                   	push   %ebx
 104:	68 44 0b 00 00       	push   $0xb44
 109:	6a 01                	push   $0x1
 10b:	e8 a0 05 00 00       	call   6b0 <printf>
 110:	83 c4 10             	add    $0x10,%esp
 113:	e9 71 ff ff ff       	jmp    89 <main+0x89>
 118:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop
      printf(1, "Created thread %d with PID %d\n", i, pid);
 120:	50                   	push   %eax
 121:	53                   	push   %ebx
 122:	68 c8 0a 00 00       	push   $0xac8
 127:	6a 01                	push   $0x1
 129:	e8 82 05 00 00       	call   6b0 <printf>
 12e:	83 c4 10             	add    $0x10,%esp
 131:	e9 53 ff ff ff       	jmp    89 <main+0x89>
 136:	66 90                	xchg   %ax,%ax
 138:	66 90                	xchg   %ax,%ax
 13a:	66 90                	xchg   %ax,%ax
 13c:	66 90                	xchg   %ax,%ax
 13e:	66 90                	xchg   %ax,%ax

00000140 <thread_function>:
void thread_function(void *arg1, void *arg2) {
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	56                   	push   %esi
 149:	53                   	push   %ebx
 14a:	83 ec 0c             	sub    $0xc,%esp
  int thread_id = *(int*)arg1;
 14d:	8b 45 08             	mov    0x8(%ebp),%eax
 150:	8b 18                	mov    (%eax),%ebx
  int iterations = *(int*)arg2;
 152:	8b 45 0c             	mov    0xc(%ebp),%eax
 155:	8b 30                	mov    (%eax),%esi
  printf(1, "Thread %d: Starting (addr of counter: 0x%x)\n", thread_id, &counter);
 157:	68 3c 0f 00 00       	push   $0xf3c
 15c:	53                   	push   %ebx
 15d:	68 18 0a 00 00       	push   $0xa18
 162:	6a 01                	push   $0x1
 164:	e8 47 05 00 00       	call   6b0 <printf>
  for(i = 0; i < iterations; i++) {
 169:	83 c4 10             	add    $0x10,%esp
 16c:	85 f6                	test   %esi,%esi
 16e:	7e 47                	jle    1b7 <thread_function+0x77>
 170:	31 ff                	xor    %edi,%edi
 172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lock_acquire(&lock);
 178:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < iterations; i++) {
 17b:	83 c7 01             	add    $0x1,%edi
    lock_acquire(&lock);
 17e:	68 4c 0f 00 00       	push   $0xf4c
 183:	e8 18 01 00 00       	call   2a0 <lock_acquire>
    counter++;
 188:	a1 3c 0f 00 00       	mov    0xf3c,%eax
 18d:	83 c0 01             	add    $0x1,%eax
    printf(1, "Thread %d: counter = %d\n", thread_id, counter);
 190:	50                   	push   %eax
 191:	53                   	push   %ebx
 192:	68 17 0b 00 00       	push   $0xb17
 197:	6a 01                	push   $0x1
    counter++;
 199:	a3 3c 0f 00 00       	mov    %eax,0xf3c
    printf(1, "Thread %d: counter = %d\n", thread_id, counter);
 19e:	e8 0d 05 00 00       	call   6b0 <printf>
    lock_release(&lock);
 1a3:	83 c4 14             	add    $0x14,%esp
 1a6:	68 4c 0f 00 00       	push   $0xf4c
 1ab:	e8 10 01 00 00       	call   2c0 <lock_release>
  for(i = 0; i < iterations; i++) {
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	39 fe                	cmp    %edi,%esi
 1b5:	75 c1                	jne    178 <thread_function+0x38>
  printf(1, "Thread %d: Exiting\n", thread_id);
 1b7:	83 ec 04             	sub    $0x4,%esp
 1ba:	53                   	push   %ebx
 1bb:	68 30 0b 00 00       	push   $0xb30
 1c0:	6a 01                	push   $0x1
 1c2:	e8 e9 04 00 00       	call   6b0 <printf>
  exit();
 1c7:	e8 77 03 00 00       	call   543 <exit>
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <thread_create>:
#include "user.h"
#include "x86.h"

int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	53                   	push   %ebx
 1d8:	83 ec 10             	sub    $0x10,%esp
  void *stack;
  int pid;
  
  // Allocate a page for the stack
  stack = malloc(4096); // PGSIZE
 1db:	68 00 10 00 00       	push   $0x1000
 1e0:	e8 2b 07 00 00       	call   910 <malloc>
  if(stack == 0)
 1e5:	83 c4 10             	add    $0x10,%esp
 1e8:	85 c0                	test   %eax,%eax
 1ea:	74 32                	je     21e <thread_create+0x4e>
 1ec:	89 c3                	mov    %eax,%ebx
    return -1;
    
  // Ensure stack is page-aligned
  if((uint)stack % 4096) {
    stack = (void*)((uint)stack + (4096 - ((uint)stack % 4096)));
 1ee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 1f3:	05 00 10 00 00       	add    $0x1000,%eax
 1f8:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 1fe:	0f 45 d8             	cmovne %eax,%ebx
  }

  // Call clone system call to create the thread
  pid = clone(start_routine, arg1, arg2, stack);
 201:	53                   	push   %ebx
 202:	ff 75 10             	pushl  0x10(%ebp)
 205:	ff 75 0c             	pushl  0xc(%ebp)
 208:	ff 75 08             	pushl  0x8(%ebp)
 20b:	e8 d3 03 00 00       	call   5e3 <clone>
  
  if(pid == 0) {
 210:	83 c4 10             	add    $0x10,%esp
 213:	85 c0                	test   %eax,%eax
 215:	74 02                	je     219 <thread_create+0x49>
    // Child thread - just return 0
    return 0;
  } else if(pid < 0) {
 217:	78 0c                	js     225 <thread_create+0x55>
    return -1;
  }
  
  // Parent - return the child thread's PID
  return pid;
}
 219:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21c:	c9                   	leave  
 21d:	c3                   	ret    
    return -1;
 21e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 223:	eb f4                	jmp    219 <thread_create+0x49>
    free(stack);
 225:	83 ec 0c             	sub    $0xc,%esp
 228:	53                   	push   %ebx
 229:	e8 52 06 00 00       	call   880 <free>
    return -1;
 22e:	83 c4 10             	add    $0x10,%esp
 231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 236:	eb e1                	jmp    219 <thread_create+0x49>
 238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <thread_join>:

int 
thread_join(void) 
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	83 ec 34             	sub    $0x34,%esp
  void *stack;
  int pid;
  
  // Wait for a thread to exit
  pid = join(&stack);
 24a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 24d:	50                   	push   %eax
 24e:	e8 98 03 00 00       	call   5eb <join>
  
  if(pid > 0) {
 253:	83 c4 10             	add    $0x10,%esp
 256:	85 c0                	test   %eax,%eax
 258:	7f 06                	jg     260 <thread_join+0x20>
    // Free the thread's stack
    free(stack);
  }
  
  return pid;
}
 25a:	c9                   	leave  
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    free(stack);
 260:	83 ec 0c             	sub    $0xc,%esp
 263:	ff 75 f4             	pushl  -0xc(%ebp)
 266:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 269:	e8 12 06 00 00       	call   880 <free>
 26e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	c9                   	leave  
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <lock_init>:

void 
lock_init(lock_t *lock) 
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 28a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 290:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 297:	5d                   	pop    %ebp
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <lock_acquire>:

void 
lock_acquire(lock_t *lock) 
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2a5:	b9 01 00 00 00       	mov    $0x1,%ecx
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	8b 55 08             	mov    0x8(%ebp),%edx
 2af:	90                   	nop
 2b0:	89 c8                	mov    %ecx,%eax
 2b2:	f0 87 02             	lock xchg %eax,(%edx)
  // Simple test and set approach for xv6
  // Use the existing xchg function from x86.h
  while(xchg(&lock->ticket, 1) != 0)
 2b5:	85 c0                	test   %eax,%eax
 2b7:	75 f7                	jne    2b0 <lock_acquire+0x10>
    ; // Spin
}
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <lock_release>:

void 
lock_release(lock_t *lock) 
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
  lock->ticket = 0;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    
 2d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002e0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2e5:	31 c0                	xor    %eax,%eax
{
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	53                   	push   %ebx
 2ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 2f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2f7:	83 c0 01             	add    $0x1,%eax
 2fa:	84 d2                	test   %dl,%dl
 2fc:	75 f2                	jne    2f0 <strcpy+0x10>
    ;
  return os;
}
 2fe:	89 c8                	mov    %ecx,%eax
 300:	5b                   	pop    %ebx
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    
 303:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	53                   	push   %ebx
 318:	8b 4d 08             	mov    0x8(%ebp),%ecx
 31b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 31e:	0f b6 01             	movzbl (%ecx),%eax
 321:	0f b6 1a             	movzbl (%edx),%ebx
 324:	84 c0                	test   %al,%al
 326:	75 19                	jne    341 <strcmp+0x31>
 328:	eb 26                	jmp    350 <strcmp+0x40>
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 330:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 334:	83 c1 01             	add    $0x1,%ecx
 337:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 33a:	0f b6 1a             	movzbl (%edx),%ebx
 33d:	84 c0                	test   %al,%al
 33f:	74 0f                	je     350 <strcmp+0x40>
 341:	38 d8                	cmp    %bl,%al
 343:	74 eb                	je     330 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 345:	29 d8                	sub    %ebx,%eax
}
 347:	5b                   	pop    %ebx
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 350:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 352:	29 d8                	sub    %ebx,%eax
}
 354:	5b                   	pop    %ebx
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <strlen>:

uint
strlen(const char *s)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 36a:	80 3a 00             	cmpb   $0x0,(%edx)
 36d:	74 21                	je     390 <strlen+0x30>
 36f:	31 c0                	xor    %eax,%eax
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	83 c0 01             	add    $0x1,%eax
 37b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 37f:	89 c1                	mov    %eax,%ecx
 381:	75 f5                	jne    378 <strlen+0x18>
    ;
  return n;
}
 383:	89 c8                	mov    %ecx,%eax
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 390:	31 c9                	xor    %ecx,%ecx
}
 392:	5d                   	pop    %ebp
 393:	89 c8                	mov    %ecx,%eax
 395:	c3                   	ret    
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 3ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b1:	89 d7                	mov    %edx,%edi
 3b3:	fc                   	cld    
 3b4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <strchr>:

char*
strchr(const char *s, char c)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ce:	0f b6 10             	movzbl (%eax),%edx
 3d1:	84 d2                	test   %dl,%dl
 3d3:	75 16                	jne    3eb <strchr+0x2b>
 3d5:	eb 21                	jmp    3f8 <strchr+0x38>
 3d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3de:	66 90                	xchg   %ax,%ax
 3e0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3e4:	83 c0 01             	add    $0x1,%eax
 3e7:	84 d2                	test   %dl,%dl
 3e9:	74 0d                	je     3f8 <strchr+0x38>
    if(*s == c)
 3eb:	38 d1                	cmp    %dl,%cl
 3ed:	75 f1                	jne    3e0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3f8:	31 c0                	xor    %eax,%eax
}
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <gets>:

char*
gets(char *buf, int max)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 409:	31 f6                	xor    %esi,%esi
{
 40b:	53                   	push   %ebx
 40c:	89 f3                	mov    %esi,%ebx
 40e:	83 ec 1c             	sub    $0x1c,%esp
 411:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 414:	eb 33                	jmp    449 <gets+0x49>
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 420:	83 ec 04             	sub    $0x4,%esp
 423:	8d 45 e7             	lea    -0x19(%ebp),%eax
 426:	6a 01                	push   $0x1
 428:	50                   	push   %eax
 429:	6a 00                	push   $0x0
 42b:	e8 2b 01 00 00       	call   55b <read>
    if(cc < 1)
 430:	83 c4 10             	add    $0x10,%esp
 433:	85 c0                	test   %eax,%eax
 435:	7e 1c                	jle    453 <gets+0x53>
      break;
    buf[i++] = c;
 437:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 43b:	83 c7 01             	add    $0x1,%edi
 43e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 441:	3c 0a                	cmp    $0xa,%al
 443:	74 23                	je     468 <gets+0x68>
 445:	3c 0d                	cmp    $0xd,%al
 447:	74 1f                	je     468 <gets+0x68>
  for(i=0; i+1 < max; ){
 449:	83 c3 01             	add    $0x1,%ebx
 44c:	89 fe                	mov    %edi,%esi
 44e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 451:	7c cd                	jl     420 <gets+0x20>
 453:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 455:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 458:	c6 03 00             	movb   $0x0,(%ebx)
}
 45b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5f                   	pop    %edi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 467:	90                   	nop
 468:	8b 75 08             	mov    0x8(%ebp),%esi
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	01 de                	add    %ebx,%esi
 470:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 472:	c6 03 00             	movb   $0x0,(%ebx)
}
 475:	8d 65 f4             	lea    -0xc(%ebp),%esp
 478:	5b                   	pop    %ebx
 479:	5e                   	pop    %esi
 47a:	5f                   	pop    %edi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <stat>:

int
stat(const char *n, struct stat *st)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	56                   	push   %esi
 488:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 489:	83 ec 08             	sub    $0x8,%esp
 48c:	6a 00                	push   $0x0
 48e:	ff 75 08             	pushl  0x8(%ebp)
 491:	e8 ed 00 00 00       	call   583 <open>
  if(fd < 0)
 496:	83 c4 10             	add    $0x10,%esp
 499:	85 c0                	test   %eax,%eax
 49b:	78 2b                	js     4c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 49d:	83 ec 08             	sub    $0x8,%esp
 4a0:	ff 75 0c             	pushl  0xc(%ebp)
 4a3:	89 c3                	mov    %eax,%ebx
 4a5:	50                   	push   %eax
 4a6:	e8 f0 00 00 00       	call   59b <fstat>
  close(fd);
 4ab:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ae:	89 c6                	mov    %eax,%esi
  close(fd);
 4b0:	e8 b6 00 00 00       	call   56b <close>
  return r;
 4b5:	83 c4 10             	add    $0x10,%esp
}
 4b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4bb:	89 f0                	mov    %esi,%eax
 4bd:	5b                   	pop    %ebx
 4be:	5e                   	pop    %esi
 4bf:	5d                   	pop    %ebp
 4c0:	c3                   	ret    
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 4c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4cd:	eb e9                	jmp    4b8 <stat+0x38>
 4cf:	90                   	nop

000004d0 <atoi>:

int
atoi(const char *s)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	53                   	push   %ebx
 4d8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4db:	0f be 02             	movsbl (%edx),%eax
 4de:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4e1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4e4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4e9:	77 1a                	ja     505 <atoi+0x35>
 4eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
    n = n*10 + *s++ - '0';
 4f0:	83 c2 01             	add    $0x1,%edx
 4f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4fa:	0f be 02             	movsbl (%edx),%eax
 4fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 500:	80 fb 09             	cmp    $0x9,%bl
 503:	76 eb                	jbe    4f0 <atoi+0x20>
  return n;
}
 505:	89 c8                	mov    %ecx,%eax
 507:	5b                   	pop    %ebx
 508:	5d                   	pop    %ebp
 509:	c3                   	ret    
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000510 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	57                   	push   %edi
 518:	8b 45 10             	mov    0x10(%ebp),%eax
 51b:	8b 55 08             	mov    0x8(%ebp),%edx
 51e:	56                   	push   %esi
 51f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 522:	85 c0                	test   %eax,%eax
 524:	7e 0f                	jle    535 <memmove+0x25>
 526:	01 d0                	add    %edx,%eax
  dst = vdst;
 528:	89 d7                	mov    %edx,%edi
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 530:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 531:	39 f8                	cmp    %edi,%eax
 533:	75 fb                	jne    530 <memmove+0x20>
  return vdst;
 535:	5e                   	pop    %esi
 536:	89 d0                	mov    %edx,%eax
 538:	5f                   	pop    %edi
 539:	5d                   	pop    %ebp
 53a:	c3                   	ret    

0000053b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 53b:	b8 01 00 00 00       	mov    $0x1,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <exit>:
SYSCALL(exit)
 543:	b8 02 00 00 00       	mov    $0x2,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <wait>:
SYSCALL(wait)
 54b:	b8 03 00 00 00       	mov    $0x3,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <pipe>:
SYSCALL(pipe)
 553:	b8 04 00 00 00       	mov    $0x4,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <read>:
SYSCALL(read)
 55b:	b8 05 00 00 00       	mov    $0x5,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <write>:
SYSCALL(write)
 563:	b8 10 00 00 00       	mov    $0x10,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <close>:
SYSCALL(close)
 56b:	b8 15 00 00 00       	mov    $0x15,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <kill>:
SYSCALL(kill)
 573:	b8 06 00 00 00       	mov    $0x6,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <exec>:
SYSCALL(exec)
 57b:	b8 07 00 00 00       	mov    $0x7,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <open>:
SYSCALL(open)
 583:	b8 0f 00 00 00       	mov    $0xf,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <mknod>:
SYSCALL(mknod)
 58b:	b8 11 00 00 00       	mov    $0x11,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <unlink>:
SYSCALL(unlink)
 593:	b8 12 00 00 00       	mov    $0x12,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <fstat>:
SYSCALL(fstat)
 59b:	b8 08 00 00 00       	mov    $0x8,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <link>:
SYSCALL(link)
 5a3:	b8 13 00 00 00       	mov    $0x13,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <mkdir>:
SYSCALL(mkdir)
 5ab:	b8 14 00 00 00       	mov    $0x14,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <chdir>:
SYSCALL(chdir)
 5b3:	b8 09 00 00 00       	mov    $0x9,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <dup>:
SYSCALL(dup)
 5bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <getpid>:
SYSCALL(getpid)
 5c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <sbrk>:
SYSCALL(sbrk)
 5cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <sleep>:
SYSCALL(sleep)
 5d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <uptime>:
SYSCALL(uptime)
 5db:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <clone>:
SYSCALL(clone)
 5e3:	b8 16 00 00 00       	mov    $0x16,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <join>:
 5eb:	b8 17 00 00 00       	mov    $0x17,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    
 5f3:	66 90                	xchg   %ax,%ax
 5f5:	66 90                	xchg   %ax,%ax
 5f7:	66 90                	xchg   %ax,%ax
 5f9:	66 90                	xchg   %ax,%ax
 5fb:	66 90                	xchg   %ax,%ax
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
 609:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 60c:	89 d1                	mov    %edx,%ecx
{
 60e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 611:	85 d2                	test   %edx,%edx
 613:	0f 89 7f 00 00 00    	jns    698 <printint+0x98>
 619:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 61d:	74 79                	je     698 <printint+0x98>
    neg = 1;
 61f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 626:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 628:	31 db                	xor    %ebx,%ebx
 62a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 630:	89 c8                	mov    %ecx,%eax
 632:	31 d2                	xor    %edx,%edx
 634:	89 cf                	mov    %ecx,%edi
 636:	f7 75 c4             	divl   -0x3c(%ebp)
 639:	0f b6 92 b4 0b 00 00 	movzbl 0xbb4(%edx),%edx
 640:	89 45 c0             	mov    %eax,-0x40(%ebp)
 643:	89 d8                	mov    %ebx,%eax
 645:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 648:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 64b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 64e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 651:	76 dd                	jbe    630 <printint+0x30>
  if(neg)
 653:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 656:	85 c9                	test   %ecx,%ecx
 658:	74 0c                	je     666 <printint+0x66>
    buf[i++] = '-';
 65a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 65f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 661:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 666:	8b 7d b8             	mov    -0x48(%ebp),%edi
 669:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 66d:	eb 07                	jmp    676 <printint+0x76>
 66f:	90                   	nop
 670:	0f b6 13             	movzbl (%ebx),%edx
 673:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 676:	83 ec 04             	sub    $0x4,%esp
 679:	88 55 d7             	mov    %dl,-0x29(%ebp)
 67c:	6a 01                	push   $0x1
 67e:	56                   	push   %esi
 67f:	57                   	push   %edi
 680:	e8 de fe ff ff       	call   563 <write>
  while(--i >= 0)
 685:	83 c4 10             	add    $0x10,%esp
 688:	39 de                	cmp    %ebx,%esi
 68a:	75 e4                	jne    670 <printint+0x70>
    putc(fd, buf[i]);
}
 68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68f:	5b                   	pop    %ebx
 690:	5e                   	pop    %esi
 691:	5f                   	pop    %edi
 692:	5d                   	pop    %ebp
 693:	c3                   	ret    
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 698:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 69f:	eb 87                	jmp    628 <printint+0x28>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop

000006b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 6c0:	0f b6 1e             	movzbl (%esi),%ebx
 6c3:	84 db                	test   %bl,%bl
 6c5:	0f 84 b4 00 00 00    	je     77f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6cb:	8d 45 10             	lea    0x10(%ebp),%eax
 6ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d9:	eb 33                	jmp    70e <printf+0x5e>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
 6e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	74 17                	je     704 <printf+0x54>
  write(fd, &c, 1);
 6ed:	83 ec 04             	sub    $0x4,%esp
 6f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 65 fe ff ff       	call   563 <write>
 6fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 701:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 704:	0f b6 1e             	movzbl (%esi),%ebx
 707:	83 c6 01             	add    $0x1,%esi
 70a:	84 db                	test   %bl,%bl
 70c:	74 71                	je     77f <printf+0xcf>
    c = fmt[i] & 0xff;
 70e:	0f be cb             	movsbl %bl,%ecx
 711:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 714:	85 d2                	test   %edx,%edx
 716:	74 c8                	je     6e0 <printf+0x30>
      }
    } else if(state == '%'){
 718:	83 fa 25             	cmp    $0x25,%edx
 71b:	75 e7                	jne    704 <printf+0x54>
      if(c == 'd'){
 71d:	83 f8 64             	cmp    $0x64,%eax
 720:	0f 84 9a 00 00 00    	je     7c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 726:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 72c:	83 f9 70             	cmp    $0x70,%ecx
 72f:	74 5f                	je     790 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 731:	83 f8 73             	cmp    $0x73,%eax
 734:	0f 84 d6 00 00 00    	je     810 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 73a:	83 f8 63             	cmp    $0x63,%eax
 73d:	0f 84 8d 00 00 00    	je     7d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 743:	83 f8 25             	cmp    $0x25,%eax
 746:	0f 84 b4 00 00 00    	je     800 <printf+0x150>
  write(fd, &c, 1);
 74c:	83 ec 04             	sub    $0x4,%esp
 74f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	ff 75 08             	pushl  0x8(%ebp)
 759:	e8 05 fe ff ff       	call   563 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 75e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 761:	83 c4 0c             	add    $0xc,%esp
 764:	6a 01                	push   $0x1
 766:	83 c6 01             	add    $0x1,%esi
 769:	57                   	push   %edi
 76a:	ff 75 08             	pushl  0x8(%ebp)
 76d:	e8 f1 fd ff ff       	call   563 <write>
  for(i = 0; fmt[i]; i++){
 772:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 776:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 779:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 77b:	84 db                	test   %bl,%bl
 77d:	75 8f                	jne    70e <printf+0x5e>
    }
  }
}
 77f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 782:	5b                   	pop    %ebx
 783:	5e                   	pop    %esi
 784:	5f                   	pop    %edi
 785:	5d                   	pop    %ebp
 786:	c3                   	ret    
 787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 10 00 00 00       	mov    $0x10,%ecx
 798:	6a 00                	push   $0x0
 79a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	8b 13                	mov    (%ebx),%edx
 7a2:	e8 59 fe ff ff       	call   600 <printint>
        ap++;
 7a7:	89 d8                	mov    %ebx,%eax
 7a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ac:	31 d2                	xor    %edx,%edx
        ap++;
 7ae:	83 c0 04             	add    $0x4,%eax
 7b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b4:	e9 4b ff ff ff       	jmp    704 <printf+0x54>
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	eb ce                	jmp    79a <printf+0xea>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
        ap++;
 7da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7dd:	57                   	push   %edi
 7de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e4:	e8 7a fd ff ff       	call   563 <write>
        ap++;
 7e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ef:	31 d2                	xor    %edx,%edx
 7f1:	e9 0e ff ff ff       	jmp    704 <printf+0x54>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 800:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
 806:	e9 59 ff ff ff       	jmp    764 <printf+0xb4>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
        s = (char*)*ap;
 810:	8b 45 d0             	mov    -0x30(%ebp),%eax
 813:	8b 18                	mov    (%eax),%ebx
        ap++;
 815:	83 c0 04             	add    $0x4,%eax
 818:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 81b:	85 db                	test   %ebx,%ebx
 81d:	74 17                	je     836 <printf+0x186>
        while(*s != 0){
 81f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 822:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 824:	84 c0                	test   %al,%al
 826:	0f 84 d8 fe ff ff    	je     704 <printf+0x54>
 82c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 82f:	89 de                	mov    %ebx,%esi
 831:	8b 5d 08             	mov    0x8(%ebp),%ebx
 834:	eb 1a                	jmp    850 <printf+0x1a0>
          s = "(null)";
 836:	bb ac 0b 00 00       	mov    $0xbac,%ebx
        while(*s != 0){
 83b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 83e:	b8 28 00 00 00       	mov    $0x28,%eax
 843:	89 de                	mov    %ebx,%esi
 845:	8b 5d 08             	mov    0x8(%ebp),%ebx
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
          s++;
 853:	83 c6 01             	add    $0x1,%esi
 856:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 859:	6a 01                	push   $0x1
 85b:	57                   	push   %edi
 85c:	53                   	push   %ebx
 85d:	e8 01 fd ff ff       	call   563 <write>
        while(*s != 0){
 862:	0f b6 06             	movzbl (%esi),%eax
 865:	83 c4 10             	add    $0x10,%esp
 868:	84 c0                	test   %al,%al
 86a:	75 e4                	jne    850 <printf+0x1a0>
 86c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 86f:	31 d2                	xor    %edx,%edx
 871:	e9 8e fe ff ff       	jmp    704 <printf+0x54>
 876:	66 90                	xchg   %ax,%ax
 878:	66 90                	xchg   %ax,%ax
 87a:	66 90                	xchg   %ax,%ax
 87c:	66 90                	xchg   %ax,%ax
 87e:	66 90                	xchg   %ax,%ax

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	f3 0f 1e fb          	endbr32 
 884:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 885:	a1 40 0f 00 00       	mov    0xf40,%eax
{
 88a:	89 e5                	mov    %esp,%ebp
 88c:	57                   	push   %edi
 88d:	56                   	push   %esi
 88e:	53                   	push   %ebx
 88f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 892:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 894:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 897:	39 c8                	cmp    %ecx,%eax
 899:	73 15                	jae    8b0 <free+0x30>
 89b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop
 8a0:	39 d1                	cmp    %edx,%ecx
 8a2:	72 14                	jb     8b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	39 d0                	cmp    %edx,%eax
 8a6:	73 10                	jae    8b8 <free+0x38>
{
 8a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8aa:	8b 10                	mov    (%eax),%edx
 8ac:	39 c8                	cmp    %ecx,%eax
 8ae:	72 f0                	jb     8a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b0:	39 d0                	cmp    %edx,%eax
 8b2:	72 f4                	jb     8a8 <free+0x28>
 8b4:	39 d1                	cmp    %edx,%ecx
 8b6:	73 f0                	jae    8a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8be:	39 fa                	cmp    %edi,%edx
 8c0:	74 1e                	je     8e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c5:	8b 50 04             	mov    0x4(%eax),%edx
 8c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8cb:	39 f1                	cmp    %esi,%ecx
 8cd:	74 28                	je     8f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 8d1:	5b                   	pop    %ebx
  freep = p;
 8d2:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 8d7:	5e                   	pop    %esi
 8d8:	5f                   	pop    %edi
 8d9:	5d                   	pop    %ebp
 8da:	c3                   	ret    
 8db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 8e0:	03 72 04             	add    0x4(%edx),%esi
 8e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	8b 12                	mov    (%edx),%edx
 8ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ed:	8b 50 04             	mov    0x4(%eax),%edx
 8f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f3:	39 f1                	cmp    %esi,%ecx
 8f5:	75 d8                	jne    8cf <free+0x4f>
    p->s.size += bp->s.size;
 8f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8fa:	a3 40 0f 00 00       	mov    %eax,0xf40
    p->s.size += bp->s.size;
 8ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 902:	8b 53 f8             	mov    -0x8(%ebx),%edx
 905:	89 10                	mov    %edx,(%eax)
}
 907:	5b                   	pop    %ebx
 908:	5e                   	pop    %esi
 909:	5f                   	pop    %edi
 90a:	5d                   	pop    %ebp
 90b:	c3                   	ret    
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 910:	f3 0f 1e fb          	endbr32 
 914:	55                   	push   %ebp
 915:	89 e5                	mov    %esp,%ebp
 917:	57                   	push   %edi
 918:	56                   	push   %esi
 919:	53                   	push   %ebx
 91a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 920:	8b 3d 40 0f 00 00    	mov    0xf40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 926:	8d 70 07             	lea    0x7(%eax),%esi
 929:	c1 ee 03             	shr    $0x3,%esi
 92c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 92f:	85 ff                	test   %edi,%edi
 931:	0f 84 a9 00 00 00    	je     9e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 937:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 939:	8b 48 04             	mov    0x4(%eax),%ecx
 93c:	39 f1                	cmp    %esi,%ecx
 93e:	73 6d                	jae    9ad <malloc+0x9d>
 940:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 946:	bb 00 10 00 00       	mov    $0x1000,%ebx
 94b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 94e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 955:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 958:	eb 17                	jmp    971 <malloc+0x61>
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 960:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 962:	8b 4a 04             	mov    0x4(%edx),%ecx
 965:	39 f1                	cmp    %esi,%ecx
 967:	73 4f                	jae    9b8 <malloc+0xa8>
 969:	8b 3d 40 0f 00 00    	mov    0xf40,%edi
 96f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 971:	39 c7                	cmp    %eax,%edi
 973:	75 eb                	jne    960 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 975:	83 ec 0c             	sub    $0xc,%esp
 978:	ff 75 e4             	pushl  -0x1c(%ebp)
 97b:	e8 4b fc ff ff       	call   5cb <sbrk>
  if(p == (char*)-1)
 980:	83 c4 10             	add    $0x10,%esp
 983:	83 f8 ff             	cmp    $0xffffffff,%eax
 986:	74 1b                	je     9a3 <malloc+0x93>
  hp->s.size = nu;
 988:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 98b:	83 ec 0c             	sub    $0xc,%esp
 98e:	83 c0 08             	add    $0x8,%eax
 991:	50                   	push   %eax
 992:	e8 e9 fe ff ff       	call   880 <free>
  return freep;
 997:	a1 40 0f 00 00       	mov    0xf40,%eax
      if((p = morecore(nunits)) == 0)
 99c:	83 c4 10             	add    $0x10,%esp
 99f:	85 c0                	test   %eax,%eax
 9a1:	75 bd                	jne    960 <malloc+0x50>
        return 0;
  }
}
 9a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9a6:	31 c0                	xor    %eax,%eax
}
 9a8:	5b                   	pop    %ebx
 9a9:	5e                   	pop    %esi
 9aa:	5f                   	pop    %edi
 9ab:	5d                   	pop    %ebp
 9ac:	c3                   	ret    
    if(p->s.size >= nunits){
 9ad:	89 c2                	mov    %eax,%edx
 9af:	89 f8                	mov    %edi,%eax
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 9b8:	39 ce                	cmp    %ecx,%esi
 9ba:	74 54                	je     a10 <malloc+0x100>
        p->s.size -= nunits;
 9bc:	29 f1                	sub    %esi,%ecx
 9be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 9c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 9c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 9c7:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 9cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9cf:	8d 42 08             	lea    0x8(%edx),%eax
}
 9d2:	5b                   	pop    %ebx
 9d3:	5e                   	pop    %esi
 9d4:	5f                   	pop    %edi
 9d5:	5d                   	pop    %ebp
 9d6:	c3                   	ret    
 9d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 9e0:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 9e7:	0f 00 00 
    base.s.size = 0;
 9ea:	bf 44 0f 00 00       	mov    $0xf44,%edi
    base.s.ptr = freep = prevp = &base;
 9ef:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 9f6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9fb:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 a02:	00 00 00 
    if(p->s.size >= nunits){
 a05:	e9 36 ff ff ff       	jmp    940 <malloc+0x30>
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a10:	8b 0a                	mov    (%edx),%ecx
 a12:	89 08                	mov    %ecx,(%eax)
 a14:	eb b1                	jmp    9c7 <malloc+0xb7>
