# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  price_book_id :integer
#  shopper_id    :integer
#  admin         :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

describe Member do
  describe 'Validation' do
    it 'requires shopper_id' do
      Member.create.errors[:shopper_id].wont_be_empty
    end

    it 'requires price_book_id' do
      Member.create.errors[:price_book_id].wont_be_empty
    end

    it 'requires uniq shopper per price book' do
      shopper = create_shopper
      price_book = PriceBook.create!
      Member.create!(shopper: shopper, price_book_id: price_book.id)
      member = Member.create(shopper: shopper, price_book_id: price_book.id)
      member.errors[:shopper_id].wont_be_empty
    end
  end

  describe 'Defaults' do
    it 'admin false by default' do
      Member.new.admin.must_equal(false)
    end
  end
end
