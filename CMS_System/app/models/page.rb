class Page < ApplicationRecord
    def to_param
        #return the string of the slug stored in our database
        self.id
      end
end
