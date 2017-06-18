module ApplicationHelper
  def full_title(page_title)
    base_title = '今期なに見る？'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def last_3_cours
    Cour.order(year: :desc, season: :desc).limit(3).offset(1)
  end
end
