/**
 * Created by Xiaozhong on 2018/11/6.
 * Copyright (c) 2018/11/6 Xiaozhong. All rights reserved.
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    /**
     * 思路：
     * 将输入内容按照字符串类型读入，判断是否小于INT类型的最大值，不是的话就直接相加
     * 是的话就一位一位相加然后最后累加起来装入int类型组成的数组中
     */
    string int1, int2;
    cout << "Input the number:" << endl;
    cin >> int1 >> int2;
    if (int1.length() < 10) {   //假设两个字符串长度相等
        cout << stoi(int1) + stoi(int2) << endl;
    }
    short cy = 0;
    auto *result = new short[int1.length()+1];
    for (int i = int1.length()-1; i >= 0; --i) {
        short result_temp = (int1[i] + int2[i] - 96) + cy;
        cy = result_temp / 10;
        result[i+1] = result_temp % 10;
    }
    if (cy!=0) {
        result[0] = cy;
    }
    for (int j = 0; j < int1.length()+1; ++j) {
        cout << result[j];
    }
    delete[] result;
    return 0;
}
