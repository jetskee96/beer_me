class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
