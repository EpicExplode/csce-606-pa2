module MoviesHelper
  def sort_header(column, label, current_sort, current_direction)
    active = column == current_sort
    next_direction = active && current_direction == "asc" ? "desc" : "asc"

    options = { scope: "col" }
    if active
      options[:class] = "sorted-#{current_direction}"
      options[:aria] = { sort: current_direction == "asc" ? "ascending" : "descending" }
      label += current_direction == "asc" ? " ▲" : " ▼"
    end

    content_tag(:th, options) do
      link_to label, movies_path(sort: column, direction: next_direction)
    end
  end
end
