# frozen_string_literal: true

class GetFoodById
  prepend SimpleCommand
  def initialize(req_body)
    @req_body = req_body
  end

  def call

  end
end
