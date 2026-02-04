class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :name
      t.string :provider # 소셜 로그인 제공자 (google, kakao 등)
      t.string :uid      # 소셜 로그인 고유 ID
      t.string :avatar_url

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, [ :provider, :uid ], unique: true
  end
end
