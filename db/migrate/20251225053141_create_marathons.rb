class CreateMarathons < ActiveRecord::Migration[8.1]
  def change
    create_table :marathons do |t|
      t.string :name
      t.datetime :entry_start
      t.datetime :entry_end

      t.timestamps
    end
  end
end
