.class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
