# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_name  (name) UNIQUE
#

class List < ApplicationRecord

  has_many :todos, dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
