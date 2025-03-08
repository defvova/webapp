# frozen_string_literal: true

class Form::InputComponent < ViewComponent::Base
  delegate :cn, to: :helpers

  erb_template <<-ERB
		<%= @form.send(
			@input_type,
			@name,
			{ **@options,
				class: cn(
					"flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-base "\
					"shadow-sm transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium "\
				 	"file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none "\
					"focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
					@options[:class]
				)
			}
		) %>
  ERB

  def initialize(form, input_type, name, options = {})
    @form = form
    @name = name
    @input_type = input_type
    @options = options
  end
end
