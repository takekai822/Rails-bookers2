class Category < ApplicationRecord

  has_many :book_categories, dependent: :destroy, foreign_key: 'category_id'
  has_many :books, through: :book_categories

  def self.looks(search, word)

    if search == "perfect"
      @category = Category.where("name LIKE?", "#{word}")
    end

    return @category.inject(init = []) {|result, category| result + category.books}
  end
end
