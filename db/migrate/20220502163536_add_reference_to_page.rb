class AddReferenceToPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :pages, :match, foreign_key: true
  end
end
