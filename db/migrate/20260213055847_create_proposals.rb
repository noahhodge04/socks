class CreateProposals < ActiveRecord::Migration[8.1]
  def change
    create_table :proposals do |t|
      t.references :sock_1, foreign_key: { to_table: 'socks' }
      t.references :sock_2, foreign_key: { to_table: 'socks' }
    
      t.timestamps
    end
  end
end
