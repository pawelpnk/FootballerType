class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.numeric :first_team
      t.numeric :second_team
      t.numeric :minutes
      t.string :player
      t.text :comment

      t.timestamps
    end
  end
end
