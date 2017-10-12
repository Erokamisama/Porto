class CreateRawBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :raw_bodies do |t|
      t.string :body
      t.string :title
      t.string :company_name
      t.string :company_des

      t.timestamps
    end
  end
end
