class CreateConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :configs do |t|
      t.string :conf_name
      t.numeric :conf_repeat_pull
      t.numeric :conf_repeat_push
      t.string :conf_url_pull
      t.numeric :conf_type_pull

      t.timestamps
    end
  end
end
