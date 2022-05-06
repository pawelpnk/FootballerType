class AddReferencesToUserMatchAndPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :matches, :user, foreign_key: true
    add_reference :pages, :user, foreign_key: true
  end
end
