/* global exports */
"use strict";

// module Element

exports.genPlayerRow =
  function(name) {
    return function(id) {
      return function(imgID) {
        return function(onclick) {
          return function() {
            var imgQuery  = "<img id='" + imgID + "' src='/static/images/index/priority/simple-x.png' class='player-button'>";
            var elemQuery = "<table id='" + id + "' class='player-table round-bordered card-row has-headroom'>\
                                <tr>\
                                  <td class='player-content'>\
                                    <table>\
                                      <tr>\
                                        <td>\
                                          <span class='player-name'>" + name + "</span>\
                                        </td>\
                                        <td>\
                                          <div class='placeholder'>\
                                        </td>\
                                      </tr>\
                                    </table>\
                                  </td>\
                                  <td>\
                                    <div class='row-divider'></div>\
                                  </td>\
                                  <td class='row-content'>\
                                    <table>\
                                      <tr class='row-content-row'>\
                                      </tr>\
                                    </table>\
                                  </td>\
                                </tr>\
                              </table>";
            var img = jQuery(imgQuery).click(onclick);
            jQuery(elemQuery).find(".placeholder").replaceWith(img);
            return elem;
          };
        };
      };
    };
  };

