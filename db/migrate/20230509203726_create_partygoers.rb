class CreatePartygoers < ActiveRecord::Migration[7.0]
  def change
    create_table :partygoers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
