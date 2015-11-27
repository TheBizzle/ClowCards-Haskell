/* global exports */
"use strict";

// module IndexOps

exports.addRow =
  function(f) { // Remove this, eventually
    return function(nameInput) {
    return function(playerNums) {
      return function(adderTable) {
        return function() {
          nameInput.toggleClass("glowing-border", false);
          var name = nameInput.val();
          if (name.length !== 0) {
            if (playerNums.length < 10) { // `maxPlayerCount`
              nameInput.val("");
            }
          }
          else {
            nameInput.setClass("glowing-border", true);
          }
        };
      };
    };
  };
  };

exports.alert =
  function(msg) {
    return function() {
      window.alert(msg);
      return {};
    };
  };

exports.onEnter =
  function(f) {
    return function(event) {
      return function() {
        var value = event.keyCode || event.which;
        if (value === 13) { f(); }
      };
    };
  };

exports.handleNumPickerKey =
  function(f) {
    return function(event) {
      return function() {
        exports.onEnter(f)(event)();
      };
    };
  };

exports.handleRowKey =
  function(f) {
    return function(event) {
      return function() {
        exports.onEnter(f)(event)();
      };
    };
  };
