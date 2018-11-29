"""
  Created by Xiaozhong on 2018/11/8.
  Copyright (c) 2018/11/8 Xiaozhong. All rights reserved.

  简单的计算代码行数的小程序
"""

from pathlib import Path

path = Path()
count = 0


for item in path.iterdir():
    if item.is_file() and item.match("*.cpp") or item.match("*.h"):
        print(item)
        with item.open(encoding="utf-8") as file_obj:
            while file_obj.readline():
                count = count + 1
    elif item.is_dir():
        pass

print(count)
