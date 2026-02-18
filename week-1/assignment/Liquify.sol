// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquifyToken {
    string private _name = "LiquifyToken";
    string private _symbol = "LQF";
    uint8 private _decimals = 18;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        _totalSupply = initialSupply * (10 ** uint256(_decimals));
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {

        uint256 currentAllowance = _allowances[from][msg.sender];
        
        require(currentAllowance >= amount, "Insufficient allowance");
        
        _approve(from, msg.sender, currentAllowance - amount);
        
        _transfer(from, to, amount);
        
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal {
        
        require(from != address(0), "Invalid from address");
        
        require(to != address(0), "Invalid to address");
        
        require(_balances[from] >= amount, "Insufficient balance");
        
        _balances[from] -= amount;
        
        _balances[to] += amount;
        
        emit Transfer(from, to, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        
        require(owner != address(0), "Invalid owner");
        
        require(spender != address(0), "Invalid spender");
        
        _allowances[owner][spender] = amount;
        
        emit Approval(owner, spender, amount);
    }

    function _mint(address to, uint256 amount) internal {
        
        require(to != address(0), "Invalid address");
        
        _totalSupply += amount;
        
        _balances[to] += amount;
        
        emit Transfer(address(0), to, amount);
    }

    function _burn(address account, uint256 amount) internal {
        
        require(account != address(0), "Invalid address");
        
        require(_balances[account] >= amount, "Insufficient balance");
        
        _balances[account] -= amount;
        
        _totalSupply -= amount;
        
        emit Transfer(account, address(0), amount);
    }
}