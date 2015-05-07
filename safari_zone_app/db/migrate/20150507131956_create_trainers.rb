class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :username
      t.string :password_digest
      t.integer :safari_balls
      t.text :image_url
    end
  end
end
