# frozen_string_literal: true

# operates with a sequence
class SeqController < ApplicationController
  include SeqHelper

  before_action :authorize

  def input; end

  def show
    @seq = SeqShow.new(seq_params)
    m = perfect(seq)
    @all_seqs = m[0]
    @count = m[1]
    @longest = @all_seqs.max { |s1, s2| s1.split(' ').length <=> s2.split(' ').length }
  end

  # def self.authenticate(email, password)
  #   user = find(email)
  #   return nil if user.nil?
  #   return user if user.has_password?(password)
  # end

  private

  def seq_params
    params.permit(:num, :str)
  end
end
