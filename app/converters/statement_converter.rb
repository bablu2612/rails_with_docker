class StatementConverter
  def self.convert(statements)
    {
      "amount": statements.amount,
      "currency": statements.currency,
      "datetime": statements.updated_at.to_s,
      "ref": statements.ref,
      "type": statements.medium,
      "metadata":statements.metadata,
    }
  end

  def self.convert_topup_statement(statements)
    {
      "amount": statements.amount,
      "currency": statements.currency,
      "datetime": statements.updated_at.to_s,
      "ref": statements.ref,
      "type": statements.medium,
      "coins":statements.coin,
      "metadata":statements.metadata,
    }
  end
end