#include <stdio.h>
#include <cuda_runtime.h>

// __global__ indicates this function runs on the GPU.
__global__ void helloFromGPU() {
    if (threadIdx.x == 0) {
        printf("Hello from the GPU!\n");
    }
}

int main() {
    // Each block output printed and thread output prolly overlap
    helloFromGPU<<<2, 10>>>();

    // Synchronize to ensure the GPU finishes before exiting.
    cudaDeviceSynchronize();

    printf("Hello from the CPU!\n");
    return 0;
}