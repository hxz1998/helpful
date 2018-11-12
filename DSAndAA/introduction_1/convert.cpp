/**
 * Created by Xiaozhong on 2018/11/2.
 * Copyright (c) 2018/11/2 Xiaozhong. All rights reserved.
 */

#include <iostream>
#include <string>

using namespace std;

const char* std_convert(int input) {
    string result = to_string(input);
    return result.data();
}

int main() {
    int input;
    cout << "input a number:";
    cin >> input;
    cout << std_convert(input) << endl;
}