class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_experience
    return 0 if contestants.empty?

    contestants.average(:years_of_experience).round(2)
  end

  # add these methods (don't query in view!)
  def challenge_theme
    challenge.theme
  end

  def contestant_count
    contestants.size
  end
end
