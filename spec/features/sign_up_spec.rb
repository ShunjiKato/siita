require 'rails_helper'

feature 'Sign up' do
  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  scenario 'メールアドレスとパスワードを入力してユーザー登録を行う' do
    visit root_path
    expect(page).to have_http_status :ok

    # 登録に失敗する場合
    click_link 'サインアップ'
    click_button 'Sign up'
    expect(page).to have_content 'Email が入力されていません。'
    expect(page).to have_content 'Password が入力されていません。'

    fill_in 'Password', with: 'tarotaro'
    fill_in 'Password confirmation', with: 'tarojiro'
    click_button 'Sign up'
    expect(page).to have_content 'Password confirmation が誤っています。'

    # 登録に成功する場合
    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: 'tarotaro'
    fill_in 'Password confirmation', with: 'tarotaro'
    expect { click_button 'Sign up' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content '確認メールを登録したメールアドレス宛に送信しました。リンクを開いてアカウントを有効にしてください。'

    mail = ActionMailer::Base.deliveries.last
    url = extract_confirmation_url(mail)
    visit url
    expect(page).to have_content 'アカウントが確認されました。'

    click_link 'ログイン'
    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: 'tarotaro'
    click_on 'Log in'
    expect(page).to have_content 'ログインしました。'

    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end