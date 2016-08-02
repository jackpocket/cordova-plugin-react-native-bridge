# Phonegap to ReactNative Bridge

This plugin is intended to offer a bridge between Phonegap and React Native for those unfortunate developers
who cannot justify a complete rewrite, and thus have to take the slower path of incremental migration.

TODO:
- add active status flag on the js layer to not allow the RCTRootView to be initialized multiple times
- So far I only solved half of the data binding problem - send props up to bottom (from Native to ReactNative).
  The other half is updating the parent(native) component via callbacks
  For this I would need `native modules`.
    See:
      https://facebook.github.io/react-native/docs/communication-ios.html#properties
      https://facebook.github.io/react-native/docs/native-modules-ios.html#native-modules
      https://facebook.github.io/react-native/docs/native-components-ios.html#native-ui-components 
