class AddSpamFieldToReceipt < ActiveRecord::Migration
  def self.up
    add_column :mailboxer_receipts, :spam, :boolean, :default => false
    add_index :mailboxer_receipts, :spam
  end

  def self.down
    remove_column :mailboxer_receipts, :spam
  end
end
