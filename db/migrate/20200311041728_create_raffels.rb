class CreateRaffels < ActiveRecord::Migration[5.2]
  def change
    create_table :raffels do |t|
      t.text :title

      t.timestamps
    end
  end
end
