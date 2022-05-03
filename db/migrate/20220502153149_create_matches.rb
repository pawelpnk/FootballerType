class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :first_team_name
      t.string :second_team_name
      t.numeric :first_team_result
      t.numeric :second_team_result
      t.numeric :minutes
      t.string :player

      t.timestamps
    end
  end
end
