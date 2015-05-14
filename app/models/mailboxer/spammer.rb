class Mailboxer::Spammer < Mailboxer::Notification
  self.table_name = :mailboxer_spammers

  belongs_to :receiver, :polymorphic => true
  belongs_to :spammer, :polymorphic => true
  belongs_to :conversation

  validates_presence_of :conversation
  validates_uniqueness_of :receiver_id, :scope => [:receiver_type, :conversation_id]

  scope :recipient, lambda {|recipient|
                      where(:receiver_id => recipient.id,:receiver_type => recipient.class.base_class.to_s)
                    }
end
