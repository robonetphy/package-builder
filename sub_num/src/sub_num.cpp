#include "sub_num.h"

SUB::SUB(int x, int y)
{
    gx = x;
    gy = y;
}

int SUB::getSum()
{
    return gx - gy;
}