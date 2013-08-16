class CreateQuestions < ActiveRecord::Migration
  def change
    
    create_table :questions do |t|
      
      t.belongs_to :survey
      
      t.string :content

      t.timestamps

    end

  end
end
