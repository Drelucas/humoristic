module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)
  TYPES = { notice: :success, alert: :warning, error: :danger, information: :info }
  def flash_messages
    content_tag(:div) do
      flash.each do |type, message|
        type = TYPES[type.to_sym]
        next if !ALERT_TYPES.include?(type) || message.blank?
        Array(message).each do |msg|
          concat(build_tag_message_alert(msg, type))
        end
      end
    end
  end

	def paginate(model, clazz = '')
    content = will_paginate(model, renderer: WillPaginate::CustomRenderer)
    content_tag(:div, content, class: clazz)
  end

  def options_for_per_page
    [10, 20, 50, 100]
  end

  def show_message_error(model, key)
    build_tag_message_error model, key if model.errors.key? key.to_sym
  end

  private

  def class_error(model, attribute)
    return unless model && model.errors
    'ls-alert-danger' if model.errors.key? attribute.to_sym
  end

  def build_tag_message_alert(msg, type)
    content_tag(:div, class: "ls-alert-#{type} ls-sm-space ls-dismissable") do
      concat(content_tag(:span, '&times;'.html_safe, class: 'ls-dismiss', 'data-ls-module' => 'dismiss'))
      concat(
        content_tag(:p) { content_tag(:span, raw(msg), class: 'ls-ico-chevron-right') }
      )
    end
  end

  def build_tag_message_error(model, key)
    content_tag(:div) do
      model.errors[key.to_sym].all? do |x|
        concat(
          content_tag(:p, class: 'ls-help-message ls-no-margin') do
            concat(content_tag(:small, x))
          end
        )
      end
    end
  end
end
