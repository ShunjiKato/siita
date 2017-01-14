require 'rails_helper'

RSpec.describe User, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  # 重複したメールアドレスは無効な状態であること
  it "is invalid with a duplicate email address" do
    create(:user, email: 'hoge@example.com')
    user = build(:user, email: 'hoge@example.com')
    user.valid?
    expect(user.errors[:email]).to include('は既に使用されています。')
  end
end
