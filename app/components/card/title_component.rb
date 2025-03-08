# frozen_string_literal: true

class Card::TitleComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn('font-semibold leading-none tracking-tight', @cl) %>"><%= content %></div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
