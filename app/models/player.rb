class Player < ActiveRecord::Base
    
    belongs_to :user

    validates :teamname, presence: true, uniqueness: true

end