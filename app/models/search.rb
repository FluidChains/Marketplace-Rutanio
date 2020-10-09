class Search < ApplicationRecord

  def search_directories
    services = Service.all
    services = services.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
    return services
  end

end
