$(document).ready(function(){
  window.addEventListener('message', function(event) {
      if (event.data.action == 'open') {
        console.log(event.data.action);
        $('#blindfold').show();
      } else if (event.data.action == 'close') {
        console.log(event.data.action);
        $('#blindfold').hide();
      }
  });
});
