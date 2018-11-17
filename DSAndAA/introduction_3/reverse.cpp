/**
 * Created by Xiaozhong on 2018/11/17.
 * Copyright (c) 2018/11/17 Xiaozhong. All rights reserved.
 * 将非负整数逆序输出
 *  a. 递归方式
 *  b. 非递归方式
 */

#include <iostream>

using namespace std;

/**
 * 递归方式输出
 * @param data 递归输出的内容
 */
void recursion_print(int data) {
    cout << data % 10;
    if (data/10 != 0) {
        recursion_print(data/10);
    }
}

/**
 * 一般循环方式输出
 * @param data 要输出的数据
 */
void simple_print(int data) {
    while (data != 0) {
        cout << data % 10;
        data /= 10;
    }
}

int main() {
    recursion_print(1689);
    simple_print(1689);
}
