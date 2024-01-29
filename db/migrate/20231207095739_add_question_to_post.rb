class AddQuestionToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :question, :string
  end
end
