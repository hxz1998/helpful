/**
 * Created by Xiaozhong on 2018/11/17.
 * Copyright (c) 2018/11/17 Xiaozhong. All rights reserved.
 * 大整数相加
 *  使用字符串来当作数据进行相加，外加辅助进位数cy来完成进位操作。
 */

#ifndef DSANDAA_BIGINTEGER_H
#define DSANDAA_BIGINTEGER_H

#include <string>

using namespace std;

class BigInteger {
private:

    /**
     * 默认读取内容大小
     */
    int _default_size = 0;

    /**
     * 数据域
     */
    char *_data;

    /**
     * 两数相加后的结果
     */
    char *_add_result;

    /**
     * 读取数据长度
     */
    int _length = 0;
public:
    /**
     * 默认的构造函数
     */
    BigInteger();

    /**
     * 使用string类型来初始化对象
     */
    BigInteger(string);

    /**
     * 使用指针方式初始化对象
     */
    BigInteger(char *);

    /**
     * 析构函数，释放申请的数据域空间
     */
    ~BigInteger();

    /**
     * 两数进行相加
     * @return 相加后的结果指针
     */
    char *add(BigInteger);

    /**
     * 获取数据域长度
     * @return _length
     */
    int get_length();
};


#endif //DSANDAA_BIGINTEGER_H
