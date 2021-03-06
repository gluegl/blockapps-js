contract Crowdsource {
    uint numContribs;

    struct ContribInfo {
        string name;
        uint totalPayments;
    }
    mapping (address => ContribInfo) contribInfo;
    address[] contributors;

    function Crowdsource() {
        contributors.length = 0;
    }

    function contribute(string name) returns (bool) {
        if (msg.value == 0) {
            return false;
        }

        var contributor = contribInfo[msg.sender];
        if (contributor.totalPayments == 0) {
            contributors.push(msg.sender);
            contributor.name = name;
        }
        contributor.totalPayments += msg.value;
        contribInfo[msg.sender] = contributor;
        ++numContribs;
        return true;
    }
}
