class RegisteredApplication < ActiveRecord::Base
  has_many :events, dependent: :destroy
end
