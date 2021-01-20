#include <stdio.h>

int main(void) {
    FILE *fp;

    fp = fopen("\\\\.\\globalroot\\device\\condrv\\kernelconnect", "w+");
    fprintf(fp, "this will never be reached as the PC crashed already...\n");
    fclose(fp);

    return -1;
}