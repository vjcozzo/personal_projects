#include <stdio.h>
#include <stdlib.h>

void mergesort (int size, int *total_arr, int init, int end, int *result);
void merge (int *half1, int size1, int *half2, int size2, int *result);

int main (int argc, char **argv) {
    int ind, n, *a = NULL, *r = NULL;
    if (argc < 2) {
        printf ("Please enter the number of values in the array: ");
        scanf ("%d", &n);
        printf ("\n");

        a = malloc (n*sizeof(int));
        for (ind = 0; ind < n; ind ++) {
            scanf ("%d", (a+ind)); 
        }

    } else {
        int tmp;

        n = atoi (argv[1]);
        tmp = n + 2;
        if (tmp != (argc)) {
            printf("ERR - array size appears inconsistent.\n\n%d does not match the given %d.\n", (argc - 2), n);
            return -1;
        }

        a = malloc (n*sizeof(int));

        for (ind = 2; ind < tmp; ind ++) {
            a[ind - 2] = atoi(argv[ind]);
        }
    }
    r = malloc (n*sizeof(int));
    for (ind = 0; ind < n; ind ++) {
        *(r + ind) = a[ind];
    }
    printf("Size = %d\n", n);
    mergesort (n, a, 0, n-1, r);
    printf ("Sorted array: [");
    for (ind = 0; ind < n-1; ind ++) {
        printf ("%d, ", *(r+ind));
    }
    printf ("%d]\n", *(r+n-1));
    free (a);
    free (r);
    return 0;
}

void mergesort (int n, int *arr, int p, int q, int *result) {
    if (q == (p + 1)) {
        merge ((arr + p), 1, (arr + p + 1), 1, (result+p));
    } else if (q > p) {
        int boundary_size = ((q - p + 1)/2);
        int ind;
        mergesort (n, arr, p, p + boundary_size - 1, result);
        mergesort (n, arr, p + boundary_size, q, result);
        merge (result + p, boundary_size, result+boundary_size+p, boundary_size, result + p);
    }
}

/* Notes to self---
 * one reason why this isn't working could be that 
 * I am actually in fact MODIFYING THE SAME ARRAY,
 * which trying to generate a NEW array from itself.
 * This array is called "result" 
 * but it is also read by the name of a1 and a2, in the merge function
 * Solution: dynamically allocate a new array in the mergesort() function
 * and pass this NEW array as the final parameter of the merge() fct call. */
void merge (int *a1, int s1, int *a2, int s2, int *res) {
    int *new = malloc ((s1 + s2) * sizeof(int));
    int i = 0, j = 0, ind;
    while ((i < s1) && (j < s2)) {
        if (a1[i] < a2[j]) {
            new[i + j] = a1[i];
            i ++;
        } else {
            new[i + j] = a2[j];
            j ++;
        }
    }

    if ((i == s1) && (j == s2)) {
        /* nothing left to merge */
        for (ind = 0; ind < (s1 + s2); ind ++) {
            res[ind] = new[ind];
        }
        return;
    } else if (i == s1) {
        for (ind = j; ind < s2; ind ++) {
            new[i + ind] = a2[ind];
        }
    } else if (j == s2) /* AND i < s1 */ {
        for (ind = i; ind < s1; ind ++) {
            new[j + ind] = a1[ind];
        }
    }
    for (ind = 0; (ind < (s1 + s2)); ind ++) {
        res[ind] = new[ind];
    }
    free (new);
}
