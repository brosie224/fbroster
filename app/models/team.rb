class Team < ActiveRecord::Base
    
    belongs_to :user
    has_many :players

    validates :name, presence: true, uniqueness: true
    validates_presence_of :conference, :division

end