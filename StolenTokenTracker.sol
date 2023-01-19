pragma solidity ^0.8.0;

contract StolenTokenTracker {
    // Mapping to store the blacklisted addresses
    mapping(address => bool) public blacklisted;

    // Event to emit when an address is blacklisted
    event Blacklisted(address indexed thief);

    // Function to blacklist an address
    function blacklist(address thief) public {
        // Ensure the caller is the owner of the contract
        require(msg.sender == owner);
        // Blacklist the address
        blacklisted[thief] = true;
        emit Blacklisted(thief);
    }

    // Function to check if an address is blacklisted
    function isBlacklisted(address addr) public view returns (bool) {
        return blacklisted[addr];
    }

    // Function to unblacklist an address
    function unblacklist(address thief) public {
        // Ensure the caller is the owner of the contract
        require(msg.sender == owner);
        // Unblacklist the address
        blacklisted[thief] = false;
    }

    // Function to freeze the stolen tokens
    function freezeTokens(address thief) public {
        // Ensure the address is blacklisted
        require(blacklisted[thief]);
        // Freeze the tokens
        // (This function would typically call a function of the ERC20 token contract to freeze the thief's tokens, but since it is out of scope of smart contract development, it is not implemented here)
    }
}
