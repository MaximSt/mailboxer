class Mailboxer::Spammers < Mailboxer::Notification
  self.table_name = :mailboxer_spammers

  belongs_to :receiver, :polymorphic => :true
  belongs_to :spammer, :polymorphic => :true

  validates_presence_of :sender, :receiver
  validates_uniqueness_of :sender, scope: [:receiver]
end
