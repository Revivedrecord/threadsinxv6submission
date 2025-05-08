
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 18             	sub    $0x18,%esp
  18:	8b 01                	mov    (%ecx),%eax
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
  1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  20:	83 f8 01             	cmp    $0x1,%eax
  23:	7e 6b                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  25:	8b 43 04             	mov    0x4(%ebx),%eax
  28:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  2b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2f:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  34:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  37:	75 29                	jne    62 <main+0x62>
  39:	eb 68                	jmp    a3 <main+0xa3>
  3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  3f:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	pushl  -0x20(%ebp)
  4d:	e8 de 01 00 00       	call   230 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 81 06 00 00       	call   6db <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	pushl  (%ebx)
  69:	e8 85 06 00 00       	call   6f3 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	pushl  (%ebx)
  7a:	68 a8 0b 00 00       	push   $0xba8
  7f:	6a 01                	push   $0x1
  81:	e8 9a 07 00 00       	call   820 <printf>
      exit();
  86:	e8 28 06 00 00       	call   6b3 <exit>
  }
  exit();
  8b:	e8 23 06 00 00       	call   6b3 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 88 0b 00 00       	push   $0xb88
  97:	6a 02                	push   $0x2
  99:	e8 82 07 00 00       	call   820 <printf>
    exit();
  9e:	e8 10 06 00 00       	call   6b3 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 83 01 00 00       	call   230 <grep>
    exit();
  ad:	e8 01 06 00 00       	call   6b3 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  c0:	f3 0f 1e fb          	endbr32 
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	57                   	push   %edi
  c8:	56                   	push   %esi
  c9:	53                   	push   %ebx
  ca:	83 ec 0c             	sub    $0xc,%esp
  cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  d0:	8b 75 0c             	mov    0xc(%ebp),%esi
  d3:	8b 7d 10             	mov    0x10(%ebp),%edi
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  e0:	83 ec 08             	sub    $0x8,%esp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	e8 36 00 00 00       	call   120 <matchhere>
  ea:	83 c4 10             	add    $0x10,%esp
  ed:	85 c0                	test   %eax,%eax
  ef:	75 1f                	jne    110 <matchstar+0x50>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  f1:	0f be 17             	movsbl (%edi),%edx
  f4:	84 d2                	test   %dl,%dl
  f6:	74 0c                	je     104 <matchstar+0x44>
  f8:	83 c7 01             	add    $0x1,%edi
  fb:	39 da                	cmp    %ebx,%edx
  fd:	74 e1                	je     e0 <matchstar+0x20>
  ff:	83 fb 2e             	cmp    $0x2e,%ebx
 102:	74 dc                	je     e0 <matchstar+0x20>
  return 0;
}
 104:	8d 65 f4             	lea    -0xc(%ebp),%esp
 107:	5b                   	pop    %ebx
 108:	5e                   	pop    %esi
 109:	5f                   	pop    %edi
 10a:	5d                   	pop    %ebp
 10b:	c3                   	ret    
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 113:	b8 01 00 00 00       	mov    $0x1,%eax
}
 118:	5b                   	pop    %ebx
 119:	5e                   	pop    %esi
 11a:	5f                   	pop    %edi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <matchhere>:
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
 12a:	83 ec 0c             	sub    $0xc,%esp
 12d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 130:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 133:	0f b6 01             	movzbl (%ecx),%eax
 136:	84 c0                	test   %al,%al
 138:	75 2b                	jne    165 <matchhere+0x45>
 13a:	eb 64                	jmp    1a0 <matchhere+0x80>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(re[0] == '$' && re[1] == '\0')
 140:	0f b6 37             	movzbl (%edi),%esi
 143:	80 fa 24             	cmp    $0x24,%dl
 146:	75 04                	jne    14c <matchhere+0x2c>
 148:	84 c0                	test   %al,%al
 14a:	74 61                	je     1ad <matchhere+0x8d>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 14c:	89 f3                	mov    %esi,%ebx
 14e:	84 db                	test   %bl,%bl
 150:	74 3e                	je     190 <matchhere+0x70>
 152:	80 fa 2e             	cmp    $0x2e,%dl
 155:	74 04                	je     15b <matchhere+0x3b>
 157:	38 d3                	cmp    %dl,%bl
 159:	75 35                	jne    190 <matchhere+0x70>
    return matchhere(re+1, text+1);
 15b:	83 c7 01             	add    $0x1,%edi
 15e:	83 c1 01             	add    $0x1,%ecx
  if(re[0] == '\0')
 161:	84 c0                	test   %al,%al
 163:	74 3b                	je     1a0 <matchhere+0x80>
  if(re[1] == '*')
 165:	0f be d0             	movsbl %al,%edx
 168:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 16c:	3c 2a                	cmp    $0x2a,%al
 16e:	75 d0                	jne    140 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	83 c1 02             	add    $0x2,%ecx
 176:	57                   	push   %edi
 177:	51                   	push   %ecx
 178:	52                   	push   %edx
 179:	e8 42 ff ff ff       	call   c0 <matchstar>
 17e:	83 c4 10             	add    $0x10,%esp
}
 181:	8d 65 f4             	lea    -0xc(%ebp),%esp
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5f                   	pop    %edi
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 193:	31 c0                	xor    %eax,%eax
}
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 1a3:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a8:	5b                   	pop    %ebx
 1a9:	5e                   	pop    %esi
 1aa:	5f                   	pop    %edi
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
    return *text == '\0';
 1ad:	89 f0                	mov    %esi,%eax
 1af:	84 c0                	test   %al,%al
 1b1:	0f 94 c0             	sete   %al
 1b4:	0f b6 c0             	movzbl %al,%eax
 1b7:	eb c8                	jmp    181 <matchhere+0x61>
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <match>:
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	56                   	push   %esi
 1c8:	53                   	push   %ebx
 1c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1cf:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1d2:	75 15                	jne    1e9 <match+0x29>
 1d4:	eb 3a                	jmp    210 <match+0x50>
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e0:	83 c6 01             	add    $0x1,%esi
 1e3:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1e7:	74 16                	je     1ff <match+0x3f>
    if(matchhere(re, text))
 1e9:	83 ec 08             	sub    $0x8,%esp
 1ec:	56                   	push   %esi
 1ed:	53                   	push   %ebx
 1ee:	e8 2d ff ff ff       	call   120 <matchhere>
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	85 c0                	test   %eax,%eax
 1f8:	74 e6                	je     1e0 <match+0x20>
      return 1;
 1fa:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 202:	5b                   	pop    %ebx
 203:	5e                   	pop    %esi
 204:	5d                   	pop    %ebp
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 210:	83 c3 01             	add    $0x1,%ebx
 213:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ff fe ff ff       	jmp    120 <matchhere>
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <grep>:
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
 239:	53                   	push   %ebx
 23a:	83 ec 1c             	sub    $0x1c,%esp
  m = 0;
 23d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
{
 244:	8b 75 08             	mov    0x8(%ebp),%esi
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 250:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 253:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 258:	83 ec 04             	sub    $0x4,%esp
 25b:	29 c8                	sub    %ecx,%eax
 25d:	50                   	push   %eax
 25e:	8d 81 40 10 00 00    	lea    0x1040(%ecx),%eax
 264:	50                   	push   %eax
 265:	ff 75 0c             	pushl  0xc(%ebp)
 268:	e8 5e 04 00 00       	call   6cb <read>
 26d:	83 c4 10             	add    $0x10,%esp
 270:	85 c0                	test   %eax,%eax
 272:	0f 8e b8 00 00 00    	jle    330 <grep+0x100>
    m += n;
 278:	01 45 e4             	add    %eax,-0x1c(%ebp)
 27b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    p = buf;
 27e:	bb 40 10 00 00       	mov    $0x1040,%ebx
    buf[m] = '\0';
 283:	c6 81 40 10 00 00 00 	movb   $0x0,0x1040(%ecx)
    while((q = strchr(p, '\n')) != 0){
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 290:	83 ec 08             	sub    $0x8,%esp
 293:	6a 0a                	push   $0xa
 295:	53                   	push   %ebx
 296:	e8 95 02 00 00       	call   530 <strchr>
 29b:	83 c4 10             	add    $0x10,%esp
 29e:	89 c7                	mov    %eax,%edi
 2a0:	85 c0                	test   %eax,%eax
 2a2:	74 3c                	je     2e0 <grep+0xb0>
      if(match(pattern, p)){
 2a4:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 2a7:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 2aa:	53                   	push   %ebx
 2ab:	56                   	push   %esi
 2ac:	e8 0f ff ff ff       	call   1c0 <match>
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	8d 57 01             	lea    0x1(%edi),%edx
 2b7:	85 c0                	test   %eax,%eax
 2b9:	75 05                	jne    2c0 <grep+0x90>
      p = q+1;
 2bb:	89 d3                	mov    %edx,%ebx
 2bd:	eb d1                	jmp    290 <grep+0x60>
 2bf:	90                   	nop
        write(1, p, q+1 - p);
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2c5:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)
 2cd:	50                   	push   %eax
 2ce:	53                   	push   %ebx
 2cf:	6a 01                	push   $0x1
 2d1:	e8 fd 03 00 00       	call   6d3 <write>
 2d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2d9:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 2dc:	89 d3                	mov    %edx,%ebx
 2de:	eb b0                	jmp    290 <grep+0x60>
    if(p == buf)
 2e0:	81 fb 40 10 00 00    	cmp    $0x1040,%ebx
 2e6:	74 38                	je     320 <grep+0xf0>
    if(m > 0){
 2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 2eb:	85 c9                	test   %ecx,%ecx
 2ed:	0f 8e 5d ff ff ff    	jle    250 <grep+0x20>
      m -= p - buf;
 2f3:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2f5:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f8:	2d 40 10 00 00       	sub    $0x1040,%eax
 2fd:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2ff:	51                   	push   %ecx
 300:	53                   	push   %ebx
 301:	68 40 10 00 00       	push   $0x1040
      m -= p - buf;
 306:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 309:	e8 72 03 00 00       	call   680 <memmove>
 30e:	83 c4 10             	add    $0x10,%esp
 311:	e9 3a ff ff ff       	jmp    250 <grep+0x20>
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 0;
 320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 327:	e9 24 ff ff ff       	jmp    250 <grep+0x20>
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <thread_create>:
#include "user.h"
#include "x86.h"

int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) 
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	83 ec 10             	sub    $0x10,%esp
  void *stack;
  int pid;
  
  // Allocate a page for the stack
  stack = malloc(4096); // PGSIZE
 34b:	68 00 10 00 00       	push   $0x1000
 350:	e8 2b 07 00 00       	call   a80 <malloc>
  if(stack == 0)
 355:	83 c4 10             	add    $0x10,%esp
 358:	85 c0                	test   %eax,%eax
 35a:	74 32                	je     38e <thread_create+0x4e>
 35c:	89 c3                	mov    %eax,%ebx
    return -1;
    
  // Ensure stack is page-aligned
  if((uint)stack % 4096) {
    stack = (void*)((uint)stack + (4096 - ((uint)stack % 4096)));
 35e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 363:	05 00 10 00 00       	add    $0x1000,%eax
 368:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 36e:	0f 45 d8             	cmovne %eax,%ebx
  }

  // Call clone system call to create the thread
  pid = clone(start_routine, arg1, arg2, stack);
 371:	53                   	push   %ebx
 372:	ff 75 10             	pushl  0x10(%ebp)
 375:	ff 75 0c             	pushl  0xc(%ebp)
 378:	ff 75 08             	pushl  0x8(%ebp)
 37b:	e8 d3 03 00 00       	call   753 <clone>
  
  if(pid == 0) {
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	74 02                	je     389 <thread_create+0x49>
    // Child thread - just return 0
    return 0;
  } else if(pid < 0) {
 387:	78 0c                	js     395 <thread_create+0x55>
    return -1;
  }
  
  // Parent - return the child thread's PID
  return pid;
}
 389:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38c:	c9                   	leave  
 38d:	c3                   	ret    
    return -1;
 38e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 393:	eb f4                	jmp    389 <thread_create+0x49>
    free(stack);
 395:	83 ec 0c             	sub    $0xc,%esp
 398:	53                   	push   %ebx
 399:	e8 52 06 00 00       	call   9f0 <free>
    return -1;
 39e:	83 c4 10             	add    $0x10,%esp
 3a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3a6:	eb e1                	jmp    389 <thread_create+0x49>
 3a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <thread_join>:

int 
thread_join(void) 
{
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 34             	sub    $0x34,%esp
  void *stack;
  int pid;
  
  // Wait for a thread to exit
  pid = join(&stack);
 3ba:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bd:	50                   	push   %eax
 3be:	e8 98 03 00 00       	call   75b <join>
  
  if(pid > 0) {
 3c3:	83 c4 10             	add    $0x10,%esp
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7f 06                	jg     3d0 <thread_join+0x20>
    // Free the thread's stack
    free(stack);
  }
  
  return pid;
}
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    free(stack);
 3d0:	83 ec 0c             	sub    $0xc,%esp
 3d3:	ff 75 f4             	pushl  -0xc(%ebp)
 3d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3d9:	e8 12 06 00 00       	call   9f0 <free>
 3de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 3e1:	83 c4 10             	add    $0x10,%esp
}
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <lock_init>:

