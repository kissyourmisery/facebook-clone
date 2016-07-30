class CreateLikes < ActiveRecord::Migration
	def change
	  create_table :likes do |t|
    	t.integer :value
    	t.belongs_to :status, index: true
    	t.belongs_to :user, index: true
      t.timestamps
    end
	end
end
