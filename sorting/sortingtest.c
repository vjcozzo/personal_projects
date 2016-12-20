/* Vincent Cozzo
 * A set of algorithms to test each possible poermutation of numbers in
 * an array and make sure that the sorting algorithm works.
 * This could be used in order to test heapsort
 * (or any other sorting algorithm for that matter)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sortingtest.h"

/* Precondition: rem_list is a valid int array of size >= rem_size.
 * 
 * Will return the index of the element of rem_list that is minimum of the first "rem_size"
 * elements of the list, but that is not less than "notlessthan" */
int get_min_index(int *rem_list, int rem_size, int notlessthan) {
    int index=0, min_ind=0;
    int min = (-1);
    if ((*rem_list) > notlessthan) {
        min = *(rem_list);
    } else {
        while ((min < 0) && (index < rem_size)) {
            if (rem_list[index] > notlessthan) {
                min = rem_list[index];
                min_ind=index;
            }
            index ++;
        }
        if (min < 0) {
            return -1;
        }
    }
    for (; index < rem_size; index ++) {
        int next_item = rem_list[index];
        if ((next_item > notlessthan) && (next_item < min)) {
            min = next_item;
            min_ind = index;
        }
    }
/*    printf("\tMinimum index returned %d\n", min_ind);*/
    return min_ind;
}

int get_max_index(int *rem_list, int rem_size) {
    int index=0, max_ind=0;
    int max = *rem_list;
    for (; index < rem_size; index ++) {
        if (rem_list[index] > max) {
            max = rem_list[index];
            max_ind = index;
        }
    }
    return max_ind;
}

void print_arr(int *list, int size) {
    int index=0;
    int adjusted_size = size-1;
    printf("[");
    while (index < adjusted_size) {
        printf("%d, ", list[index]);
        index++;
    }
    printf("%d]\n", list[index]);
}

int evaluate_arr(int *list, int size, int verbose) {
    int index=0;
    int adjusted_size = size-1;
    if (verbose) {
        printf("[");
        while (index < adjusted_size) {
            printf("%d, ", list[index]);
            if (list[index] > list[index+1]) {
                return 1;
            }
            index++;
        }
        printf("%d]\nTEST PASSES\n", list[index]);
    } else {
        while (index < adjusted_size) {
            if (list[index] > list[index+1]) {
                return 1;
            }
            index++;
        }
    }
    return 0;
}

/* This is a recursive function;
 * "list" will be a "moving pointer" that will run through the array.
 * totalsize will be an integer representing the total fixed size of
 *  the array...
 * this will allow the function to be able to calculate its head (first element)
 * at any time, regardless of how many recursive iterations have been called.
 */
int test_all_permutation(int *list, int size, int *listcopy, int totalsize,
                         int (*sort)(int *a, int s)) {
    int result;
    if (size == 2) {
        int tmp = list[0];
        list[0] = list[1];
        list[1] = tmp;

        tmp = listcopy[0];
        listcopy[0] = listcopy[1];
        listcopy[1] = tmp;

        result = evaluate_arr(list-totalsize+2, totalsize, 1);
        if (result) {
            printf("Error identified. Exiting.\n");
            return result;
        }
    } else {
        int rest_max, tmp, origin;
        test_all_permutation(list+1, size-1, listcopy, totalsize, sort);
        /* Now make the next incremental adjustment,
         * by swapping the next-to-left integer with the max of
         * the rightmost elements.
         * */
        rest_max = get_max_index(list, size);
        if (rest_max > 0) {
            tmp = list[0];
            list[0] = list[rest_max];
            list[rest_max] = list[0];

            origin = totalsize-size;
            tmp = listcopy[origin];
            listcopy[origin] = listcopy[rest_max];
            listcopy[rest_max] = tmp;
            result = evaluate_arr(list-totalsize+size, totalsize, 1);
            if (result) {
                printf("Error identified. Exiting.\n");
                return -1;
            }
        }
    }
    return 0;
}

void gen_permutation(int *list, int size, int totalsize) {
    if (size == 2) {
        int tmp = list[0];
        list[0] = list[1];
        list[1] = tmp;

        print_arr(list-totalsize+2, totalsize);
    } else {
        int rest_min, tmp;
        gen_permutation(list+1, size-1, totalsize);
        /* Now make the next incremental adjustment,
         * by swapping the next-to-left integer with the max of
         * the rightmost elements.
         * */
        rest_min = get_min_index(list+1, size-1, list[0]);
        while (rest_min > (-1)) {
            rest_min++;
            tmp = list[0];
            list[0] = list[rest_min];
            list[rest_min] = tmp;
            print_arr(list-totalsize+size, totalsize);
            gen_permutation(list+1, size-1, totalsize);
            rest_min = get_min_index(list+1, size-1, list[0]);
        }
    }
}