void 
lock_init(lock_t *lock) 
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3fa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 400:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <lock_acquire>:

void 
lock_acquire(lock_t *lock) 
{
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 415:	b9 01 00 00 00       	mov    $0x1,%ecx
 41a:	89 e5                	mov    %esp,%ebp
 41c:	8b 55 08             	mov    0x8(%ebp),%edx
 41f:	90                   	nop
 420:	89 c8                	mov    %ecx,%eax
 422:	f0 87 02             	lock xchg %eax,(%edx)
  // Simple test and set approach for xv6
  // Use the existing xchg function from x86.h
  while(xchg(&lock->ticket, 1) != 0)
 425:	85 c0                	test   %eax,%eax
 427:	75 f7                	jne    420 <lock_acquire+0x10>
    ; // Spin
}
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <lock_release>:

void 
lock_release(lock_t *lock) 
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
  lock->ticket = 0;
 437:	8b 45 08             	mov    0x8(%ebp),%eax
 43a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    
 442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 455:	31 c0                	xor    %eax,%eax
{
 457:	89 e5                	mov    %esp,%ebp
 459:	53                   	push   %ebx
 45a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 45d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 460:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 464:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 467:	83 c0 01             	add    $0x1,%eax
 46a:	84 d2                	test   %dl,%dl
 46c:	75 f2                	jne    460 <strcpy+0x10>
    ;
  return os;
}
 46e:	89 c8                	mov    %ecx,%eax
 470:	5b                   	pop    %ebx
 471:	5d                   	pop    %ebp
 472:	c3                   	ret    
 473:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000480 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	53                   	push   %ebx
 488:	8b 4d 08             	mov    0x8(%ebp),%ecx
 48b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 48e:	0f b6 01             	movzbl (%ecx),%eax
 491:	0f b6 1a             	movzbl (%edx),%ebx
 494:	84 c0                	test   %al,%al
 496:	75 19                	jne    4b1 <strcmp+0x31>
 498:	eb 26                	jmp    4c0 <strcmp+0x40>
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 4a4:	83 c1 01             	add    $0x1,%ecx
 4a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4aa:	0f b6 1a             	movzbl (%edx),%ebx
 4ad:	84 c0                	test   %al,%al
 4af:	74 0f                	je     4c0 <strcmp+0x40>
 4b1:	38 d8                	cmp    %bl,%al
 4b3:	74 eb                	je     4a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 4b5:	29 d8                	sub    %ebx,%eax
}
 4b7:	5b                   	pop    %ebx
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    
 4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 4c2:	29 d8                	sub    %ebx,%eax
}
 4c4:	5b                   	pop    %ebx
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <strlen>:

