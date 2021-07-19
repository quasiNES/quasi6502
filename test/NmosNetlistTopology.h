#pragma once

struct NmosNetlistT {
    unsigned ctrl;
    unsigned terminal1;
    unsigned terminal2;
};

class NmosNetlistTopology {

    class Node {
        const Tran[]& connectedByGates() const;
        auto connectedByTerminals() const;
    private:
        _topo;
        _nodeIdx;
    };

    class Tran {
        const Node& gate() const { return _topo.getNode(_tranIdx * 3); }
        const Node& terminal1() const {}
        const Node& terminal2() const {}
    private:
        _topo;
        _tranIdx;
    };

    explicit NmosNetlistTopology(std::vector<NmosNetlistTransistor> transistors) {
        // find number of nodes
    }

    const Node& getNode(std::size_t idx) const {
        
    }

    const Tran& getTran(std::size_t idx) const {

    }
};
