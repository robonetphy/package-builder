#include "mul_num.h"

MUL::MUL(int x, int y)
{
    gx = x;
    gy = y;
}

int MUL::getSum()
{
    return gx * gy;
}