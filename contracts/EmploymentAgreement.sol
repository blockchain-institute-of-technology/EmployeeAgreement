pragma solidity ^0.4.23;//please import oraclizeAPI_pre0.4.sol when solidity < 0.4.0
import "./OracalizeI.sol";
contract EmploymentAgreement is usingOraclize {

  uint public ETH_USD;
  uint public GOLD_USD;
  
  bytes32 public oraclize_USD_ID;
  bytes32 public oraclize_GOLD_ID;
  
  uint public lastEthUpdateTime;
  uint public lastGoldUpdateTime;

  function constructor() payable{ 
    updatePrices();
  }

  function updatePrices() payable {
    getETHUSD();
   // getGOLDUSD();
  }

  function getETHUSD() internal {
    oraclize_USD_ID = oraclize_query("URL", "json(https://api.kraken.com/0/public/Ticker?pair=ETHUSD).result.XETHZUSD.c.0");
  }
  function getGOLDUSD() internal {
    oraclize_GOLD_ID = oraclize_query("URL", "html(https://www.bullionvault.com/gold-price-chart.do).xpath(.//*[@class='row']/div[2]/div[1]/div/div/table/tbody/tr[3]/td[1]/span");
  }

  function __callback(bytes32 _oraclizeID, string _result) {
    if(msg.sender != oraclize_cbAddress()) throw;
    if( _oraclizeID == oraclize_USD_ID){
        ETH_USD = parseInt(_result);
        lastEthUpdateTime = now;
    }
    else{
        GOLD_USD = parseInt(_result);
        lastGoldUpdateTime = now;
        //GOLD_USD = 5;
    }
  }

}