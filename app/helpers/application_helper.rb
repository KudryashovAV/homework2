module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == session[:sort_by] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, movies_path( sort_by: column, direction: direction.to_s)
  end
end


