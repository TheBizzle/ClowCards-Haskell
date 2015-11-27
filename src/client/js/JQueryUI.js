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

exports.change1 =
  function(f) {
    return function(ob) {
      return function() {
        return ob.change(function() { return f(jQuery(this))(); });
      };
    };
  };

exports.click =
  function(f) {
    return function () {
      return ob.click(function(x) { return f(jQuery(this))(x); });
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

exports.insertBefore =
  function(elem) {
    return function(ob) {
      return function () {
        return ob.insertBefore(elem);
      };
    };
  };

exports.focus =
  function focus(f) {
    return function () {
      return ob.focus(function(x) { return f(jQuery(this))(x); });
    };
  };

exports.keypress =
  function keypress(f) {
    return function () {
      return ob.keypress(function(x) { return f(jQuery(this))(x); });
    };
  };

exports.keyup =
  function keyup(f) {
    return function () {
      return ob.keyup(function(x) { return f(jQuery(this))(x); });
    };
  };

exports.unfocus =
  function unfocus(f) {
    return function () {
      return ob.unfocus(function(x) { return f(jQuery(this))(x); });
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
        return new require('Data.Tuple').Tuple(name, isEnabled);
      }).get();
      return arr;
    };
  };
