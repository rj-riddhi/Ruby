module ApplicationHelper

    def flash_class(key)
	    case key
	      when 'notice' then 'info'
	      when 'success' then 'success'
	      when 'error' then 'danger'
	      when 'warning' then 'warning'
	      when 'alert' then 'danger'
	    end
	 end
     
end
