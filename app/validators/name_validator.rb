# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, t('errors.messages.bad_format')) if self.class.valid?(value)
  end

  class << self
    def valid_name?(name)
      name.to_s =~ /\A[a-zа-яё]+\z/i
    end
  end
end
