// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract Vauchers is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private _idCounter;
    Counters.Counter private _idVaucherCounter;

    constructor() ERC721("EventVoucher", "EV") {}

    struct VaucherInformation {
        string Name;
        string Description;
        string Date;
        string closeDate;
        string Insign;
    }

    struct VaucherInit {
        string Name;
        string Description;
        string closeDate;
        string Insign;
    }

    mapping(uint256 => VaucherInformation) public VaucherOwners;
    mapping(uint256 => VaucherInit) public VaucherInfo;

    function mint(uint256 _id, string memory _date) public {
        uint256 current = _idCounter.current();
        VaucherOwners[current] = converVaucherType(_id, _date);
        _safeMint(msg.sender, current);
        _idCounter.increment();
    }

    function createVaucher(
        string memory _name,
        string memory _description,
        string memory _closeDate,
        string memory _insign
    ) public returns( string memory,uint256 ) {
        uint256 current = _idVaucherCounter.current();
        VaucherInfo[current] = VaucherInit({
            Name: _name,
            Description: _description,
            closeDate: _closeDate,
            Insign: _insign
        });
        _idCounter.increment();
        console.log(current);
        return ("Vaucher created", current);
    }

    function converVaucherType(uint256 _id, string memory _date)
        internal
        view
        returns (VaucherInformation memory _vaucher)
    {
        VaucherInit memory _vaucherBase = VaucherInfo[_id];

        VaucherInformation memory _vaucherReturn;

        _vaucherReturn.Name = _vaucherBase.Name;
        _vaucherReturn.Description = _vaucherBase.Description;
        _vaucherReturn.Date = _date;
        _vaucherReturn.closeDate = _vaucherBase.closeDate;
        _vaucherReturn.Insign = _vaucherBase.Insign;

        return (_vaucherReturn);
    }

    function getVaucherInfo(uint256 _id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            VaucherOwners[_id].Name,
            VaucherOwners[_id].Description,
            VaucherOwners[_id].Date,
            VaucherOwners[_id].closeDate,
            VaucherOwners[_id].Insign
        );
    }
}
