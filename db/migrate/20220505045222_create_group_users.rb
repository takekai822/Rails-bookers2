class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      
      t.references :user, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
