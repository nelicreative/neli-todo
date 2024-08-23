module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Neli todo list'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def random_color
    '#' + format('%06x', (rand * 0xffffff)).to_s
  end
end
