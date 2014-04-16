class AddRestrictedToPage < ActiveRecord::Migration
  def change
    add_column :pages, :restricted, :boolean
  end
end