uint
strlen(const char *s)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 4da:	80 3a 00             	cmpb   $0x0,(%edx)
 4dd:	74 21                	je     500 <strlen+0x30>
 4df:	31 c0                	xor    %eax,%eax
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	83 c0 01             	add    $0x1,%eax
 4eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4ef:	89 c1                	mov    %eax,%ecx
 4f1:	75 f5                	jne    4e8 <strlen+0x18>
    ;
  return n;
}
 4f3:	89 c8                	mov    %ecx,%eax
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    
 4f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 500:	31 c9                	xor    %ecx,%ecx
}
 502:	5d                   	pop    %ebp
 503:	89 c8                	mov    %ecx,%eax
 505:	c3                   	ret    
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <memset>:

void*
memset(void *dst, int c, uint n)
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	57                   	push   %edi
 518:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 51b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 51e:	8b 45 0c             	mov    0xc(%ebp),%eax
 521:	89 d7                	mov    %edx,%edi
 523:	fc                   	cld    
 524:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 526:	89 d0                	mov    %edx,%eax
 528:	5f                   	pop    %edi
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <strchr>:

char*
strchr(const char *s, char c)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	8b 45 08             	mov    0x8(%ebp),%eax
 53a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 53e:	0f b6 10             	movzbl (%eax),%edx
 541:	84 d2                	test   %dl,%dl
 543:	75 16                	jne    55b <strchr+0x2b>
 545:	eb 21                	jmp    568 <strchr+0x38>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax
 550:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 554:	83 c0 01             	add    $0x1,%eax
 557:	84 d2                	test   %dl,%dl
 559:	74 0d                	je     568 <strchr+0x38>
    if(*s == c)
 55b:	38 d1                	cmp    %dl,%cl
 55d:	75 f1                	jne    550 <strchr+0x20>
      return (char*)s;
  return 0;
}
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 568:	31 c0                	xor    %eax,%eax
}
 56a:	5d                   	pop    %ebp
 56b:	c3                   	ret    
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <gets>:

