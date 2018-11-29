/**
 * Created by Xiaozhong on 2018/11/20.
 * Copyright (c) 2018/11/20 Xiaozhong. All rights reserved.
 *
 * 大整数类，用来相加大型整数
 */

#ifndef DSANDAA_BIGINTEGER_H
#define DSANDAA_BIGINTEGER_H

#include "array_list.h"
#include <string>

class BigInteger2 {
private:
    array_list *_data;
    int _cy = 0;
    char *_result;
    int _length;
public:
    BigInteger2(std::string init_data) {
        _data = new array_list(init_data);
    }

    char *add(BigInteger2 bigInteger);

    ~BigInteger2() {
        delete _data;
        delete[] _result;
    }

    int get_length() {
        return _length;
    }
};


#endif //DSANDAA_BIGINTEGER_H
