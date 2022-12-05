# frozen_string_literal: true

# operates with a sequence
class SeqController < ApplicationController
  include SeqHelper
  def input; end

  def show
    m = perfect(seq)
    @all_seqs = m[0]
    @count = m[1]
  end
end
