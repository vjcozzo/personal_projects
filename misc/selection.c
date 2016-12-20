#include <stdio.h>
#include <stdlib.h>

int selection (int size, int *total_arr, int init, int end, int kth_smallest);
int partition (int *a, int size);

int main (int argc, char **argv) {
    int answer, ind, n, kth, *a = NULL;
    if (argc < 2) {
        printf ("Please enter the number of values in the array: ");
        scanf ("%d", &n);
        printf ("\n");
        printf ("Please enter the value of k, the kth smallest element being desired: ");
        scanf ("%d", &kth);
        printf ("\n");

        a = malloc (n*sizeof(int));
        for (ind = 0; ind < n; ind ++) {
            scanf ("%d", (a+ind)); 
        }
    } else {
        int tmp;

        n = atoi (argv[2]);
        kth = atoi (argv[1]);
        tmp = n + 3;
        if (tmp != (argc)) {
            printf("ERR - array size appears inconsistent.\n\n%d does not match the given %d.\n", (argc - 2), n);
            return -1;
        }

        a = malloc (n*sizeof(int));

        for (ind = 2; ind < tmp; ind ++) {
            a[ind - 2] = atoi(argv[ind]);
        }
    }
    printf("Size = %d\n", n);
    answer = selection (n, a, 0, n-1, kth-1);
    printf ("Resulting array: [");
    for (ind = 0; ind < (n-1); ind ++) {
        printf ("%d, ", *(a+ind));
    }
    printf ("%d]\n", *(a+n-1));
    free (a);
    printf ("in which the %dth-smallest element appears to be %d\n\n", kth, answer);
    return 0;
}

int selection (int n, int *ary, int p, int q, int k) {
    int boundary = (p + partition (ary+p, (q-p+1)));
    if (boundary > k) {
        return selection (n, ary, p, (boundary-1), k);
    } else if (boundary < k) {
        return selection (n, ary, (boundary+1), q, k);
    } else {
        return ary[boundary];
    }
}

int partition (int *arr, int arr_size) {
    int pivot = arr[arr_size - 1];
    int i=-1, j, tmp;
    for (j = 0; j < (arr_size-1); j ++) {
        if (arr[j] < pivot) {
            i ++;
            tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }
    i ++;
    arr[arr_size - 1] = arr[i];
    arr[i] = pivot;
    return i;
}
