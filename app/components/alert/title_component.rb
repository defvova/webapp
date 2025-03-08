# frozen_string_literal: true

class Alert::TitleComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
  	<h5 class="<%= cn("mb-1 font-medium leading-none tracking-tight", @cl) %>">
    	<%= content %>
   	</h5>
  ERB

  def initialize(cl = nil)
    @cl = cl
  end
end
