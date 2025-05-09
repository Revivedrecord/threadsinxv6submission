# Kernel Threads Implementation in xv6

## Overview
This repository contains an implementation of kernel threads for the xv6 operating system, a simple Unix-like teaching OS developed at MIT. The implementation adds support for multiple threads within a single process address space, complete with synchronization primitives.

## Features Implemented

- **Kernel-level thread support** with two new system calls:
  - `clone()`: Creates a new kernel thread that shares the calling process's address space
  - `join()`: Waits for a thread to exit and returns its stack location

- **User-level thread library** with the following functions:
  - `thread_create()`: Creates a new thread with a dedicated stack
  - `thread_join()`: Waits for a thread to exit and cleans up resources
  - `lock_init()`, `lock_acquire()`, `lock_release()`: Ticket lock implementation for thread synchronization

## Technical Details

### System Calls

#### `clone()`
```c
int clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack)
```
- Creates a new kernel thread that shares the calling process's address space
- File descriptors are copied as in `fork()`
- Uses the provided `stack` as the user stack
- Passes two arguments (`arg1` and `arg2`) to the function
- Uses a fake return PC (`0xffffffff`)
- New thread starts executing at the address specified by `fcn`
- Returns the PID of the new thread to the parent

#### `join()`
```c
int join(void **stack)
```
- Waits for a child thread that shares the address space with the calling process
- Returns the PID of the waited-for child or -1 if none
- The stack pointer is stored in the provided parameter for later deallocation

### Thread Library Functions

#### Thread Creation and Management
```c
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
int thread_join(void)
```
- `thread_create()` allocates a page-aligned stack and calls `clone()`
- `thread_join()` calls the underlying system call and frees the stack

#### Synchronization
```c
void lock_init(lock_t *lock)
void lock_acquire(lock_t *lock)
void lock_release(lock_t *lock)
```
- Implements a ticket lock mechanism using atomic operations
- Ensures fair ordering of threads waiting for a lock (FIFO)
- Uses the x86 `xaddl` instruction for atomic fetch-and-add operations

## Modified Files

- **proc.h**: Added threadstack field to the proc structure
- **defs.h**: Added function declarations for clone() and join()
- **syscall.h**: Defined new system call numbers
- **syscall.c**: Updated syscalls array with new system calls
- **sysproc.c**: Implemented system call handlers
- **proc.c**: Implemented clone() and join() functions, modified wait()
- **user.h**: Added lock_t structure and thread library function prototypes
- **usys.S**: Added entries for new system calls
- **ulib.c**: Implemented user-level thread library functions
- **testthreads.c**: Created a test program to verify thread functionality
- **Makefile**: Added testthreads to the build

## How to Build and Run

1. Save the modified files locally 

2. Head to the xv6 (x86) repository and open up codespaces. Replace the contents of the aforementioned files names with the modified contents 

3. Install make and qemu. Eventually make sure to use qemu nox (install qemu using sudo apt install -y qemu qemu-system-x86)


4. Inside xv6, run the test program
```
$ testthreads
```


## References

- [xv6 GitHub Repository](https://github.com/mit-pdos/xv6-public)
- [Operating Systems: Three Easy Pieces](https://pages.cs.wisc.edu/~remzi/OSTEP/)
