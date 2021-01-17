# To deliver this notification:
 #RequestNotification.with(service: @service).deliver_later(current_user)
RequestNotification.with(service: @service).deliver_later(@service.requests)

class RequestNotification < Noticed::Base
  # Add your delivery methods
   deliver_by :database, format: :to_database
   #deliver_by :action_cable
   #deliver_by :email, mailer: "UserMailer"
   #deliver_by :slack
   #deliver_by :custom, class: "MyDeliveryMethod"
  # Add required params
  def to_database
    {
      type: self.class.name,
      params: params,
    #  account: Current.account,
    }

  end

   param :service

  # Define helper methods to make rendering easier.
  #
   def message
     t(".message")
   end
  #
   def url
     root_path
   end
end
