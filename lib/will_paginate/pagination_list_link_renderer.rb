module WillPaginate
  module PaginationListLinkRenderer
    ELLIPSIS = '&hellip;'

    def to_html
      list_items = pagination.map do |item|
        case item
        when Fixnum
          page_number(item)
        else
          send(item)
        end
      end.join(@options[:link_separator])

      tag('ul', list_items, class: ul_class)
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}

      if page == current_page
        tag('li', link(page, '#', link_options), class: 'ls-active')
      else
        tag('li', link(page, page, link_options.merge(rel: rel_value(page))))
      end
    end

    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}

      if page
        tag('li', link(text, page, link_options), class: classname)
      else
        tag('li', link(text, '#', link_options), class: '%s ls-disabled' % classname)
      end
    end

    def gap
      tag('li', tag('span', ELLIPSIS, class: 'ls-gap'), class: 'ls-disabled')
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], 'prev')
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], 'next')
    end

    def ul_class
      ['ls-pagination', @options[:class]].compact.join(' ')
    end
  end
end
