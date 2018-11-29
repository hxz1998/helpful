/**
 * Created by Xiaozhong on 2018/11/20.
 * Copyright (c) 2018/11/20 Xiaozhong. All rights reserved.
 */

#include "array_list.h"
#include <iostream>
#include <cstring>

array_list::array_list(const std::string init_data) {
    int size = init_data.length();
    _data = new char[size];
    _size = size - 1;
    _capacity = size;
    for (int i = 0; i < size; ++i) {
        _data[i] = init_data[i];
    }
}

int array_list::pop_back() {
    return _data[_size--] - 48;
}

void array_list::push_back(char elem) {
    char *temp_data = nullptr;
    if (_size + 1 > _capacity * 2 / 3) {
        _multiple++;
        temp_data = new char[_multiple * _default_size];
        _capacity = _multiple * _default_size;
        for (int i = 0; i <= _size; ++i) {
            temp_data[i] = _data[i];
        }
        delete[] _data;
        _data = temp_data;
    }
    _data[++_size] = elem;
}
