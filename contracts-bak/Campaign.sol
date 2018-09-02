pragma solidity ^0.4.24;
import "./Utils/Proxy.sol";

contract CampaignData is ProxyData {

    address requesterAddress;
    string requesterName;
    address producerAddress ;
    string producerName;
    uint productionReadyTime;
    address delivererAddress;
    string delivererName;
    uint deliveryPickTime;
    uint quantity;  
    string zipcode ;
    string locationAddr;
    uint date ;
    string description ; 
    string images ; 
    uint campaignIndex;

}

contract FoodForAllCampaignProxy is Proxy, CampaignData{
// constructor of foo
    constructor (
        address _masterContractAddr, 
        string _requesterName, 
        uint _quantity, 
        uint _date, 
        string _zipcode, 
        string _locationAddr,
        uint _campaingIndex
    )
        public Proxy (_masterContractAddr)
    {
        requesterAddress = msg.sender;
        requesterName = _requesterName;
        quantity = _quantity;
        zipcode = _zipcode;
        locationAddr = _locationAddr;
        date = _date;
        campaignIndex = _campaingIndex;
 
    }
}

contract FoodForAllCampaign is CampaignData {


    function contributeByProduceFood ( string _producerName) public {
        producerAddress = msg.sender; 
        producerName = _producerName;
    }

    function contributeByDeliverFood (string _deivererName ) public {
        delivererAddress = msg.sender;
        delivererName = _deivererName; 
    }


}
