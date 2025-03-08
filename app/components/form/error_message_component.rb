# frozen_string_literal: true

class Form::ErrorMessageComponent < ViewComponent::Base
  erb_template <<-ERB
  	<% if @invalid %>
   		<p class="text-[0.8rem] font-medium text-destructive"><%= @model.errors.full_messages_for(@attr_name).first %></p>
   	<% end %>
  ERB

  def initialize(model, attr_name)
    @invalid = model.errors.include?(attr_name)
    @model = model
    @attr_name = attr_name
  end
end
