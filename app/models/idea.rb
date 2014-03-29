class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :name, presence: true

  def recent?
    created_at >= 2.days.ago
  end

  def self.great_icecream_ideas
    where(name: "Eat Icecream").where("description LIKE '%great idea%'")
  end

  def self.to_eat_icecream
    self.create(name: 'Eat Icecream', description: "Yum! That's a great idea")

    # Uncomment to refactor
    # idea = Idea.new
    # idea.name = 'Eat Icecream'
    # idea.description = "Yum! That's a great idea"
    # idea
  end
end
