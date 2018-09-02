pragma solidity ^0.4.24;
import "./Utils/Proxy.sol";

contract CampaignData is ProxyData {

    address public requesterAddress;
    string public requesterName;
    address public producerAddress ;
    string public producerName;
    uint public productionReadyTime;
    address public delivererAddress;
    string public delivererName;
    uint public deliveryPickTime;
    uint public quantity;  
    string public zipcode ;
    string public locationAddr;
    uint public date ;
    string public description ; 
    string public images ; 
    uint public campaignIndex;

}

contract FoodForAllCampaignProxy is Proxy, CampaignData{
// constructor of foo
    constructor (
        address _masterContractAddr, 
        address _requesterAddress,
        string _requesterName, 
        uint _quantity, 
        uint _date, 
        string _zipcode, 
        string _locationAddr,
        uint _campaingIndex
    )
        public Proxy (_masterContractAddr)
    {
        requesterAddress = _requesterAddress;
        requesterName = _requesterName;
        quantity = _quantity;
        zipcode = _zipcode;
        locationAddr = _locationAddr;
        date = _date;
        campaignIndex = _campaingIndex;
 
    }
}

contract FoodForAllCampaign is CampaignData {

    // --- functions ---------
    function contributeByProduceFood (string _producerName) public {
        producerAddress = msg.sender; 
        producerName = _producerName;
    }

    function contributeByDeliverFood (string _deivererName ) public {
        delivererAddress = msg.sender;
        delivererName = _deivererName; 
    }
}

