# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:str) { '6 28 3 4 5 6 6 496 3 6' }
  let(:num) { 10 }

  scenario 'test this page' do
    visit root_path

    fill_in :num, with: num
    fill_in :str, with: str

    click_button('Вывести')

    expect(find('#longest')).to have_text('6 6 496')
    expect(find('#count')).to have_text('3')
  end

  scenario 'do not fill any values in form and click submit' do
    visit root_path

    click_button('Вывести')

    SeqShow.new.errors.messages.each do |message|
      expect(find('#show-container')).to have_text(message)
    end
  end

  scenario 'added string to seq' do
    visit root_path

    fill_in :num, with: num
    fill_in :str, with: "#{str}k"

    click_button('Вывести')

    SeqShow.new.errors.messages.each do |message|
      expect(find('#show-container')).to have_text(message)
    end
  end

  scenario 'wrong length' do
    visit root_path

    fill_in :num, with: num + 5
    fill_in :str, with: str

    click_button('Вывести')

    SeqShow.new.errors.messages.each do |message|
      expect(find('#show-container')).to have_text(message)
    end
  end
end
