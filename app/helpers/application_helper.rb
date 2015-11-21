module ApplicationHelper
	def paginate(model, clazz = '')
    content = will_paginate(model, renderer: WillPaginate::CustomRenderer)
    content_tag(:div, content, class: clazz)
  end

  def options_for_per_page
    [10, 20, 50, 100]
  end
end
