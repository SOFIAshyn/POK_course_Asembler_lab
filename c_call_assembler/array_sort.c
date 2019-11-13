//
// Created by Sofiia Petryshyn on 12/11/2019.
//

#include <stdio.h>
extern void bubleSorting(long *arr, int n);

int main() {
    int N;

    printf("Enter size of array: ");
    scanf("%d", &N);

    long arr[N];

    printf("Enter %d elements in the array : ", N);
    for (int i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }

    bul

    printf("\nElements in array are: ");
    for (i = 0; i < N; i++) {
        printf("%d, ", arr[i]);
    }

    return 0;
}