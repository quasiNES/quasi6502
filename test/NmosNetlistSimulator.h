#pragma once
#include "NmosNetlistTopology.h"

class NmosNetlistSimulator {
public:

    explicit NmosNetlistSimulator(NmosNetlistTopology topology) {

    }

    bool get(int nodeIdx) const {
        return nodes[nodeIdx].value;
    }

    void set(int nodeIdx, bool newValue) {
        if (nodes[nodeIdx].value == newValue)
            return;

        nodes[nodeIdx].value = newValue;
        nodes[nodeIdx].needsUpdate = true;
        nodesToUpdate.push_back(nodeIdx);
    }

    void update() {
        while (!nodesToUpdate.empty()) {
            updateOneNode();    
        }
    }

private:
    void void updateOneNode(workspace) {
        auto node = nodesToUpdate.first();
        
        auto& group = workspace;
        collectGroup(node, group, value);

        nodesToUpdate.remove(node)
        for (n: group) {
            for (t: n.getNodeNonDrivers()) {
                if (t.value != value) {
                    t.value = value;
                    nodesToUpdate.add(t.c1, t.c2);
                }
            }
            
        }

    }

    void collectGroup(std::vector<>) {
        for (const auto& t: _netlist.getNodeDrivers(node)) {
            if (t.isOpen)
                group.add(t.getOther)
        }

        if () {

        }
    }

    NmosNetlist _netlist;
    std::vector<bool> _nodeValues;
    std::vector<bool> _transistorValues;
};
