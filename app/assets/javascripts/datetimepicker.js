document.addEventListener('DOMContentLoaded', function() {
  var calendarIcon = document.querySelector('.datetimepicker-icon');
  var textInput = document.querySelector('.search-text');
  var dateInput = document.querySelector('.datetimepicker');
  var calendar = document.querySelector('.bootstrap-datetimepicker-widget');
  var form = document.querySelector('.search-form');
  
  $(dateInput).datetimepicker({
    format: 'YYYY-MM-DD',

  });

  $(calendarIcon).on('click', function() {
    textInput.style.display = 'none';
    dateInput.style.display = 'block';
    textInput.value = '';
    dateInput.focus();

    $(dateInput).on('dp.change', function(event) {
        if (event.date) {  // Check if a date was actually selected
          form.submit();
        }
      });
  });
  
  $(textInput).on('click', function() {
    textInput.style.display = 'block';
    dateInput.style.display = 'none';
    dateInput.value = '';
  });
  
  $(dateInput).on('click', function() {
    textInput.style.display = 'block';
    dateInput.style.display = 'none';
    calendar.style.display = 'none';
  });

  $(textInput).on('keydown', function(event) {
    if (event.key === 'Enter') {
      event.preventDefault(); 
      textInput.form.submit(); 
    }
  });

});
  