class AddLayoutToPage < ActiveRecord::Migration
  def change
    add_column :pages, :layout, :string
  end
end
