# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, t('errors.messages.bad_format')) if self.class.valid?(value)
  end

  class << self
    def valid?(phone)
      phone.to_s =~ /\A7[3489]\d{9}\z/
    end
  end
end
