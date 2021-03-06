require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

DatabaseCleaner.strategy = :transaction

class Minitest::Spec
  before do
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
end

class ActiveSupport::TestCase
  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  setup prepend: true do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  teardown do
    DatabaseCleaner.strategy = :transaction
  end
end
