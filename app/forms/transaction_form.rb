class TransactionForm < Reform::Form
  feature Dry::Validations
  property :amount
  property :account
  property :memo

  validation :default do
    key(:amount, &:filled?)
  end
end
