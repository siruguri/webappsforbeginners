class AddTemplateToPage < ActiveRecord::Migration
  def change
    add_column :pages, :template, :string
  end
end
