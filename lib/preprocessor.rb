# frozen_string_literal: true

module Preprocessor
  class << self
    def for_phone(phone)
      return nil unless phone.is_a? String

      phone
        .gsub(/\s/, '')
        .sub(/^8/, '7')
        .gsub(/\D/, '')
    end

    def for_promo(promo)
      return nil unless promo.is_a? String

      promo.strip.upcase
    end

    def for_name(name)
      return nil unless name.is_a? String

      name.strip.capitalize
    end
  end
end
