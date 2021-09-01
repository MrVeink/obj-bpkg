//
//  main.m
//  obj-bpkg
//
//  Created by Joona Holkko.
//  Copyright © 2021 Joona Holkko & Breadtard. All rights reserved.
//

#import <Foundation/Foundation.h>

void banner(void) {
    printf("      ___.        __         ___.           __                  \n");
    printf("  ____\\_ |__     |__|        \\_ |__ ______ |  | __  ____      \n");
    printf(" /  _ \\| __ \\    |  |  ______ | __ \\\\____ \\|  |/ / / ___\\ \n");
    printf("(  <_> ) \\_\\ \\   |  | /_____/ | \\_\\ \\  |_> >    < / /_/  >\n");
    printf(" \\____/|___  /\\__|  |         |___  /   __/|__|_ \\\\___  /   \n");
    printf("           \\/\\______|             \\/|__|        \\/_____/    \n");
}
int main(int argc, char* argv[]) {
    
    char PKG_NAME[] = "INTERNAL_OBJBPKG_REPLACEMENT_STRING_HOPEFULLY_THIS_WORKS";
    char OBJBPKG_VER[] = "INTERNAL_OBJBPKG_VERSION";
    
    if (access("/usr/local/bin/7z", 0) == 0) {
        if (argc > 2) {
            printf("Error: Too many arguments. Do %s -h or --help for more info.\n", argv[0]);
            return 1;
        }
        else if (argc == 1) {
            printf("obj-bpkg - Self Installing 7Z Package in Objective-C\nUsage: %s [-h] [install]\nDo %s -h or --help for more info.\n", argv[0], argv[0]);
            return 2;
        }
        else {
            if (strcmp(argv[1], "-h") == 0) {
                printf("obj-bpkg - Self Installing 7Z Package\nUsage: %s [-h] [install]\n%s install - Installs the package to your system.\n%s -h - Shows this.\nThis file is both an executable and a 7z archive. This executable's purpose is to extract the archive and install it to your system.\n", argv[0], argv[0], argv[0]);
                return 3;
            }
            else if (strcmp(argv[1], "--help") == 0) {
                printf("obj-bpkg - Self Installing 7Z Package\nUsage: %s [-h] [install]\n%s install - Installs the package to your system.\n%s -h - Shows this.\nThis file is both an executable and a 7z archive. This executable's purpose is to extract the archive and install it to your system.\n", argv[0], argv[0], argv[0]);
                return 4;
            }
            else if (strcmp(argv[1], "install") == 0) {
                banner();
                printf("Installing package %s\nOBJBPKG archive version is %s\n", PKG_NAME, OBJBPKG_VER);
                char INTERNAL_7z_L[] = "/usr/bin/7z x ";
                strcat(INTERNAL_7z_L,argv[0]);
                system(INTERNAL_7z_L);
                return 5;
            }
            else {
                printf("Error: invalid argument. run %s -h or --help for more info.\n", argv[0]);
                return 6;
            }
        }
    } else {
        printf("Error: Valid 7z installation not found. Ensure that you have 7zip installed.\n");
        return 0;
    }
}