char*
gets(char *buf, int max)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 579:	31 f6                	xor    %esi,%esi
{
 57b:	53                   	push   %ebx
 57c:	89 f3                	mov    %esi,%ebx
 57e:	83 ec 1c             	sub    $0x1c,%esp
 581:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 584:	eb 33                	jmp    5b9 <gets+0x49>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	8d 45 e7             	lea    -0x19(%ebp),%eax
 596:	6a 01                	push   $0x1
 598:	50                   	push   %eax
 599:	6a 00                	push   $0x0
 59b:	e8 2b 01 00 00       	call   6cb <read>
    if(cc < 1)
 5a0:	83 c4 10             	add    $0x10,%esp
 5a3:	85 c0                	test   %eax,%eax
 5a5:	7e 1c                	jle    5c3 <gets+0x53>
      break;
    buf[i++] = c;
 5a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5ab:	83 c7 01             	add    $0x1,%edi
 5ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 5b1:	3c 0a                	cmp    $0xa,%al
 5b3:	74 23                	je     5d8 <gets+0x68>
 5b5:	3c 0d                	cmp    $0xd,%al
 5b7:	74 1f                	je     5d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 5b9:	83 c3 01             	add    $0x1,%ebx
 5bc:	89 fe                	mov    %edi,%esi
 5be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5c1:	7c cd                	jl     590 <gets+0x20>
 5c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 5c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 5cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ce:	5b                   	pop    %ebx
 5cf:	5e                   	pop    %esi
 5d0:	5f                   	pop    %edi
 5d1:	5d                   	pop    %ebp
 5d2:	c3                   	ret    
 5d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d7:	90                   	nop
 5d8:	8b 75 08             	mov    0x8(%ebp),%esi
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	01 de                	add    %ebx,%esi
 5e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 5e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 5e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e8:	5b                   	pop    %ebx
 5e9:	5e                   	pop    %esi
 5ea:	5f                   	pop    %edi
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    
 5ed:	8d 76 00             	lea    0x0(%esi),%esi

000005f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	56                   	push   %esi
 5f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f9:	83 ec 08             	sub    $0x8,%esp
 5fc:	6a 00                	push   $0x0
 5fe:	ff 75 08             	pushl  0x8(%ebp)
 601:	e8 ed 00 00 00       	call   6f3 <open>
  if(fd < 0)
 606:	83 c4 10             	add    $0x10,%esp
 609:	85 c0                	test   %eax,%eax
 60b:	78 2b                	js     638 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 60d:	83 ec 08             	sub    $0x8,%esp
 610:	ff 75 0c             	pushl  0xc(%ebp)
 613:	89 c3                	mov    %eax,%ebx
 615:	50                   	push   %eax
 616:	e8 f0 00 00 00       	call   70b <fstat>
  close(fd);
 61b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 61e:	89 c6                	mov    %eax,%esi
  close(fd);
 620:	e8 b6 00 00 00       	call   6db <close>
  return r;
 625:	83 c4 10             	add    $0x10,%esp
}
 628:	8d 65 f8             	lea    -0x8(%ebp),%esp
 62b:	89 f0                	mov    %esi,%eax
 62d:	5b                   	pop    %ebx
 62e:	5e                   	pop    %esi
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret    
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 638:	be ff ff ff ff       	mov    $0xffffffff,%esi
 63d:	eb e9                	jmp    628 <stat+0x38>
 63f:	90                   	nop

