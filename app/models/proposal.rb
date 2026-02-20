class Proposal < ApplicationRecord
  # A proposed match links two socks before a final match is created.
  belongs_to :sock
  belongs_to :proposed_sock, class_name: "Sock"

  scope :active, -> { where(accepted_at: nil, declined_at: nil) }
  scope :sent_to, ->(owner) { active.joins(:proposed_sock).where(socks: { owner: owner }) }

  def decline!
    touch(:declined_at)
  end
end
