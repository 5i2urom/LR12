# frozen_string_literal: true
class SeqShow
    include ActiveModel::Model # примешиваем методы для модели из ActiveModel
    include ActiveModel::Validations # примешиваем методы для валидаций из ActiveModel
  
    attr_accessor :num, :str

    validates :num, :str, presence: { message: ' не может быть пустым' }
    validates :num, format: { with: /\d+/, message: ' должен быть натуральным числом' }
    validates :str, format: { with: /\A-?\d+(\d+)?(\s-?\d+(\d+)?)*\s*\z/, message: ' должна быть последовательностью чисел' }
end