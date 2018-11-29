/**
 * Created by Xiaozhong on 2018/11/20.
 * Copyright (c) 2018/11/20 Xiaozhong. All rights reserved.
 *
 * 简单的ArrayList类，用于底层支持大整数相加
 */

#ifndef DSANDAA_ARRAY_LIST_H
#define DSANDAA_ARRAY_LIST_H

#include <iostream>
#include <string>

class array_list {
private:

    /**
     * 数据域
     */
    char *_data = nullptr;

    /**
     * 默认的数据域大小
     */
    const int _default_size = 8;

    /**
     * 指向最后一个的指针
     */
    int _size = 0;

    /**
     * 链表容量
     */
    int _capacity = 0;

    /**
     * 容量扩增倍数
     */
    int _multiple = 1;
public:
    array_list() {
        _data = new char[_multiple * _default_size];
        _capacity = _default_size;
    }

    array_list(int size) {
        if (size > 0) {
            _data = new char[size];
            _capacity = size;
        } else {
            std::cerr << "The size is illegal" << std::endl;
            _data = new char[_multiple * _default_size];
            _capacity = _multiple * _default_size;
        }
    }

    /**
     * 根据传入的字符串类型拷贝数据
     * @param init_data 待拷贝的数据内容
     */
    array_list(const std::string init_data);

    /**
     * 弹出 _size 指向的数据
     * @return _size 指向的数据
     */
    int pop_back();

    /**
     * 在末尾压入一个数据
     * @param elem 待压入的数据
     */
    void push_back(char elem);

    /**
     * 获取末尾的指针
     * @return 末尾指针
     */
    int get_size() {
        return _size;
    }

    /**
     * 获取容量信息
     * @return 容量信息
     */
    int get_capicity() {
        return _capacity;
    }

    /**
     * 获取指定位置的内容
     * @param index
     * @return
     */
    const char get(int index) {
        if (index >= 0 && index <= _size) {
            return _data[index];
        }
        return -1;
    }

    ~array_list() {
        delete[] _data;
    }
};


#endif //DSANDAA_ARRAY_LIST_H
