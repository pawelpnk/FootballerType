class Match < ApplicationRecord
    has_many :page
    belongs_to :user

    validates :first_team_name, presence: true
    validates :second_team_name, presence: true
end
