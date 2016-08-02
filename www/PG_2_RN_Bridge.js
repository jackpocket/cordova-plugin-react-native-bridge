// TODO: add active status. don't let it be invoked twice!
// TODO: So far I only solved half of the data binding problem:
//      send props up to bottom (from Native to ReactNative)
//     The other hald is updating the parent(native) component via callbacks
//     For this I would need `native modules`. See:
//      https://facebook.github.io/react-native/docs/communication-ios.html#properties
//      https://facebook.github.io/react-native/docs/native-modules-ios.html#native-modules
//      https://facebook.github.io/react-native/docs/native-components-ios.html#native-ui-components 

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