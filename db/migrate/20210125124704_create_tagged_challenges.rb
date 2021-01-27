class CreateTaggedChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :tagged_challenges do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
