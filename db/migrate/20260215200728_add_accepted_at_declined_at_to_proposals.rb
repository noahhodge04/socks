class AddAcceptedAtDeclinedAtToProposals < ActiveRecord::Migration[8.1]
  def change
    add_column :proposals, :accepted_at, :timestamp
    add_column :proposals, :declined_at, :timestamp
  end
end
