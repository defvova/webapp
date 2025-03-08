# frozen_string_literal: true

class Card::HeaderComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn('flex flex-col space-y-1.5 p-6', @cl) %>"><%= content %></div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
