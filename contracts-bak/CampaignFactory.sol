pragma solidity ^0.4.24; 

import "./Campaign.sol";

///@ Food for All campaign factory contract - creates food for all contract based on user demand
contract CampaignFactory {
    /*
     *  Events
     */
    event CampaignCreation(address indexed creator, string indexed zipcode,FoodForAllCampaign newCampaignProxyAddr, uint quantity );
    /*
     *  Storage
     */
    FoodForAllCampaign public foodForAllCampaignMasterCopy;
    address[] public deployedFoodCampaigns;
    /*
     *  Public functions
     */
    constructor(FoodForAllCampaign _campaignMasterCopy)
        public
    {
        foodForAllCampaignMasterCopy = _campaignMasterCopy;
    }

    function foodForAllCreateCampaign(string _requesterName, uint _quantity, uint _date, string _zipcode, string _locationAddr) 
        public returns (FoodForAllCampaign newCampaignProxyAddr) {
        
        newCampaignProxyAddr = FoodForAllCampaign(
            new FoodForAllCampaignProxy (
            foodForAllCampaignMasterCopy, _requesterName,  _quantity,  _date,  _zipcode, _locationAddr,deployedFoodCampaigns.length+1 ));
        deployedFoodCampaigns.push(newCampaignProxyAddr);
        emit CampaignCreation(msg.sender, _zipcode, newCampaignProxyAddr, _quantity);
    }

    function getDeployedFoodCampaigns() public view returns (address[]) {
        return deployedFoodCampaigns;
    }

    function getTotalDeployedFoodCampaigns ()  public view returns (uint totalDeployedCampaigns ) {
        totalDeployedCampaigns = deployedFoodCampaigns.length;
    }

}
