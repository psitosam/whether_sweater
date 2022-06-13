class ChangeAccessTokenToApiKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :access_token, :api_key
  end
end
