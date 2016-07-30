module ApplicationHelper
  #Returns the full title on a per page basic
  def full_title(page_title = '')
    base_title = 'Redmart'
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

  def page_title(page_title)
 page_title
end
end
