class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary
      t.text :location
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
