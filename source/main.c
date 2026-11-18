#include <stdio.h>
#include <stdlib.h>
#include <xenos/xenos.h>
#include <console/console.h>

int main(void)
{
    xenos_init(VIDEO_MODE_AUTO);
    console_init();
    printf("\n  Link List - Xbox 360 homebrew test\n\n");
    printf("  Build OK. The toolchain works.\n");
    while (1) { }
    return 0;
}
