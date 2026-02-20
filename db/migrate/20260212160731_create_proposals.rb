class CreateProposals < ActiveRecord::Migration[8.1]
  def change
    create_table :proposals do |t|
      t.references :sock, null: false
      t.references :proposed_sock, null: false, foreign_key: { to_table: :socks }
      t.timestamps
    end
  end
end
