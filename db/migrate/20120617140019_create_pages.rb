class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.text :comment
      t.boolean :usable

      t.timestamps
    end
  end
end
