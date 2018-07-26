class CreateReceivedMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :received_messages do |t|
      #table received_messages avec les private_message_id et les recipient_id (qui proviennent de la classe user) - permet qu'un PM ait un ou plus destinataire
      t.belongs_to :private_message, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
