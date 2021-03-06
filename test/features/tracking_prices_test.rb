require 'features_helper'

class TrackingPricesTest < FeatureTest
  setup do
    @grant = ShopperPersonaSession.new(email: 'grant@example.com')
    @grant.sign_up
    @pat = ShopperPersonaSession.new(email: 'pat@example.com')
    @pat.sign_up
  end

  test 'Grant tracks price of Sugar for the first time and Pat sees it' do
    @grant.perform do
      click_link 'Price Book'
      click_on 'Sugar'
      click_on 'New Price'

      # need to select a region first
      click_on 'South Africa'
      select 'Western Cape', from: 'Region'
      click_on 'Save'

      # need to create a new store first
      click_link 'New Store'
      fill_in 'Name', with: 'Pick n Pay'
      fill_in 'Location', with: 'Canal Walk'
      click_on 'Save'

      # start filling in the price
      fill_in 'Product name', with: 'Koo Beans'
      fill_in 'Amount', with: '1'
      fill_in 'Package size', with: '410'
      fill_in 'Total price', with: '10'
      click_on 'Save'
    end

    assert @grant.has_content?('Koo Beans')
    assert @grant.has_content?('410')

    @pat.perform do
      click_link 'Price Book'

      click_on 'Region'

      # need to select a region first
      click_on 'South Africa'
      select 'Western Cape', from: 'Region'
      click_on 'Save'

      click_on 'Sugar'
      click_on 'Edit'
      fill_in 'Following product', with: 'koo beans'
      click_on 'Update Page'

      click_on 'New Price'
      # need to create a new store first
      click_link 'New Store'
      fill_in 'Name', with: 'Pick n Pay'
      fill_in 'Location', with: 'Canal Walk'
      click_on 'Save'

      # start filling in the price
      fill_in 'Product name', with: 'Pnp Beans'
      fill_in 'Amount', with: '1'
      fill_in 'Package size', with: '400'
      fill_in 'Total price', with: '9.5'
      click_on 'Save'
    end

    assert @pat.has_content?('Pnp Beans')
    assert @pat.has_content?('400')
    assert @pat.has_content?('Koo Beans')
    assert @pat.has_content?('410')
  end
end