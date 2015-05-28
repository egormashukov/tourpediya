module ApplicationHelper

  def page_header(controller, obj = '')
    content_tag :div, class: 'page-header' do
      content_tag :h1 do
        I18n.t(controller) + (obj.present? ? " '#{obj}'" : '')
      end
    end
  end
end
