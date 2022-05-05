class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, dependent: :destroy

  validates :name, presence: true
  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def self.looks(search, word)
    if search == "perfect"
      @group = Group.where("name LIKE?", "#{word}")
    elsif search == "forward"
      @group = Group.where("name LIKE?", "#{word}%")
    elsif search == "backward"
      @group = Group.where("name LIKE?", "%#{word}")
    elsif search == "partial"
      @group = Group.where("name LIKE?", "%#{word}%")
    else
      @group = Group.all
    end
  end
end
