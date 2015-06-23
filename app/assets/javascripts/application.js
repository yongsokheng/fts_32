// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.countdown
//= require_tree .
//= require bootstrap

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".form-group").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function ready(){
  $(".checkbox").on("change",function(){
    $(".checkbox").not(this).prop("checked", false)
  });

  $("#clock").countdown({
    until: $("#duration").val(),
    format: "HMS",
    onExpiry: function(){
      alert("Your exam is time out. We are going to submit your test automatically");
      $(".btn-submit").trigger("click");
      $(".btn-submit").hidden();
    }
  });
}

function radio_click(){
  $(".radio-btn").click(function(){
    $("#frm-status").submit();
  });
}

$(document).ready(ready);
$(document).ready(radio_click);
$(document).on("page:load", ready);
$(document).on("page:load", radio_click);
$(document).on("page:update", ready);
