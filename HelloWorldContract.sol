// SPDX-License-Identifier: MIT

// 与npm版本规范相同, 既不允许低于0.7.0 版本的编译器编译， 也不允许高于（包含） 0.8.0 版本的编译器编译
pragma solidity ^0.7.0;

contract HelloWorldContract {

    function helloWorld() external pure returns(string memory) {
        return "hello world!";
    }
}