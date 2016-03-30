require 'integration_helper'

class PriceCheckTest < IntegrationTest
  test 'Search for items when not logged in' do
    visit '/price_check'
    select 'South Africa - Western Cape', from: 'Current public api'
    click_button 'Set'

    assert page.has_content?('Price Check')
  end

  test 'Search for items when logged in' do
    visit '/profile'
    sign_in_shopper(current_public_api: PublicApi.first_code)
    assert page.has_content?('Profile')
    assert page.has_content?('South Africa - Eastern Cape')

    click_link 'Price Check'
    assert page.has_content?('Price Check')
  end
end
