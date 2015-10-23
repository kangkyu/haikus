class Haiku < ActiveRecord::Base
  has_many :lines, inverse_of: :haiku
  accepts_nested_attributes_for :lines
  # validates :lines, presence: true

  before_create :say_hello

  def say_hello
    puts "hello"
  end

end
