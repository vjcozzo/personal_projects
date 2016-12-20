#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
/* #include <stderr.h> */

/* 
    Adapted from the C Networking Guide by Mr Brain Hall
    http://beej.us/guide/bgnet/output/html/multipage/syscalls.html

*/

int  main (int argc, char **argv) {
    int rstatus;
    struct addrinfo standard;
    struct addrinfo *result, *iterator;
    char ipstr[INET6_ADDRSTRLEN];

    if (argc != 2) {
        fprintf (stderr, "usage: showip hostname\n");
        return -1;
    }
    memset (&standard, 0, sizeof (standard));
    standard.ai_family = AF_UNSPEC; /* unspecified type, i.e. IPv4 or IPv6 */
    standard.ai_socktype = SOCK_STREAM; /* TCP Stream socket */

    rstatus = getaddrinfo (argv[1], NULL, &standard, &result);
    if (rstatus != 0) {
        fprintf (stderr, "getaddrinfo error: %s\n", gai_strerror (rstatus));
        return -2;
    }

    printf ("IP addresses for %s:\n\n", argv[1]);

    iterator = result;
    while (iterator != NULL) {
        void *addr;
        char *ipvers;

        if (iterator->ai_family == AF_INET) { /* IPv4 */
            struct sockaddr_in *ipv4 = (struct sockaddr_in *) (iterator->ai_addr);
            addr = &(ipv4->sin_addr);
            ipvers = "IPv4";
        } else {
            struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *) (iterator->ai_addr);
            addr = &(ipv6->sin6_addr);
            ipvers = "IPv6";
        }

        inet_ntop (iterator->ai_family, addr, ipstr, sizeof(ipstr));
        printf ("\t%s: %s\n", ipvers, ipstr);
        iterator = iterator->ai_next;
    }

    freeaddrinfo (result);
    return 0;
}
