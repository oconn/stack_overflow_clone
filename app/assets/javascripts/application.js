// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

// CODE REVIEW: application javascript code should not live in this file.
// (See the comment about from Rails)
/*$(document).ready(function() {
  $('.add_comment').on('click', function(e) {
    e.preventDefault();
    var commentParentType = $(this).attr("href");
    alert('rawera')
    $.ajax({
        type: 'GET',
        url: 'comments/new',
        dataType: 'html',
        success: function(xhr, textStatus) {
            alert('awesome!!!');
        },
        error: function(xhr, textStatus, errorThrown) {
                        alert('something went wrong');
        }
      });
    });
});
*/
