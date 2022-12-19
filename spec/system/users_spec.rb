# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration an authorization testing', type: :system do
  let(:num) { 10 }
  let(:str) { '6 28 3 4 5 6 6 496 3 6' }

  let(:user) { Faker::Internet.user('username', 'email', 'password') }
  let(:name) { user[:username] }
  let(:email) { user[:email] }
  let(:password) { user[:password] }

  scenario 'First visiting' do
    visit root_path

    expect(page).to have_selector(:link, 'Регистрация')
    expect(page).to have_selector(:link, 'Вход')
  end

  scenario 'Sign up, quit, log in and unput values' do
    visit new_user_path

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    find('#btn_submit').click

    expect(page).to have_text "Добро пожаловать, #{name}!"

    find('#quit_button').click

    visit new_session_path

    fill_in :email, with: email
    fill_in :password, with: password

    find('#btn_submit').click

    expect(page).to have_text "Добро пожаловать, #{name}!"

    fill_in :num, with: num
    fill_in :str, with: str
    click_button('Вывести')
    expect(find('#longest')).to have_text('6 6 496')
    expect(find('#count')).to have_text('3')
  end

  scenario 'must authorize to get data' do
    visit input_path
    expect(page).to have_text 'Вы не авторизованы'
  end
end
