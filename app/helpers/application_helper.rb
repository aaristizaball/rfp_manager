module ApplicationHelper
  
  def link_to_icon(icon_name, url_or_object, options={})
    options.merge!({:class => "icon #{icon_name}"})
    link_to(image_tag("icons/#{icon_name}.png"), url_or_object, options)
  end
  

end
