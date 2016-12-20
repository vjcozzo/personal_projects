#include <stdio.h>
#include <stdlib.h>
#include ""

/* A program to read from files and test the expected_value program */
int main (int argc, char **argv) {
    if (argc != 2) {
        printf ("The expected value program takes one more argument: the file you wish to be analyzed.\n");
        printf ("Expected use:\n>expected_value my_data.txt\n\n");
        return 1;
    } else {
        const char *j = " > .length";
        char *file_name = argv[1];
        char *command;
        int s = strlen(file_name);
        command = (char *) malloc (s + 17);
        command[0] = 'w';
        command[1] = 'c';
        command[2] = ' ';
        command[3] = '-';
        command[4] = 'w';
        command[5] = ' ';
        strcpy (command+6, file_name);
        strcpy (command+s+6, j);
        system (command);
        FILE *len_stored = fopen (".length", "r");

        while () {
            
        }

        fclose (len_stored);
        return 0;
    }
}
