#include<stdio.h>
#include<tensorflow/c/c_api.h>

int main() {
  char* null_po = NULL;
  printf("Hello from TensorFlow C library version %s\n", TF_Version());
  printf("%d", *null_po);
  return 0;
}
