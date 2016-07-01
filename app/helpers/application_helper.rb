module ApplicationHelper
    def flash_messages(opts = {})
        flash.each do |level, message|
            concat(content_tag(:p, message, class: "alert alert-#{level} fade in") do 
                concat content_tag(:button, '',class: "close glyphicon glyphicon-remove-circle", data: { dismiss: 'alert' })
                concat message 
                end)
        end
        nil
    end
end
