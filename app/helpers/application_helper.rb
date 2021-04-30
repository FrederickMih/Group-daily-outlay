module ApplicationHelper
  def creation_date(mydate)
    mydate.created_at.strftime('%d %b %Y')
  end
end
