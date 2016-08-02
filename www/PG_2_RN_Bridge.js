var exec = require('cordova/exec');

exports.invokeAction = function (arg0, success, error) {
    // validate arg0 to the type
    exec(function () {
        console.log('PG_2_RN_Bridge.invokeAction() success', arguments);
        if (success) {
            success.apply(success, arguments);
        }
    }, function (e) {
        console.error('PG_2_RN_Bridge.invokeAction() error', arguments);
        if (error) {
            error.apply(success, arguments);
        }
    }, "PG_2_RN_Bridge", "invokeAction", [arg0]);

};

exports.revokeAction = function (arg0, success, error) {
    exec(function () {
        console.log('PG_2_RN_Bridge.revokeAction() success', arguments);
        if (success) {
            success.apply(success, arguments);
        }
    }, function (e) {
        console.error('PG_2_RN_Bridge.revokeAction() error', arguments);
        if (error) {
            error.apply(success, arguments);
        }
    }, "PG_2_RN_Bridge", "revokeAction", [null]);
};