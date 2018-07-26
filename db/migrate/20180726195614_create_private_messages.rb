class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      # table private_messages contenant sender_id - permet qu'un PM n'ait qu'un expéditeur 
      t.references :sender, index: true
      t.timestamps
    end
  end
end
