class FinanceConverter
  def self.convert(bankdetails)
    {
      "country_alpha_2_code": bankdetails.country_alpha_2_code,
      "bank_name": bankdetails.bank_name,
      "bank_number": bankdetails.bank_number,
      "branch_name": bankdetails.branch_name,
      "branch_number": bankdetails.branch_number,
      "bank_address": bankdetails.bank_address,
      "iban": bankdetails.iban,
      "swift_or_bic": bankdetails.swift_or_bic,
      "account_name": bankdetails.account_name,
      "account_number": bankdetails.account_number
    }
  end
end