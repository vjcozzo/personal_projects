#include <stdio.h>
#include <stdlib.h>
#include "heapsort.h"

void  heapify (int n, int *ary) {
    int index = n-1;
    int right, left, parent;
    if (index % 2 == 0) {
        right = index;
        left = (index-1);
    } else {
        left = index;
        right = index;
    }
    parent = (index - 1) / 2;
    do {
        if (ary[right] > ary[left]) {
            if (ary[right] > ary[parent]) {
                /* first, the immediate swap between the parent 
                and its right child */
                int tmp = ary[parent];
                ary[parent] = ary[right];
                ary[right] = tmp;

                /* Now, we need to 'sift down'
                the previous parent
                in order to maintain the heap invariant. */
                sift_down (n, ary, right);
            }
        } else {
            if (ary[left] > ary[parent]) {
                int tmp = ary[parent];
                ary[parent] = ary[left];
                ary[left] = tmp;
                sift_down (n, ary, left);
            }
        }
        index -= 2;
        parent = (index - 1) / 2;
        right = (2*parent) + 2;
        left = (right - 1);
    } while (index > 0);
}

void heapsort (int n, int *ary) {
    int  t = n-1;
    while (t > 0) {
        int tmp = ary[0];
        ary[0] = ary[t];
        ary[t] = tmp;

        sift_down (t, ary, 0);
/*
        while (right_child < n) {
            if (ary[right_child] > ary[left_child]) {
                if (ary[right_child] > ary[ind]) {
                    tmp = ary[ind];
                    ary[ind] = ary[right_child];
                    ary[right_child] = tmp;
                    ind = right_child;
                    right_child = 2*ind + 2;
                    left_child = right_child - 1;
                }
            } else {
                if (ary[left_child] > ary[ind]) {
                    tmp = ary[ind];
                    ary[ind] = ary[left_child];
                    ary[left_child] = tmp;
                    ind = left_child;
                    right_child = 2*ind + 2;
                    left_child = right_child - 1;
                }
            }
            ind ++;
        }
        if (left_child < n) {
            if (ary[left_child] > ary[ind]) {
                tmp = ary[ind];
                ary[ind] = ary[left_child];
                ary[left_child] = tmp;
            }
        }
*/
        t --;
    }
}

void sift_down (int n, int *ary, int index_v) {
    int index = index_v;
    int right_child = 2*(index_v) + 2;
    int left_child = right_child - 1;
    int tmp;
    while (right_child < n) {
        if (ary[right_child] > ary[left_child]) {
            if (ary[right_child] > ary[index]) {
                tmp = ary[index];
                ary[index] = ary[right_child];
                ary[right_child] = tmp;
                index = right_child;
                right_child = 2*index + 2;
                left_child = right_child - 1;
            } else {
                right_child = n;
            }
        } else {
            if (ary[left_child] > ary[index]) {
                tmp = ary[index];
                ary[index] = ary[left_child];
                ary[left_child] = tmp;
                index = left_child;
                right_child = 2*index + 2;
                left_child = right_child - 1;
            } else {
                right_child = n;
            }
        }
    }
    if (left_child < n) {
        if (ary[left_child] > ary[index]) {
            tmp = ary[index];
            ary[index] = ary[left_child];
            ary[left_child] = tmp;
        }
    }
}
