class AddPages < ActiveRecord::Migration
  def change
    create_table :pages do |t|


      t.timestamps
    end
  end
end
