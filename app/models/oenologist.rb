class Oenologist < ApplicationRecord
    has_many :magazineoenologistjobtitles
    has_many :job_titles, through: :magazineoenologistjobtitles
    has_many :magazines, through: :magazineoenologistjobtitles
    has_many :scores
    has_many :wines, through: :scores
end
