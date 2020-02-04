class AddPriceToLineItems < ActiveRecord::Migration

  def up
    add_column :line_items, :price, :float

    execute "UPDATE line_items SET price = (SELECT price FROM products WHERE id = line_items.product_id)"

    change_column :line_items, :price, :float, not_null: false
  end

  def down
    remove_column :line_items, :price, :float
  end

end
