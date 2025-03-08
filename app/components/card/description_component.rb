# frozen_string_literal: true

class Card::DescriptionComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn('text-sm text-muted-foreground', @cl) %>"><%= content %></div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