00000640 <atoi>:

int
atoi(const char *s)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	53                   	push   %ebx
 648:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 64b:	0f be 02             	movsbl (%edx),%eax
 64e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 651:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 654:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 659:	77 1a                	ja     675 <atoi+0x35>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
    n = n*10 + *s++ - '0';
 660:	83 c2 01             	add    $0x1,%edx
 663:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 666:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 66a:	0f be 02             	movsbl (%edx),%eax
 66d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 670:	80 fb 09             	cmp    $0x9,%bl
 673:	76 eb                	jbe    660 <atoi+0x20>
  return n;
}
 675:	89 c8                	mov    %ecx,%eax
 677:	5b                   	pop    %ebx
 678:	5d                   	pop    %ebp
 679:	c3                   	ret    
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000680 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
 685:	89 e5                	mov    %esp,%ebp
 687:	57                   	push   %edi
 688:	8b 45 10             	mov    0x10(%ebp),%eax
 68b:	8b 55 08             	mov    0x8(%ebp),%edx
 68e:	56                   	push   %esi
 68f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 692:	85 c0                	test   %eax,%eax
 694:	7e 0f                	jle    6a5 <memmove+0x25>
 696:	01 d0                	add    %edx,%eax
  dst = vdst;
 698:	89 d7                	mov    %edx,%edi
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 6a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6a1:	39 f8                	cmp    %edi,%eax
 6a3:	75 fb                	jne    6a0 <memmove+0x20>
  return vdst;
 6a5:	5e                   	pop    %esi
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    

000006ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ab:	b8 01 00 00 00       	mov    $0x1,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <exit>:
SYSCALL(exit)
 6b3:	b8 02 00 00 00       	mov    $0x2,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <wait>:
SYSCALL(wait)
 6bb:	b8 03 00 00 00       	mov    $0x3,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <pipe>:
SYSCALL(pipe)
 6c3:	b8 04 00 00 00       	mov    $0x4,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <read>:
SYSCALL(read)
 6cb:	b8 05 00 00 00       	mov    $0x5,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <write>:
SYSCALL(write)
 6d3:	b8 10 00 00 00       	mov    $0x10,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <close>:
SYSCALL(close)
 6db:	b8 15 00 00 00       	mov    $0x15,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <kill>:
SYSCALL(kill)
 6e3:	b8 06 00 00 00       	mov    $0x6,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <exec>:
SYSCALL(exec)
 6eb:	b8 07 00 00 00       	mov    $0x7,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <open>:
SYSCALL(open)
 6f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <mknod>:
SYSCALL(mknod)
 6fb:	b8 11 00 00 00       	mov    $0x11,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <unlink>:
SYSCALL(unlink)
 703:	b8 12 00 00 00       	mov    $0x12,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <fstat>:
SYSCALL(fstat)
 70b:	b8 08 00 00 00       	mov    $0x8,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <link>:
SYSCALL(link)
 713:	b8 13 00 00 00       	mov    $0x13,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <mkdir>:
SYSCALL(mkdir)
 71b:	b8 14 00 00 00       	mov    $0x14,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <chdir>:
SYSCALL(chdir)
 723:	b8 09 00 00 00       	mov    $0x9,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <dup>:
SYSCALL(dup)
 72b:	b8 0a 00 00 00       	mov    $0xa,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <getpid>:
SYSCALL(getpid)
 733:	b8 0b 00 00 00       	mov    $0xb,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <sbrk>:
SYSCALL(sbrk)
 73b:	b8 0c 00 00 00       	mov    $0xc,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <sleep>:
SYSCALL(sleep)
 743:	b8 0d 00 00 00       	mov    $0xd,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <uptime>:
SYSCALL(uptime)
 74b:	b8 0e 00 00 00       	mov    $0xe,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <clone>:
SYSCALL(clone)
 753:	b8 16 00 00 00       	mov    $0x16,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <join>:
 75b:	b8 17 00 00 00       	mov    $0x17,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    
 763:	66 90                	xchg   %ax,%ax
 765:	66 90                	xchg   %ax,%ax
 767:	66 90                	xchg   %ax,%ax
 769:	66 90                	xchg   %ax,%ax
 76b:	66 90                	xchg   %ax,%ax
 76d:	66 90                	xchg   %ax,%ax
 76f:	90                   	nop

