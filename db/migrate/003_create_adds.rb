class CreateAdds < ActiveRecord::Migration[5.2]
    def change
      create_table :adds do |t|
        t.integer :user_id
        t.integer :watching_id
        t.boolean :seen

        t.timestamps null: false
      end
    end
  end