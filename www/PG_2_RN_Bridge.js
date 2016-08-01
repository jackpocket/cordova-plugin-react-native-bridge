var exec = require('cordova/exec');

exports.invokeAction = function(arg0, success, error) {
    exec(success, error, "PG_2_RN_Bridge", "invokeAction", [arg0]);
};

exports.revokeAction = function(arg0, success, error) {
    exec(success, error, "PG_2_RN_Bridge", "revokeAction", [arg0]);
};