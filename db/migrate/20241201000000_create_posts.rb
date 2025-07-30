class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :author, null: false

      t.timestamps
    end
    
    # 제목에 인덱스 추가 (검색 성능 향상)
    add_index :posts, :title
    # 작성자에 인덱스 추가
    add_index :posts, :author
  end
end 