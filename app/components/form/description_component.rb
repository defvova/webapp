# frozen_string_literal: true

class Form::DescriptionComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<p class="<%= cn('text-[0.8rem] text-muted-foreground', @cl) %>"><%= content %></p>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
