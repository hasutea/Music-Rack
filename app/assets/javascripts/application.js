// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks


//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs

//= require cocoon

//= require select2
//= require bootstrap-sprockets
//= require nested_form_fields
//= require_tree .



$(document).ready(function(){

$('.js-searchable').select2({
  theme: "bootstrap",
});

})



$(document).ready(function() {

// clickイベントが発生した要素からclosest()で遡ってtrオブジェクトを取得し、そのtrオブジェクトをclone()で複製した上で、自身のひとつ下にinsertAfter()で追加
  $('.add').click(function() {
   let $row = $(this).closest("tr");
   let $newRow = $row.clone(true);
   $newRow.insertAfter($row);
  });

  // clickイベントが発生した要素からclosest()で遡ってtrオブジェクトを取得し、そのtrオブジェクトをremove()で削除
  $('.remove').click(function() {
   let row = $(this).closest("tr").remove();
   $(row).remove();
  });

});

(function() {
  $("#js-button a").on("click,function"(){
    $("footer, html").animate({
      scrollTop:0
  }, 800);
    return false;
  });
});

$(document).ready(function(){
  $('#select').rowClick();
});