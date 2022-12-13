# frozen_string_literal: true

class SeqShow
  include ActiveModel::Model # примешиваем методы для модели из ActiveModel
  include ActiveModel::Validations # примешиваем методы для валидаций из ActiveModel
  attr_accessor :num, :str

  validates :num, :str, presence: { message: 'не может быть пустым' }
  validates :num, format: { with: /\A\d+\z/, message: 'должен быть натуральным числом' }
  validates :str,
            format: { with: /\A-?\d+(\d+)?(\s-?\d+(\d+)?)*\s*\z/,
                      message: 'должна быть последовательностью чисел' }

  def length_valid?
    errors.add(:str, ":длина не равна #{num}") if str.split(' ').length != num.to_i
  end

  validate :length_valid?
end
