pragma solidity ^0.4.24;

// title Proxied - indicates that a contract will be proxied. Also defines storage requirements for Proxy.
// auther Sijesh - <sijesh.poovalapil at gmail.com>
// ref : https://blog.gnosis.pm/solidity-delegateproxy-contracts-e09957d0f201

// Proxied -  Generic prixy contract. This is for to keep Proxy-firendly storage layout.

contract ProxyData {
    // holds the master copy address
    address public masterCopy;
}

// title Proxy - Generic proxy contract to execute proxy for any master contract. 
contract Proxy is ProxyData {
    // dev Constructor function sets address of master copy contract.
    // param _masterCopy Master copy address.
    constructor(address _masterCopy)
        public
    {
        require(_masterCopy != 0);
        masterCopy = _masterCopy;
    }

    // dev Fallback function forwards all transactions and returns all received return data.
    function ()
        external
        payable
    {
        
        address _masterCopy = masterCopy;
        // Assembly to act proxy . Execute the logic in the master contract with supplied data in the proxy
        // Using returndatacopy and returndatasize recommended in EIP 211. 
        assembly {
            calldatacopy(0, 0, calldatasize())
            let success := delegatecall(not(0), _masterCopy, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch success
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }

}