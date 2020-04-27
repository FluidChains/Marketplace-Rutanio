class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

 protected

  def athenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

end
