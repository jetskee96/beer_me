class Beer < ActiveRecord::Base
  validates :title, :content, length: { minimum: 3 }, presence: true
  validates :image, presence: true
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  
  
  has_reputation :votes, source: :user, aggregated_by: :sum
 
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end

end
