Kernel Threads Implementation in xv6
Overview:
This repository contains an implementation of kernel threads for the xv6 operating system, a simple Unix-like teaching OS developed at MIT. The implementation adds support for multiple threads within a single process address space, complete with synchronization primitives.
Features Implemented

Kernel-level thread support with two new system calls:

clone(): Creates a new kernel thread that shares the calling process's address space
join(): Waits for a thread to exit and returns its stack location

User-level thread library with the following functions:

thread_create(): Creates a new thread with a dedicated stack
thread_join(): Waits for a thread to exit and cleans up resources
lock_init(), lock_acquire(), lock_release(): Ticket lock implementation for thread synchronization

System Calls
clone():
int clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack)
1) Creates a new kernel thread that shares the calling process's address space
2) File descriptors are copied as in fork()
3) Uses the provided stack as the user stack
4) Passes two arguments (arg1 and arg2) to the function
5) Uses a fake return PC (0xffffffff)
6) New thread starts executing at the address specified by fcn
7) Returns the PID of the new thread to the parent

join():
int join(void **stack)
1) Waits for a child thread that shares the address space with the calling process
2) Returns the PID of the waited-for child or -1 if none
3) The stack pointer is stored in the provided parameter for later deallocation

Thread Library Functions
Thread Creation and Management:
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
int thread_join(void)
1) thread_create() allocates a page-aligned stack and calls clone()
2) thread_join() calls the underlying system call and frees the stack

Synchronization:
void lock_init(lock_t *lock)
void lock_acquire(lock_t *lock)
void lock_release(lock_t *lock)
1) Implements a ticket lock mechanism using atomic operations
2) Ensures fair ordering of threads waiting for a lock (FIFO)
3) Uses the x86 xaddl instruction for atomic fetch-and-add operations

Modified Files:
proc.h: Added threadstack field to the proc structure
defs.h: Added function declarations for clone() and join()
syscall.h: Defined new system call numbers
syscall.c: Updated syscalls array with new system calls
sysproc.c: Implemented system call handlers
proc.c: Implemented clone() and join() functions, modified wait()
user.h: Added lock_t structure and thread library function prototypes
usys.S: Added entries for new system calls
ulib.c: Implemented user-level thread library functions
testthreads.c: Created a test program to verify thread functionality
Makefile: Added testthreads to the build

Instructions to run: Take said files and save them locally. Head to the https://github.com/mit-pdos/xv6-public repository and click on code and open up codespaces. 
Replace the contents of the aforementioned files in the xv6 repository. Make sure to setup make and qemu (sudo apt install -y make) (sudo apt install -y qemu qemu-system-x86). Then make clean, make, make qemu-nox. When the commandline appears type testthreads to run the testscript

Acknowledgments:
This implementation is based on the xv6 operating system developed at MIT for educational purposes. The implementation follows the guidelines provided in the OSTEP (Operating Systems: Three Easy Pieces) textbook

References: 
https://github.com/mit-pdos/xv6-public
https://pages.cs.wisc.edu/~remzi/OSTEP/
