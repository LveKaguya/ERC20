// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversitySE2321Token {
    string public name = "UniversitySE-2321Token"; 
    string public symbol = "UGT"; 
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    address public lastTransactionSender;
    address public lastTransactionReceiver;
    uint256 public lastTransactionTimestamp;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        totalSupply = 2000 * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Update transaction info
        lastTransactionSender = msg.sender;
        lastTransactionReceiver = _to;
        lastTransactionTimestamp = block.timestamp;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        // Update transaction info
        lastTransactionSender = _from;
        lastTransactionReceiver = _to;
        lastTransactionTimestamp = block.timestamp;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function getTransactionSender() public view returns (address) {
        return lastTransactionSender;
    }

    function getTransactionReceiver() public view returns (address) {
        return lastTransactionReceiver;
    }

    function getLatestTransactionTimestamp() public view returns (string memory) {
        return _convertTimestampToString(lastTransactionTimestamp);
    }

    function _convertTimestampToString(uint256 _timestamp) internal pure returns (string memory) {
        uint256 year = _getYear(_timestamp);
        uint256 month = _getMonth(_timestamp);
        uint256 day = _getDay(_timestamp);
        uint256 hour = (_timestamp % 86400) / 3600;
        uint256 minute = (_timestamp % 3600) / 60;
        uint256 second = _timestamp % 60;

        return string(
            abi.encodePacked(
                _uintToString(day), "/", _uintToString(month), "/", _uintToString(year), " ",
                _uintToString(hour), ":", _uintToString(minute), ":", _uintToString(second)
            )
        );
    }

    function _getYear(uint256 _timestamp) internal pure returns (uint256) {
        return 1970 + (_timestamp / 31556926); // Average seconds in a year (365.25 days)
    }

    function _getMonth(uint256 _timestamp) internal pure returns (uint256) {
        uint256 elapsedDays = _timestamp / 86400;
        return (elapsedDays % 365) / 30 + 1;
    }

    function _getDay(uint256 _timestamp) internal pure returns (uint256) {
        uint256 elapsedDays = _timestamp / 86400;
        return (elapsedDays % 30) + 1;
    }

    function _uintToString(uint256 _value) internal pure returns (string memory) {
        if (_value == 0) {
            return "0";
        }
        uint256 temp = _value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (_value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(_value % 10)));
            _value /= 10;
        }
        return string(buffer);
    }
}
