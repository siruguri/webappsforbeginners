class AddUsesMdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :uses_md, :boolean
  end
end
