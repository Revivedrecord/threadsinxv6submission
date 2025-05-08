#include "types.h"
#include "stat.h"
#include "user.h"

lock_t lock;
int counter = 0;

void thread_function(void *arg1, void *arg2) {
  int i;
  int thread_id = *(int*)arg1;
  int iterations = *(int*)arg2;
  
  printf(1, "Thread %d: Starting (addr of counter: 0x%x)\n", thread_id, &counter);
  
  for(i = 0; i < iterations; i++) {
    lock_acquire(&lock);
    counter++;
    printf(1, "Thread %d: counter = %d\n", thread_id, counter);
    lock_release(&lock);
    
    // Shorter delay to prevent getting stuck
    int j;
    for(j = 0; j < 10000; j++);
  }
  
  printf(1, "Thread %d: Exiting\n", thread_id);
  exit();
}

int main(int argc, char *argv[]) {
  int num_threads = 5;
  int iterations = 3;
  int i, pid;
  int thread_ids[10];
  
  // Initialize lock
  lock_init(&lock);
  printf(1, "Lock initialized at address: 0x%x\n", &lock);
  
  printf(1, "Starting %d threads, each doing %d iterations\n", num_threads, iterations);
  
  // Create threads
  for(i = 0; i < num_threads; i++) {
    thread_ids[i] = i;
    printf(1, "Creating thread %d, thread_ids[%d] = %d\n", i, i, thread_ids[i]);
    pid = thread_create(thread_function, &thread_ids[i], &iterations);
    if(pid < 0) {
      printf(1, "Error creating thread %d\n", i);
    } else if(pid > 0) {
      printf(1, "Created thread %d with PID %d\n", i, pid);
    }
    
    // Small delay between thread creation
    int j;
    for(j = 0; j < 1000; j++);
  }
  
  // Wait for all threads to complete
  for(i = 0; i < num_threads; i++) {
    printf(1, "Waiting for thread %d\n", i);
    pid = thread_join();
    printf(1, "Joined thread with PID %d\n", pid);
  }
  
  printf(1, "All threads complete. Final counter value: %d\n", counter);
  printf(1, "Expected counter value: %d\n", num_threads * iterations);
  
  exit();
}