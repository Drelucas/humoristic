var mood = mood || {}

mood.selects = (function() {
  'use script';

  function init() {
    selectOptions();
  }

  function selectOptions() {
    $(".select2").select2({
      minimumInputLength: 3,
      allowClear: true
    });
  }

  return {
    init: init
  }
}());

$(document).ready(mood.selects.init);
