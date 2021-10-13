class ApplicationRecord < ActiveRecord::Base # ApplicationRecord is M in Active Record MVC
  self.abstract_class = true #when set to true it allows other models to inherit from it
end
