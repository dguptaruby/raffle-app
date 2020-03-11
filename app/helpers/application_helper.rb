module ApplicationHelper

  def raffel_options
    Raffel.all.collect{ |r| [r.title, r.id] }
  end
end
