class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :post,    -> {  where(     post_id: nil ) }
  scope :comment, -> {  where.not( post_id: nil ) }

  def self.find_comments( id )
    where( post_id: id )
  end

end
