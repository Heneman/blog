class Entry < ActiveRecord::Base
  belongs_to :user

  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :category, :subcategory, :topic

  validates_presence_of :title, :subtitle, :category, :post, :subcategory, :topic
  attr_accessible :title, :subtitle, :category, :post, :subcategory, :topic

  before_save :to_l

  private

    def to_l
      self.category.downcase
    end
end