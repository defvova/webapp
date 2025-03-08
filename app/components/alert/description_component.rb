# frozen_string_literal: true

class Alert::DescriptionComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<div class="<%= cn("text-sm [&_p]:leading-relaxed", @cl) %>"><%= content %></div>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
