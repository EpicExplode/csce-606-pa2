module MoviesHelper
  # "sorted-asc" / "sorted-desc" for the currently sorted column, nil otherwise
  def sort_class(column, current_sort, current_direction)
    "sorted-#{current_direction}" if column == current_sort
  end

  def sort_header(column, label, current_sort, current_direction)
    active = column == current_sort
    next_direction = active && current_direction == "asc" ? "desc" : "asc"

    options = { scope: "col" }
    if active
      options[:class] = sort_class(column, current_sort, current_direction)
      options[:aria] = { sort: current_direction == "asc" ? "ascending" : "descending" }
      label += current_direction == "asc" ? " ▲" : " ▼"
    end

    content_tag(:th, options) do
      link_to label, movies_path(sort: column, direction: next_direction)
    end
  end
end
