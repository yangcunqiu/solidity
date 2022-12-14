// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract ArrayContract {
    // 长度为2**20的定长数组
    uint[2**20] aLotOfIntegers;

    // 数组元素为 长度为2的定长数组 的动态数组 (T[k] 和 T[] 总是 T类型 的数组, 即使 T 是数组)
    bool[2][] pairsOfFlags;

    // newPairs 存储在 memory 中 (仅当它是公有的合约函数)
    function setAllFlagPairs(bool[2][] memory newPairs) public {
        // 向一个 storage 的数组赋值会对 newPairs 进行拷贝, 并替代整个 pairsOfFlag 数组
        pairsOfFlags = newPairs;
    }

    struct StructType {
        uint[] contents;
        uint moreInfo;
    }
    StructType s;

    function f(uint[] memory c) public {
        // 保存引用
        StructType storage g = s;

        // 同样改变了 s.moreInfo
        g.moreInfo = 2;

        // 进行了拷贝, 因为 g.contents 不是本地变量, 而是本地变量的成员
        g.contents = c;
    }

    function setFlagPair(uint index, bool flagA, bool flagB) public {
        pairsOfFlags[index][0] = flagA;
        pairsOfFlags[index][1] = flagB; 
    }

    function changeFlagArraySize(uint newSize) public {
        // 使用 push 和 pop 是更改数组长度的唯一方法
        if (newSize < pairsOfFlags.length) {
            while (pairsOfFlags.length > newSize) {
                pairsOfFlags.pop();
            }
        } else if (newSize > pairsOfFlags.length) {
            while (newSize > pairsOfFlags.length) {
                pairsOfFlags.push();
            }
        }
    }
}