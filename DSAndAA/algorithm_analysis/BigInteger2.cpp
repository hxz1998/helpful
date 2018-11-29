/**
 * Created by Xiaozhong on 2018/11/20.
 * Copyright (c) 2018/11/20 Xiaozhong. All rights reserved.
 */

#include "BigInteger2.h"

char *BigInteger2::add(BigInteger2 bigInteger) {
    int temp_result = 0;
    int length = bigInteger._data->get_size();
    _result = new char[length + 2];
    _length = length+1;
    for (int i = _length; i > 0; --i) {
        temp_result = bigInteger._data->pop_back() + _data->pop_back() + _cy;
        _result[i] = temp_result % 10 + 48;
        _cy = temp_result / 10;
    }
    if (_cy != 48) {
        _result[0] = _cy + 48;
    }
    return _result;
}
