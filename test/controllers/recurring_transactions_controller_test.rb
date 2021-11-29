require "test_helper"

class RecurringTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurring_transaction = recurring_transactions(:one)
  end

  test "should get index" do
    get recurring_transactions_url, as: :json
    assert_response :success
  end

  test "should create recurring_transaction" do
    assert_difference('RecurringTransaction.count') do
      post recurring_transactions_url, params: { recurring_transaction: { amount: @recurring_transaction.amount, category: @recurring_transaction.category, date: @recurring_transaction.date, direction: @recurring_transaction.direction, frequency: @recurring_transaction.frequency } }, as: :json
    end

    assert_response 201
  end

  test "should show recurring_transaction" do
    get recurring_transaction_url(@recurring_transaction), as: :json
    assert_response :success
  end

  test "should update recurring_transaction" do
    patch recurring_transaction_url(@recurring_transaction), params: { recurring_transaction: { amount: @recurring_transaction.amount, category: @recurring_transaction.category, date: @recurring_transaction.date, direction: @recurring_transaction.direction, frequency: @recurring_transaction.frequency } }, as: :json
    assert_response 200
  end

  test "should destroy recurring_transaction" do
    assert_difference('RecurringTransaction.count', -1) do
      delete recurring_transaction_url(@recurring_transaction), as: :json
    end

    assert_response 204
  end
end
