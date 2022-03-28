# frozen_string_literal: true

class PromoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, I18n.t('errors.messages.only_latin_and_numbers')) unless self.class.valid?(value)
  end

  class << self
    def valid?(code)
      code.to_s =~ /\A[A-Z\d]+\z/
    end
  end
end
