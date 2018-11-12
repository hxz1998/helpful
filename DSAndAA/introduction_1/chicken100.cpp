/**
 * Created by Xiaozhong on 2018/11/2.
 * Copyright (c) 2018/11/2 Xiaozhong. All rights reserved.
 */

#include <iostream>

using namespace std;

int main() {
    int count = 0;  //存下来符合要求的方案数量
    for (int i = 0; i <= 33; ++i) {  //母鸡购买个数
        for (int j = 0; j <= 100; ++j) { //公鸡购买个数
            for (int k = 0; k <= 100; ++k) { //小鸡购买个数
                if ((k + j + i == 100) && (2*i + 1*j + 0.5*k == 100)) {
                    cout << "母鸡买" << i << "只, 公鸡买" << j << "只, 小鸡买" << k << "只" << endl;
                    count++;
                }
            }
        }
    }

    cout << "共计" << count << "种解决方案" << endl;
}
