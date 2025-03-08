# frozen_string_literal: true

class Card::ContentComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn('p-6 pt-0', @cl) %>"><%= content %></div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
