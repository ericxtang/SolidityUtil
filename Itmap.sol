library Itmap {
    struct AddressUintMapEntry {
        uint value;
        uint idx;
    }
    
    struct AddressUintMap {
        mapping(address=>AddressUintMapEntry) entries;
        address[] keys;
    }
    
    function set(AddressUintMap storage self, address k, uint v) internal {
        var entry = self.entries[k];
        if(entry.idx == 0) {
            entry.idx = self.keys.length + 1;
            self.keys.push(k);
        }
        entry.value = v;
    }
    
    function get(AddressUintMap storage self, address k) internal returns (uint) {
        return self.entries[k].value;
    }
    
    function contains(AddressUintMap storage self, address k) internal returns (bool) {
        return self.entries[k].idx > 0;
    }
    
    function remove(AddressUintMap storage self, address k) internal {
        var entry = self.entries[k];
        if(entry.idx > 0) {
            var otherkey = self.keys[self.keys.length - 1];
            self.keys[entry.idx - 1] = otherkey;
            self.keys.length -= 1;
            
            self.entries[otherkey].idx = entry.idx;
            entry.idx = 0;
            entry.value = 0;
        }
    }

}
