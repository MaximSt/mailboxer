class CreateMailboxerSpammers < ActiveRecord::Migration
  def self.up
    create_table :mailboxer_spammers do |t|
      t.references :receiver, :polymorphic => true
      t.references :spammer, :polymorphic => true
      t.references :conversation
    end
    add_index :mailboxer_spammers, [:receiver_id, :receiver_type]
    add_index :mailboxer_spammers, [:spammer_id, :spammer_type]
    add_index :mailboxer_spammers, :conversation_id
  end

  def self.down
    drop_table :mailboxer_spammers
  end
end
