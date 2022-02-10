#include <stdio.h>

int x = 2
int y = 2

int main() {
    if (x != y) {
        x++;
        y--;
    }
    else {
        x--;
        y++;
    }

    return x + y;
}

