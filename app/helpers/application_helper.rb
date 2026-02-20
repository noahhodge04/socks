module ApplicationHelper
  def title
    if content_for(:title)
      "#{content_for(:title)} | Socks - Find Your Pair"
    else
      "Socks - Find Your Pair"
    end
  end
end
