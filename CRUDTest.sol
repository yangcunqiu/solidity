// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract CRUDTest {
    struct User{
        uint id;
        string name;
    }

    User[] public users;
    uint public nextId;

    // 添加user
    function add(string memory name) public {
        // 创建User实例
        User memory user = User({
            id: nextId,
            name: name
        });
        // 将user添加到数组
        users.push(user);

        // id自增
        nextId++;
    }

    // 根据id获取name
    function read(uint id) public view returns(string memory) {
        uint i = getUserIndexById(id);
        return users[i].name;
    }

    // 根据id修改user
    function update(uint id, string memory name) public {
        uint i = getUserIndexById(id);
        users[i].name = name;
    }

    // 根据id删除user
    function destory(uint id) public {
        uint i = getUserIndexById(id);
        delete users[i];
    }

    function getUserIndexById(uint id) private view returns(uint256) {
         for (uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                return i;
            }
        }
        revert("User not found");
    }
}