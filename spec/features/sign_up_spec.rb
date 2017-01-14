require 'rails_helper'

feature 'Sign up' do
  scenario 'メールアドレスとパスワードを入力してユーザー登録を行う' do
    visit root_path
    expect(page).to have_http_status :ok
    click_link 'サインアップ'
    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: 'tarotaro'
    fill_in 'Password confirmation', with: 'tarotaro'
    # click_button 'Sign up'
    expect { click_button 'Sign up' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content '確認メールを登録したメールアドレス宛に送信しました。リンクを開いてアカウントを有効にして下さい。'

#    mail = ActionMailer::Base.deliveries.last
#    body = mail.body.encoded
#    url = body[/https[^"]+/]
#    visit url
#    expect(page).to have_content 'パスワードを入力して下さい'
  end
end