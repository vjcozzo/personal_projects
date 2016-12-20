#include <stdio.h>
#include <stdint.h>
#include <time.h>

int main() {
    time_t now;
    now = time(NULL);
    printf("%ju", (uintmax_t) now);
    return 0;
}
