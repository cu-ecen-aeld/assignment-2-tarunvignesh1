#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <filename> <text_to_write>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *filename = argv[1];
    const char *text_to_write = argv[2];

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file %s for writing.", filename);
        perror("Error");
        return EXIT_FAILURE;
    }

    fprintf(file, "%s\n", text_to_write);
    fclose(file);

    // Log to syslog
    openlog("writer", LOG_PID, LOG_USER);
    syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", text_to_write, filename);
    closelog();

    return EXIT_SUCCESS;
}

