module ApplicationHelper
  # method to handle error messages
  def error_messages_for(object)
    render(partial: 'application/error_messages',
           locals: { object: object }) unless object.blank? || object.errors.count.zero?
  end

  # method to handle form error highlight
  def form_class(object, column)
    if object.errors[column].empty?
      ''
    else
      'has-error'
    end
  end

  # method to handle form error autofocus
  def form_autofocus(object, column)
    if object.errors[column].empty?
      false
    else
      true
    end
  end

def errors_for(object)
    if object.errors.any?
        content_tag(:div, class: "panel panel-danger") do
            concat(content_tag(:div, class: "panel-heading") do
                concat(content_tag(:h4, class: "panel-title") do
                    concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
                end)
            end)
            concat(content_tag(:div, class: "panel-body") do
                concat(content_tag(:ul) do
                    object.errors.full_messages.each do |msg|
                        concat content_tag(:li, msg)
                    end
                end)
            end)
        end
    end
end
end
