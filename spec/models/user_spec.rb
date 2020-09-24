require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "ニックネームが必須であること" do
      user = User.new(nickname:"")
    end
  end
end
