class Task < ApplicationRecord
    has_one_attached :eyecatch

    has_many :comments, dependet: :destroy
    belongs_to :user
    belongs_to :board
end
