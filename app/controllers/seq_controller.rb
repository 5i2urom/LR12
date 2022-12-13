# frozen_string_literal: true

# operates with a sequence
class SeqController < ApplicationController
  include SeqHelper

  def input; end

  def show
    @seq = SeqShow.new(seq_params)
    m = perfect(seq)
    @all_seqs = m[0]
    @count = m[1]
    @longest = @all_seqs.max { |s1, s2| s1.split(' ').length <=> s2.split(' ').length }
  end

  private

  def seq_params
    params.permit(:num, :str)
  end
end
