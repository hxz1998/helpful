/**
 * Created by Xiaozhong on 2018/11/17.
 * Copyright (c) 2018/11/17 Xiaozhong. All rights reserved.
 */

#include <cstring>
#include "BigInteger.h"

BigInteger::BigInteger() {
    _data = new char[_default_size];
    _length = strlen(_data);
}

BigInteger::BigInteger(string data) {
    _data = const_cast<char *>(data.data());
    _length = strlen(_data);
}

BigInteger::BigInteger(char *data) {
    _data = data;
    _length = strlen(_data);
}

BigInteger::~BigInteger() {
    delete[] _data;
}

char *BigInteger::add(BigInteger bigInteger) {
    _add_result = new char[_length + 1];
    int cy = 0;
    for (int i = _length - 1; i >= 0; --i) {
        int temp_result = _data[i] + bigInteger._data[i] - 96 + cy;
        _add_result[i + 1] = temp_result % 10 + 48;
        cy = temp_result / 10;
    }
    if (cy != 0) {
        _add_result[0] = cy + 48;
    }
    return _add_result;
}

int BigInteger::get_length() {
    return _length;
}
