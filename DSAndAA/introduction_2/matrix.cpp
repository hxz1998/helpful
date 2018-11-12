/**
 * Created by Xiaozhong on 2018/11/6.
 * Copyright (c) 2018/11/6 Xiaozhong. All rights reserved.
 */

#include <iostream>

using namespace std;

int main() {
    int size;
    cout << "The matrix size? ";
    cin >> size;
    int data = size * size;
    /**
     * 动态分配数组空间
     */
    int **matrix = new int *[size * size];
    for (int i = 0; i < size; i++) {
        matrix[i] = new int[size];
    }

    /**
     * row_count: 行输出数目
     * column_count: 列输出数目
     * x_index: 矩阵的行下标
     * y_index: 矩阵的列下标
     * row_right: 行是否向右输出
     * column_down: 列是否向下输出
     */
    int row_count = size, column_count = row_count - 1;
    int x_index = -1, y_index = -1;
    bool row_right = true, column_down = true;
    while (data > 0) {
        if (row_right) {
            /**
             * 行列下标校准
             * 下面每个if语句块中开始的下标自增或自减都是用来校准 :)
             */
            x_index++;
            y_index++;
            for (int i = 0; i < row_count; ++i) {
                matrix[x_index][y_index] = data--;
                y_index++;
            }
            row_right = !row_right;
            row_count--;
            y_index--;
        } else {
            x_index--;
            y_index--;
            for (int i = 0; i < row_count; ++i) {
                matrix[x_index][y_index] = data--;
                y_index--;
            }
            row_right = !row_right;
            row_count--;
        }
        if (column_down) {
            x_index++;
            for (int i = 0; i < column_count; ++i) {
                matrix[x_index][y_index] = data--;
                x_index++;
            }
            column_down = !column_down;
            column_count--;
        } else {
            x_index--;
            y_index++;
            for (int i = 0; i < column_count; ++i) {
                matrix[x_index][y_index] = data--;
                x_index--;
            }
            column_down = !column_down;
            column_count--;
        }
    }

    /**
     * 循环输出数组内容
     */
    for (int j = 0; j < size; ++j) {
        for (int i = 0; i < size; ++i) {
            cout << matrix[j][i] << " ";
        }
        cout << endl;
    }

    delete[] matrix; //防止内存泄漏
    return 0;
}
