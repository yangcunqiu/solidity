// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract ArrayTest {
    // storage数组
    // 动态数组
    uint[] public numbers;
    // 固定长度数组
    address[10] private users;
    uint8 users_count;

    mapping(int => int) numberMap;

    function addNumber(uint8 _number) external {
        numbers.push(_number);
    }

    function addUser(address _user) external{
        require(users_count < 10, "number of users is limited to 10");
        users[users_count] = _user;
        users_count++;
    }

    function createMemoryArray() external view {
        uint256[20] memory numbers2;
        numbers2[0] = 1;
        numbers2[1] = 2;

        uint256 user_num = numbers2.length;

        address[] memory users2 = new address[](user_num);
        users2[0] = msg.sender;
        // memory数组没有push和pop方法
        // users2.push(msg.sender);

    }

    // 结构体
    struct Donation {
        uint256 value;
        uint256 date;
    }

    // 顺序初始化
    Donation donation1 = Donation(msg.value, block.timestamp);

    // 初始化
    Donation donation = Donation({
        value: msg.value,
        date: block.timestamp
    });

    // 枚举
    enum Color {green, blue, red}
    Color defaultColor = Color.green;


    // 常量
    uint256 constant maxParticipants = 10;
    // 不可变状态变量
    uint256 immutable maxBalance;

    // 构造器赋值
    constructor(uint256 _maxBlance) {
        maxBalance = _maxBlance;
    }
}
   