class SectionContent < ActiveRecord::Base

  def save_html_content(current_user, html_content)
    self.update(html_content: html_content, last_modified_by: current_user.full_name, last_modified_date: Time.current.utc.iso8601)
  end

end
