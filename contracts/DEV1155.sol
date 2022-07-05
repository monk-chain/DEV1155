// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract DEV1155 is ERC1155, ERC1155Supply, ERC1155Burnable, Ownable, Pausable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenCounter;

    string public name = "DEV1155";
    string public symbol = "DEV";

    mapping(string => address) nfiOwners;

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function setURI(string memory newuri) external onlyOwner {
        _setURI(newuri);
    }

    // コントラクトデプロイ時に１度だけ呼ばれる
    constructor() ERC1155("https://clonex-assets.rtfkt.com/") {
        // // erc 20
        // _mint(msg.sender, 20, 10000, "");
        // _mint(msg.sender, 200, 1000000, "");

        // erc 721
        _mint(msg.sender, 1, 1, "");
        _mint(msg.sender, 2, 1, "");
        _mint(msg.sender, 3, 1, "");
        _mint(msg.sender, 4, 1, "");
        _mint(msg.sender, 5, 1, "");
        _mint(msg.sender, 6, 1, "");
        _mint(msg.sender, 7, 1, "");
        _mint(msg.sender, 8, 1, "");
        _mint(msg.sender, 9, 1, "");
        _mint(msg.sender, 10, 1, "");
        _mint(msg.sender, 721, 1, "");
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /**
     * @notice returns the metadata uri for a given id
     *
     * @param _id the card id to return metadata for
     */
    function uri(uint256 _id) public view override returns (string memory) {
        require(exists(_id), "URI: nonexistent token");
        return string(abi.encodePacked(super.uri(_id), Strings.toString(_id)));
    }
}
