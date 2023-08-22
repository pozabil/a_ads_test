class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: 'users' }
      t.references :followee, null: false, foreign_key: { to_table: 'users' }
      t.index [:follower_id, :followee_id], unique: true
      t.timestamps
    end
  end
end
