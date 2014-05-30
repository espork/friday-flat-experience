class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :category, index: true
      t.boolean :private
      t.string :title
      t.text :description
      t.text :included
      t.text :not_included
      t.integer :duration
      t.string :duration_type
      t.integer :max_group_size
      t.string :availability
      t.text :additional_information
      t.references :location, index: true

      t.timestamps
    end
  end
end
