//
// Created by Sofiia Petryshyn on 09/11/2019.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void func_sofiia_sort(int64_t *arr, int64_t n);

int main() {
    int64_t n;

    printf("Enter size of array: ");
    scanf("%lld", &n);

    int64_t arr[n];

    printf("Enter %d elements in the array : ", n - 1);
    for (int i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
    }

    func_sofiia_sort(arr, n);

    printf("\nElements in array are: ");
    for (int i = 0; i < n; i++) {
        printf("%lld, ", arr[i]);
    }

    return 0;
}