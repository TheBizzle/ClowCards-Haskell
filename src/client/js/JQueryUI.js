/* global exports */
"use strict";

// module JQueryUI

exports.accordion =
  function(config) {
    return function(ob) {
      return function() {
        return ob.accordion(config);
      };
    };
  };

exports.button =
  function(ob) {
    return function() {
      return ob.button();
    };
  };

exports.buttonset =
  function(ob) {
    return function() {
      return ob.buttonset();
    };
  };


exports.change =
  function(ob) {
    return function() {
      return ob.change();
    };
  };

exports.click =
  function(f) {
    return function(ob) {
      return function() {
        return ob.click(function () { return f(jQuery(this))(); });
      };
    };
  };

exports.each =
  function(f) {
    return function(ob) {
      return function() {
        return ob.each(function() { return f(jQuery(this))(); });
      };
    };
  };

exports.flipChecked =
  function(ob) {
    return function () {
      ob[0].checked = !ob[0].checked;
    };
  };

exports.load =
  function(f) {
    return function (ob) {
      return function () {
        return ob.load(function() { return f(jQuery(this)); });
      };
    };
  };

exports.refreshButton =
  function(ob) {
    return function() {
      ob.button('refresh');
    };
  };


exports.replaceWith =
  function(elem) {
    return function (ob) {
      return function () {
        return ob.replaceWith(elem);
      };
    };
  };

exports.siblings =
  function(filterStr) {
    return function(ob) {
      return function() {
        return ob.siblings(filterStr);
      };
    };
  };

exports.spinner =
  function(ob) {
    return function() {
      return ob.spinner();
    };
  };

exports.tab =
  function(ob) {
    return function() {
      return ob.tabs();
    };
  };

exports.val =
  function(newVal) {
    return function(ob) {
      return function() {
        return ob.val(newVal);
      };
    };
  };

exports.attrStr =
  function(str) {
    return function(ob) {
      return function () {
        return ob.attr(str);
      };
    };
  };

exports.children =
  function(str) {
    return function(ob) {
      return function () {
        return ob.children(str);
      };
    };
  };

exports.mapLabelsToPairs =
  function(ob) {
    return function() {
      var arr = ob.map(function() {
        var elem      = jQuery(this);
        var id        = elem.attr("for");
        var name      = elem.text();
        var isEnabled = $("#" + id)[0].checked;
        return PS.Data_Tuple.create(name)(isEnabled);
      }).get();
      return arr;
    };
  };
