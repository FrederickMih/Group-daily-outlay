module ApplicationHelper
  def creation_date(dt)
    dt.created_at.strftime('%d %b %Y')
  end


end