00000770 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 3c             	sub    $0x3c,%esp
 779:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 77c:	89 d1                	mov    %edx,%ecx
{
 77e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 781:	85 d2                	test   %edx,%edx
 783:	0f 89 7f 00 00 00    	jns    808 <printint+0x98>
 789:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 78d:	74 79                	je     808 <printint+0x98>
    neg = 1;
 78f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 796:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 798:	31 db                	xor    %ebx,%ebx
 79a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 79d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7a0:	89 c8                	mov    %ecx,%eax
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	89 cf                	mov    %ecx,%edi
 7a6:	f7 75 c4             	divl   -0x3c(%ebp)
 7a9:	0f b6 92 c8 0b 00 00 	movzbl 0xbc8(%edx),%edx
 7b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7b3:	89 d8                	mov    %ebx,%eax
 7b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7c1:	76 dd                	jbe    7a0 <printint+0x30>
  if(neg)
 7c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7c6:	85 c9                	test   %ecx,%ecx
 7c8:	74 0c                	je     7d6 <printint+0x66>
    buf[i++] = '-';
 7ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7dd:	eb 07                	jmp    7e6 <printint+0x76>
 7df:	90                   	nop
 7e0:	0f b6 13             	movzbl (%ebx),%edx
 7e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7e6:	83 ec 04             	sub    $0x4,%esp
 7e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ec:	6a 01                	push   $0x1
 7ee:	56                   	push   %esi
 7ef:	57                   	push   %edi
 7f0:	e8 de fe ff ff       	call   6d3 <write>
  while(--i >= 0)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	39 de                	cmp    %ebx,%esi
 7fa:	75 e4                	jne    7e0 <printint+0x70>
    putc(fd, buf[i]);
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ff:	5b                   	pop    %ebx
 800:	5e                   	pop    %esi
 801:	5f                   	pop    %edi
 802:	5d                   	pop    %ebp
 803:	c3                   	ret    
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 808:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 80f:	eb 87                	jmp    798 <printint+0x28>
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop

00000820 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
 825:	89 e5                	mov    %esp,%ebp
 827:	57                   	push   %edi
 828:	56                   	push   %esi
 829:	53                   	push   %ebx
 82a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 82d:	8b 75 0c             	mov    0xc(%ebp),%esi
 830:	0f b6 1e             	movzbl (%esi),%ebx
 833:	84 db                	test   %bl,%bl
 835:	0f 84 b4 00 00 00    	je     8ef <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 83b:	8d 45 10             	lea    0x10(%ebp),%eax
 83e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 841:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 844:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 846:	89 45 d0             	mov    %eax,-0x30(%ebp)
 849:	eb 33                	jmp    87e <printf+0x5e>
 84b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
 850:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 853:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 858:	83 f8 25             	cmp    $0x25,%eax
 85b:	74 17                	je     874 <printf+0x54>
  write(fd, &c, 1);
 85d:	83 ec 04             	sub    $0x4,%esp
 860:	88 5d e7             	mov    %bl,-0x19(%ebp)
 863:	6a 01                	push   $0x1
 865:	57                   	push   %edi
 866:	ff 75 08             	pushl  0x8(%ebp)
 869:	e8 65 fe ff ff       	call   6d3 <write>
 86e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 871:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 874:	0f b6 1e             	movzbl (%esi),%ebx
 877:	83 c6 01             	add    $0x1,%esi
 87a:	84 db                	test   %bl,%bl
 87c:	74 71                	je     8ef <printf+0xcf>
    c = fmt[i] & 0xff;
 87e:	0f be cb             	movsbl %bl,%ecx
 881:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 884:	85 d2                	test   %edx,%edx
 886:	74 c8                	je     850 <printf+0x30>
      }
    } else if(state == '%'){
 888:	83 fa 25             	cmp    $0x25,%edx
 88b:	75 e7                	jne    874 <printf+0x54>
      if(c == 'd'){
 88d:	83 f8 64             	cmp    $0x64,%eax
 890:	0f 84 9a 00 00 00    	je     930 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 896:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 89c:	83 f9 70             	cmp    $0x70,%ecx
 89f:	74 5f                	je     900 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8a1:	83 f8 73             	cmp    $0x73,%eax
 8a4:	0f 84 d6 00 00 00    	je     980 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8aa:	83 f8 63             	cmp    $0x63,%eax
 8ad:	0f 84 8d 00 00 00    	je     940 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8b3:	83 f8 25             	cmp    $0x25,%eax
 8b6:	0f 84 b4 00 00 00    	je     970 <printf+0x150>
  write(fd, &c, 1);
 8bc:	83 ec 04             	sub    $0x4,%esp
 8bf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8c3:	6a 01                	push   $0x1
 8c5:	57                   	push   %edi
 8c6:	ff 75 08             	pushl  0x8(%ebp)
 8c9:	e8 05 fe ff ff       	call   6d3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 8ce:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8d1:	83 c4 0c             	add    $0xc,%esp
 8d4:	6a 01                	push   $0x1
 8d6:	83 c6 01             	add    $0x1,%esi
 8d9:	57                   	push   %edi
 8da:	ff 75 08             	pushl  0x8(%ebp)
 8dd:	e8 f1 fd ff ff       	call   6d3 <write>
  for(i = 0; fmt[i]; i++){
 8e2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8e6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8e9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8eb:	84 db                	test   %bl,%bl
 8ed:	75 8f                	jne    87e <printf+0x5e>
    }
  }
}
 8ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8f2:	5b                   	pop    %ebx
 8f3:	5e                   	pop    %esi
 8f4:	5f                   	pop    %edi
 8f5:	5d                   	pop    %ebp
 8f6:	c3                   	ret    
 8f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	b9 10 00 00 00       	mov    $0x10,%ecx
 908:	6a 00                	push   $0x0
 90a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 90d:	8b 45 08             	mov    0x8(%ebp),%eax
 910:	8b 13                	mov    (%ebx),%edx
 912:	e8 59 fe ff ff       	call   770 <printint>
        ap++;
 917:	89 d8                	mov    %ebx,%eax
 919:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91c:	31 d2                	xor    %edx,%edx
        ap++;
 91e:	83 c0 04             	add    $0x4,%eax
 921:	89 45 d0             	mov    %eax,-0x30(%ebp)
 924:	e9 4b ff ff ff       	jmp    874 <printf+0x54>
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 930:	83 ec 0c             	sub    $0xc,%esp
 933:	b9 0a 00 00 00       	mov    $0xa,%ecx
 938:	6a 01                	push   $0x1
 93a:	eb ce                	jmp    90a <printf+0xea>
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 940:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 943:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 946:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 948:	6a 01                	push   $0x1
        ap++;
 94a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 94d:	57                   	push   %edi
 94e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 951:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 954:	e8 7a fd ff ff       	call   6d3 <write>
        ap++;
 959:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 95c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 95f:	31 d2                	xor    %edx,%edx
 961:	e9 0e ff ff ff       	jmp    874 <printf+0x54>
 966:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 970:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 973:	83 ec 04             	sub    $0x4,%esp
 976:	e9 59 ff ff ff       	jmp    8d4 <printf+0xb4>
 97b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop
        s = (char*)*ap;
 980:	8b 45 d0             	mov    -0x30(%ebp),%eax
 983:	8b 18                	mov    (%eax),%ebx
        ap++;
 985:	83 c0 04             	add    $0x4,%eax
 988:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 98b:	85 db                	test   %ebx,%ebx
 98d:	74 17                	je     9a6 <printf+0x186>
        while(*s != 0){
 98f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 992:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 994:	84 c0                	test   %al,%al
 996:	0f 84 d8 fe ff ff    	je     874 <printf+0x54>
 99c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 99f:	89 de                	mov    %ebx,%esi
 9a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9a4:	eb 1a                	jmp    9c0 <printf+0x1a0>
          s = "(null)";
 9a6:	bb be 0b 00 00       	mov    $0xbbe,%ebx
        while(*s != 0){
 9ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 9ae:	b8 28 00 00 00       	mov    $0x28,%eax
 9b3:	89 de                	mov    %ebx,%esi
 9b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bf:	90                   	nop
  write(fd, &c, 1);
 9c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 9c3:	83 c6 01             	add    $0x1,%esi
 9c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9c9:	6a 01                	push   $0x1
 9cb:	57                   	push   %edi
 9cc:	53                   	push   %ebx
 9cd:	e8 01 fd ff ff       	call   6d3 <write>
        while(*s != 0){
 9d2:	0f b6 06             	movzbl (%esi),%eax
 9d5:	83 c4 10             	add    $0x10,%esp
 9d8:	84 c0                	test   %al,%al
 9da:	75 e4                	jne    9c0 <printf+0x1a0>
 9dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 9df:	31 d2                	xor    %edx,%edx
 9e1:	e9 8e fe ff ff       	jmp    874 <printf+0x54>
 9e6:	66 90                	xchg   %ax,%ax
 9e8:	66 90                	xchg   %ax,%ax
 9ea:	66 90                	xchg   %ax,%ax
 9ec:	66 90                	xchg   %ax,%ax
 9ee:	66 90                	xchg   %ax,%ax

000009f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f0:	f3 0f 1e fb          	endbr32 
 9f4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f5:	a1 20 10 00 00       	mov    0x1020,%eax
{
 9fa:	89 e5                	mov    %esp,%ebp
 9fc:	57                   	push   %edi
 9fd:	56                   	push   %esi
 9fe:	53                   	push   %ebx
 9ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a02:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 a04:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a07:	39 c8                	cmp    %ecx,%eax
 a09:	73 15                	jae    a20 <free+0x30>
 a0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
 a10:	39 d1                	cmp    %edx,%ecx
 a12:	72 14                	jb     a28 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	39 d0                	cmp    %edx,%eax
 a16:	73 10                	jae    a28 <free+0x38>
{
 a18:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1a:	8b 10                	mov    (%eax),%edx
 a1c:	39 c8                	cmp    %ecx,%eax
 a1e:	72 f0                	jb     a10 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	39 d0                	cmp    %edx,%eax
 a22:	72 f4                	jb     a18 <free+0x28>
 a24:	39 d1                	cmp    %edx,%ecx
 a26:	73 f0                	jae    a18 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a28:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a2b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a2e:	39 fa                	cmp    %edi,%edx
 a30:	74 1e                	je     a50 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a32:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a35:	8b 50 04             	mov    0x4(%eax),%edx
 a38:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a3b:	39 f1                	cmp    %esi,%ecx
 a3d:	74 28                	je     a67 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a3f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 a41:	5b                   	pop    %ebx
  freep = p;
 a42:	a3 20 10 00 00       	mov    %eax,0x1020
}
 a47:	5e                   	pop    %esi
 a48:	5f                   	pop    %edi
 a49:	5d                   	pop    %ebp
 a4a:	c3                   	ret    
 a4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a4f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 a50:	03 72 04             	add    0x4(%edx),%esi
 a53:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a56:	8b 10                	mov    (%eax),%edx
 a58:	8b 12                	mov    (%edx),%edx
 a5a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a5d:	8b 50 04             	mov    0x4(%eax),%edx
 a60:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a63:	39 f1                	cmp    %esi,%ecx
 a65:	75 d8                	jne    a3f <free+0x4f>
    p->s.size += bp->s.size;
 a67:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a6a:	a3 20 10 00 00       	mov    %eax,0x1020
    p->s.size += bp->s.size;
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a72:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a75:	89 10                	mov    %edx,(%eax)
}
 a77:	5b                   	pop    %ebx
 a78:	5e                   	pop    %esi
 a79:	5f                   	pop    %edi
 a7a:	5d                   	pop    %ebp
 a7b:	c3                   	ret    
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a80:	f3 0f 1e fb          	endbr32 
 a84:	55                   	push   %ebp
 a85:	89 e5                	mov    %esp,%ebp
 a87:	57                   	push   %edi
 a88:	56                   	push   %esi
 a89:	53                   	push   %ebx
 a8a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a90:	8b 3d 20 10 00 00    	mov    0x1020,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a96:	8d 70 07             	lea    0x7(%eax),%esi
 a99:	c1 ee 03             	shr    $0x3,%esi
 a9c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a9f:	85 ff                	test   %edi,%edi
 aa1:	0f 84 a9 00 00 00    	je     b50 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 aa9:	8b 48 04             	mov    0x4(%eax),%ecx
 aac:	39 f1                	cmp    %esi,%ecx
 aae:	73 6d                	jae    b1d <malloc+0x9d>
 ab0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ab6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 abb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 abe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ac5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ac8:	eb 17                	jmp    ae1 <malloc+0x61>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 ad2:	8b 4a 04             	mov    0x4(%edx),%ecx
 ad5:	39 f1                	cmp    %esi,%ecx
 ad7:	73 4f                	jae    b28 <malloc+0xa8>
 ad9:	8b 3d 20 10 00 00    	mov    0x1020,%edi
 adf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae1:	39 c7                	cmp    %eax,%edi
 ae3:	75 eb                	jne    ad0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ae5:	83 ec 0c             	sub    $0xc,%esp
 ae8:	ff 75 e4             	pushl  -0x1c(%ebp)
 aeb:	e8 4b fc ff ff       	call   73b <sbrk>
  if(p == (char*)-1)
 af0:	83 c4 10             	add    $0x10,%esp
 af3:	83 f8 ff             	cmp    $0xffffffff,%eax
 af6:	74 1b                	je     b13 <malloc+0x93>
  hp->s.size = nu;
 af8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 afb:	83 ec 0c             	sub    $0xc,%esp
 afe:	83 c0 08             	add    $0x8,%eax
 b01:	50                   	push   %eax
 b02:	e8 e9 fe ff ff       	call   9f0 <free>
  return freep;
 b07:	a1 20 10 00 00       	mov    0x1020,%eax
      if((p = morecore(nunits)) == 0)
 b0c:	83 c4 10             	add    $0x10,%esp
 b0f:	85 c0                	test   %eax,%eax
 b11:	75 bd                	jne    ad0 <malloc+0x50>
        return 0;
  }
}
 b13:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b16:	31 c0                	xor    %eax,%eax
}
 b18:	5b                   	pop    %ebx
 b19:	5e                   	pop    %esi
 b1a:	5f                   	pop    %edi
 b1b:	5d                   	pop    %ebp
 b1c:	c3                   	ret    
    if(p->s.size >= nunits){
 b1d:	89 c2                	mov    %eax,%edx
 b1f:	89 f8                	mov    %edi,%eax
 b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b28:	39 ce                	cmp    %ecx,%esi
 b2a:	74 54                	je     b80 <malloc+0x100>
        p->s.size -= nunits;
 b2c:	29 f1                	sub    %esi,%ecx
 b2e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 b31:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 b34:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 b37:	a3 20 10 00 00       	mov    %eax,0x1020
}
 b3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b3f:	8d 42 08             	lea    0x8(%edx),%eax
}
 b42:	5b                   	pop    %ebx
 b43:	5e                   	pop    %esi
 b44:	5f                   	pop    %edi
 b45:	5d                   	pop    %ebp
 b46:	c3                   	ret    
 b47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b50:	c7 05 20 10 00 00 24 	movl   $0x1024,0x1020
 b57:	10 00 00 
    base.s.size = 0;
 b5a:	bf 24 10 00 00       	mov    $0x1024,%edi
    base.s.ptr = freep = prevp = &base;
 b5f:	c7 05 24 10 00 00 24 	movl   $0x1024,0x1024
 b66:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b69:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b6b:	c7 05 28 10 00 00 00 	movl   $0x0,0x1028
 b72:	00 00 00 
    if(p->s.size >= nunits){
 b75:	e9 36 ff ff ff       	jmp    ab0 <malloc+0x30>
 b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b80:	8b 0a                	mov    (%edx),%ecx
 b82:	89 08                	mov    %ecx,(%eax)
 b84:	eb b1                	jmp    b37 <malloc+0xb7>
