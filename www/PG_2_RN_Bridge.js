var exec = require('cordova/exec');

exports.coolMethod = function(arg0, success, error) {
    exec(success, error, "PG_2_RN_Bridge", "invokeAction", [arg0]);
};
