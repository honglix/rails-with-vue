class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.datetime :post_time

      t.timestamps
    end
  end
end
