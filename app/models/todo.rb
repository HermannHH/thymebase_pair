# == Schema Information
#
# Table name: todos
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  list_id     :bigint
#
# Indexes
#
#  index_todos_on_description_and_list_id  (description,list_id) UNIQUE
#  index_todos_on_list_id                  (list_id)
#

class Todo < ApplicationRecord

  belongs_to :list
  validates :description, presence: true, uniqueness: { scope: :list_id }

  enum status: {
    to_do: 0,
    done: 1
  }

end
