class Client < ApplicationRecord
  STATUS = { incoming: 0, in_progress: 1, finished: 2 }

  enum status: STATUS

  validates :pj_name, :client_name, exclusion: { in: [nil, ""] }, length: { in: 3..80 }
  validates :client_name, :client_name, exclusion: { in: [nil, ""] }, length: { in: 3..80 }
  validates :status, inclusion: { in: [0, 1, 2] }, exclusion: { in: [nil, ""] }
  validates :price, numericality: { only_integer: true }

end