class Player < ActiveRecord::Base
    
    belongs_to :team

    validates :espnid, presence: true, uniqueness: true
    validates_presence_of :first_name, :last_name, :position, :team_id

end