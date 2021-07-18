class Client < ApplicationRecord
  has_many :projects

  def name
    return self.client_name
  end

end