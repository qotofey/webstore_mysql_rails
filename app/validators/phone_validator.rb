# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, t('errors.messages.bad_format')) if self.class.valid?(value)
  end

  class << self
    def valid?(phone)
      phone.to_s =~ /\A7[3489]\d{9}\z/
    end

    def valid_country_code?(phone); end

    def valid_operator_code?(phone); end

    def valid_telephone_code?(phone); end
  end
end
