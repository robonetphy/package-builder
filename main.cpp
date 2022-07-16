#include "add_num.h"
#include "sub_num.h"
#include "mul_num.h"
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    A2DD a(1, 2);
    MUL b(1, 2);
    SUB c(2, 1);
    int res = a.getSum();
    int res1 = b.getSum();
    int res2 = c.getSum();
    cout << res << endl;
    cout << res1 << endl;
    cout << res2 << endl;
    return 0;
}