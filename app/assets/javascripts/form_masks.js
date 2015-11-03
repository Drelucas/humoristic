$(document).ready(function(){
  $('.ls-mask-date').mask('00/00/0000');
  $('.ls-mask-time').mask('00:00:00');
  $('.ls-mask-date_time').mask('00/00/0000 00:00:00');
  $('.ls-mask-cep').mask('00000-000');
  $('.ls-mask-phone-extension').mask('0000');
  $('.ls-mask-cpf').mask('000.000.000-00');
  $('.ls-mask-cnpj').mask('00.000.000/0000-00');
  $('.ls-mask-money').mask('#.##0,00');
  $('.ls-mask-money2').mask('000.000.000.000.000,00', {reverse: true});
  $('.ls-mask-number').mask('#.##0');
  $('.ls-mask-percent').mask('##0,00%');

  $('.ls-mask-phone').maskPhone();

  var SPMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  spOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(SPMaskBehavior.apply({}, arguments), options);
      }
  };

});

$.fn.extend({
    //Helper Function for Caret positioning
    caret: function(begin, end) {
      if (this.length == 0) return;
      if (typeof begin == 'number') {
        end = (typeof end == 'number') ? end : begin;
        return this.each(function() {
          if (this.setSelectionRange) {
            this.focus();
            this.setSelectionRange(begin, end);
          } else if (this.createTextRange) {
            var range = this.createTextRange();
            range.collapse(true);
            range.moveEnd('character', end);
            range.moveStart('character', begin);
            range.select();
          }
        });
      } else {
        if (this[0].setSelectionRange) {
          begin = this[0].selectionStart;
          end = this[0].selectionEnd;
        } else if (document.selection && document.selection.createRange) {
          var range = document.selection.createRange();
          begin = 0 - range.duplicate().moveStart('character', -100000);
          end = begin + range.text.length;
        }
        return { begin: begin, end: end };
      }
    }
});

$.fn.maskPhone= function (_options) {
  var defaults = {
    value: "",
    isInput: true,
    intervalMask: null,
    enable: true,

    keyup: function (event) {
      clearTimeout(options.intervalMask);
      _caret = $(this).caret().end;

      if(event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 16 || event.keyCode == 8 || event.keyCode == 46) {
        if(event.keyCode == 8)
          if($(this).caret().end == 14)
            options.mask($(this));
        return false;
      }

      options.mask($(this), _caret);
    },

    blur: function(){
      options.mask($(this));
    },

    mask: function(e, _caret){
      if(options.value != "")
        _value = options.value;
      else if(options.isInput)
        _value = e.val();
      else
        _value = e.text();

      _value = _value.replace(/\D/g, "").substr(0,11);

      if(_caret != undefined) {
        options.intervalMask = setTimeout(function(){
          _trace = /(\d{4})(\d)/;

          if(_value.length > 10)
            _trace = /(\d{5})(\d)/;

          _value = _value.replace(/^(\d\d)(\d)/g, "($1) $2");

          if(_value.length < 8)
            _caret =_caret + 3;

          _value = _value.replace(_trace, "$1-$2");

          if(_value.length == 11)
            _caret =_caret + 1;

          if(_value.length == 12)
            _caret =_caret + 1;

            e.val(_value).caret(_caret, _caret);
        }, 10);
      } else {
        _trace = /(\d{4})(\d)/;

        if(_value.length > 10)
          _trace = /(\d{5})(\d)/;

        _value = _value.replace(/^(\d\d)(\d)/g, "($1) $2");
        _value = _value.replace(_trace, "$1-$2");

        if(options.value != "")
          return _value;
        else if(options.isInput)
          e.val(_value);
        else
          e.text(_value);
      }
    }
  };

  var options = $.extend(defaults, _options);

  if(options.value != ""){
    return options.mask(options.value);
  } else {
    return this.each(function () {
      if(options.isInput){
        if(options.enable) {
          $(this).on({
            keyup: options.keyup,
            blur: options.blur
          }).attr('maxlength', '15');

          options.mask($(this));
        } else {
          $(this).off().removeAttr('maxlength');
        }
      } else {
        options.mask($(this));
      }
    });
  }
};
