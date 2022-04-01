module Roleable
  extend ActiveSupport::Concern

  included do
    has_many :roles, class_name: 'UserRole', dependent: :destroy
    accepts_nested_attributes_for :roles, allow_destroy: true

    UserRole.positions.each_key do |key|
      next if method_defined? "#{key}?"

      define_method "#{key}?" do
        roles.pluck(:position).include?(key)
      end
    end
  end
end
