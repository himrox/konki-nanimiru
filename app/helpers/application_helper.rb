module ApplicationHelper
  def full_title(page_title)
    base_title = '今期なに見る？'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def last_3_cours
    current_cour = Cour.current_cour
    latest_cour  = Cour.order(year: :desc, season: :desc).first

    if current_cour == latest_cour
      Cour.order(year: :desc, season: :desc).limit(3).offset(1)
    else
      Cour.order(year: :desc, season: :desc).limit(3).offset(2)
    end
  end
end
