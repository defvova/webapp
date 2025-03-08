# frozen_string_literal: true

class Card::WrapperComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn('rounded-xl border bg-card text-card-foreground shadow', @cl) %>">
   		<%= content %>
   	</div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
