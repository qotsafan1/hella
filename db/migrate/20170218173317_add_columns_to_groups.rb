class AddColumnsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :name_en, :string
    add_column :groups, :info_is, :string
    add_column :groups, :info_en, :string
    add_column :groups, :participants, :string
    add_column :groups, :bikes, :string
    add_column :groups, :prices, :string
    add_column :groups, :hide, :boolean
    add_column :groups, :priority, :integer
  end
end
