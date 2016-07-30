class CreateStatuses < ActiveRecord::Migration
	def change
	  create_table :statuses do |t|
	  	t.string :status_text
	  	t.belongs_to :user, index: true
	    t.timestamps
	  end
	end
end
