class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :catergory, inclusion: {in: ['Fiction', 'Non-Fiction']}
end
