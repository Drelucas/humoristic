require 'will_paginate/view_helpers/action_view'

module WillPaginate
  class CustomRenderer < WillPaginate::ActionView::LinkRenderer
    include PaginationListLinkRenderer
  end
end
