module ApplicationHelper
  def full_title(page_title)
    base_title = '今期なに見る？'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
