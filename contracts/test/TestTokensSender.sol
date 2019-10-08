pragma solidity 0.5.8;

import "../interfaces/IERC777TokensSender.sol";
import { ERC1820Client } from "erc1820/contracts/ERC1820Client.sol";


contract TestTokensSender is ERC1820Client, IERC777TokensSender {

    function tokensToSend(
        address operator,
        address from,
        address to,
        uint amount,
        bytes memory userData,
        bytes memory operatorData
    )  // solhint-enable no-unused-vars
    public
    {
        if (userData[0] == 0x01) {
            revert("tokensToSend reverted");
        }
    }

    // solhint-disable-next-line no-unused-vars
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address addr) public view returns (bytes32) {
        return keccak256(abi.encodePacked("ERC1820_ACCEPT_MAGIC"));
    }
}
