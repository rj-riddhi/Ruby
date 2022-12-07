class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  validates :email, presence: true , uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :first_name , :last_name , presence: true


  def self.custom(name)
    User.any_of({"first_name":  /#{name}/} , {"last_name": /#{name}/}, {"email": /#{name}/})
  end
end
