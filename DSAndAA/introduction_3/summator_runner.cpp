/**
 * Created by Xiaozhong on 2018/11/12.
 * Copyright (c) 2018/11/12 Xiaozhong. All rights reserved.
 */

#include <string>
#include <iostream>
#include "BigInteger.h"

using namespace std;

int main() {
    string data1, data2;
    cin >> data1 >> data2;
    BigInteger bigInteger1(data1);
    BigInteger bigInteger2(data2);
    char * result = bigInteger1.add(bigInteger2);
    for (int i = 0; i < bigInteger1.get_length()+1; ++i) {
        cout << result[i];
    }
}

