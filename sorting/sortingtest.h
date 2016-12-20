
int get_max_index(int *lst, int len);
int get_min_index(int *lst, int len, int notlessthan);
void print_arr(int *list, int size);
void gen_permutation(int *list, int size, int totalsize);
int test_all_permutation(int *list, int size, int *listcopy, int totalsize, int (*sort)(int *a, int s));
/*void print_all_permutations(int *list, int size);    */
int evaluate_arr(int *lst, int len, int verbose);

