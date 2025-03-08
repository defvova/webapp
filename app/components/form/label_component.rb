# frozen_string_literal: true

class Form::LabelComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
		<%= @form.label(
			@name,
			{ **@options,
				class: cn(
					"text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70",
					@options[:class]
				)
			}
		) %>
  ERB

  def initialize(form, name, options = {})
    @form = form
    @name = name
    @options = options
  end
end
