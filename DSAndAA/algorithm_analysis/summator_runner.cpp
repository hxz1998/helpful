/**
 * Created by Xiaozhong on 2018/11/20.
 * Copyright (c) 2018/11/20 Xiaozhong. All rights reserved.
 */
#include <string>
#include <iostream>
#include "BigInteger2.h"


using namespace std;

int main() {
    string data, data2;
    cin >> data >> data2;
    BigInteger2 bigInteger2(data);
    BigInteger2 bigInteger21(data2);
    char * result = bigInteger2.add(bigInteger21);
    for (int i = 0; i < bigInteger2.get_length()+1; ++i) {
        cout << result[i];
    }
}
