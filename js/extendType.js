function extendType(x, y) {
    var pType = Object.getPrototypeOf(x);
    var yProps = getDescriptors(y);
    var qType = Object.create(pType, yProps);
    var xProps = getDescriptors(x);
    return Object.create(qType, xProps);    
}

function getDescriptors(x) {
    var result = {};
    Object.getOwnPropertyNames(x).map(function(p) {
        result[p] = Object.getOwnPropertyDescriptor(x,p);
    });
    return result;
}

module.exports = extendType;
