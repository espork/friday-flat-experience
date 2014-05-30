class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :when
      t.string :what
      t.references :experience, index: true
      t.timestamps
    end
  end
end
