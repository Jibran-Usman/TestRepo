class Comment < ApplicationRecord
  belongs_to :article
  #before_destroy :dummy_method
  #before_create :dmethod
  has_many :replys

  private
  
  def dummy_method
  	raise ActiveRecord::RecordNotSaved
  end

  def dmethod
  	raise ActiveRecord::RecordNotSaved
  end

end
