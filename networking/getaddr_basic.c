#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
/* #include <stderr.h> */

/* 
    Adapted from the C Networking Guide by Mr Brain Hall

*/

int  main (int argc, char **argv) {

    int returnstatus;
    struct addrinfo standard;
    struct addrinfo *servinfo;

    memset (&standard, 0, sizeof (standard));
    standard.ai_family = AF_UNSPEC; /* unspecified type, i.e. IPv4 or IPv6 */
    standard.ai_socktype = SOCK_STREAM; /* TCP Stream socket */
    standard.ai_flags = AI_PASSIVE;

    returnstatus = getaddrinfo (NULL, "3490", &standard, &servinfo);
    if (returnstatus != 0) {
        fprintf (stderr, "getaddrinfo error: %s\n", gai_strerror (returnstatus));
        exit(1);
    }

    

    freeaddrinfo (servinfo);
    return 0;
}
