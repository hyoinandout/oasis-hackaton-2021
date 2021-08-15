class Ride < ApplicationRecord
  belongs_to :user
  enum points: ["etc","u-square","gwangju-songjung-station","GIST","JNU"], _suffix:true
end
