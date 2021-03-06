require 'rails_helper'

RSpec.describe 'Creating Advertisment', type: :feature do
  scenario 'successful advert creation' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'advertisement_location', with: 'Kisumu'
    fill_in 'advertisement_category', with: 'Electronic'
    fill_in 'advertisement_advert_type', with: 'Computer'
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: '10'
    click_on 'Post Advert'
    expect(page).to have_content 'Kisumu'
    expect(Advertisement.all.size).to eq 1
  end
  scenario 'blank location' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'advertisement_location', with: ''
    fill_in 'advertisement_category', with: 'Electronic'
    fill_in 'advertisement_advert_type', with: 'Computer'
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: '10'
    click_on 'Post Advert'
    expect(page).to have_content "can't be blank"
    expect(Advertisement.all.size).to eq 0
  end
  scenario 'blank category' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'advertisement_location', with: 'Kisumu'
    fill_in 'advertisement_category', with: ''
    fill_in 'advertisement_advert_type', with: 'Computer'
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: '10'
    click_on 'Post Advert'
    expect(page).to have_content "can't be blank"
    expect(Advertisement.all.size).to eq 0
  end
  scenario 'blank advert type' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'advertisement_location', with: 'Kisumu'
    fill_in 'advertisement_category', with: 'Electronic'
    fill_in 'advertisement_advert_type', with: ''
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: '10'
    click_on 'Post Advert'
    expect(page).to have_content "can't be blank"
    expect(Advertisement.all.size).to eq 0
  end
  scenario 'blank price' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'advertisement_location', with: 'Kisumu'
    fill_in 'advertisement_category', with: 'Electronic'
    fill_in 'advertisement_advert_type', with: 'Computer'
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: ''
    click_on 'Post Advert'
    expect(page).to have_content "can't be blank"
    expect(Advertisement.all.size).to eq 0
  end
  scenario 'non digit  price' do
    user = FactoryBot.create(:user)
    login_as user
    visit new_advertisement_path
    fill_in 'Location', with: 'Kisumu'
    fill_in 'Category', with: 'Electronic'
    fill_in 'Advert type', with: 'Computer'
    fill_in 'Model', with: 'Dell-XXX'
    fill_in 'Price', with: '1a'
    click_on 'Post Advert'
    expect(page).to have_content 'is not a number'
    expect(Advertisement.all.size).to eq 0
  end
end