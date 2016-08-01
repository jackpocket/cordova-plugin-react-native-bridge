var exec = require('cordova/exec');

exports.invokeAction = function(arg0, success, error) {
    // validate arg0 to the type
    exec(success, error, "PG_2_RN_Bridge", "invokeAction", [arg0]);
};

exports.revokeAction = function(arg0, success, error) {
    exec(success, error, "PG_2_RN_Bridge", "revokeAction", []);
};