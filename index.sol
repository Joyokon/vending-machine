contract vendingMachine{

    //Declare a state variable for the contract
    address public owner;
    mapping(address => uint) public Burgarbalance;

    // when vendingMachine is deployed;
    //set the deploying address as the owner of the  contract
    // set the deployed Burgarbalance to 90

    constructor () payable public{
        owner = msg.sender;
        
    }
    //create a function to allow the owner to increase the smart contract's burgarbalance
    function increase(uint _amount) public payable{
       require (owner == msg.sender,  "only the owner can increase");
       Burgarbalance[address(this)] += _amount;
    }
    //to check balance 
    function checkbalance() external view returns (uint) {
        return address(this).balance;
}
    //allow anyone to purchase burgar..
    function purchase(uint _amount) public payable{
        require(msg.value >=_amount,  'you must pay at least 2 eth per burgar');
        require (Burgarbalance[address(this)] >= _amount, 'not enough to complete this purchase');
    }
}
