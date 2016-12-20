#include <stdio.h>
#include <stdlib.h>
#include "sortingtest.h"

int main(int argc, char** argv) {
    int length;

    if (argc == 2) {
        int /*res, */ind, *array;
        sscanf(argv[1], "%d", &length);
        array = (int *) malloc (sizeof(int)*length);
        for (ind=0; ind < length; ind ++) {
            array[ind] = ind+1;
        }
        print_arr(array, length);
        gen_permutation(array, length, length);
        free(array);
        array = NULL;
    } else {
        printf("Usage: gen_permutations <size of array>\n");
    }
    return 0;
}
