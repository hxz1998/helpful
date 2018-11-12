/**
 * Created by Xiaozhong on 2018/11/2.
 * Copyright (c) 2018/11/2 Xiaozhong. All rights reserved.
 */

#ifndef DSANDAA_UTIL_H
#define DSANDAA_UTIL_H

#endif //DSANDAA_UTIL_H

#include <string>

using namespace std;

const char* std_convert(int input) {
    string result = to_string(input);
    return result.data();
}