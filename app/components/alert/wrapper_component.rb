# frozen_string_literal: true

class Alert::WrapperComponent < ViewComponent::Base
  include Cva::Helper

  delegate :cn, to: :helpers

  cva(
    "bg-card relative w-full rounded-lg border px-4 py-3 text-sm "\
    "[&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:left-4 [&>svg]:top-4 [&>svg]:text-foreground [&>svg~*]:pl-7",
    {
      variants: {
        variant: {
          default: "bg-background text-foreground",
          success: "bg-alert-success text-alert-success-text dark:border-alert-success-border [&>svg]:text-alert-success-text",
          error: "bg-alert-error text-alert-error-text dark:border-alert-error-border [&>svg]:text-alert-error-text",
          destructive:
            "border-destructive/50 text-destructive dark:border-destructive [&>svg]:text-destructive"
        }
      },
      defaultVariants: {
        variant: "default"
      }
    }
  )

  erb_template <<-ERB
  	<div class="<%= cn(self.class.variants(@variants), @classes) %>">
    	<%= content %>
    </div>
  ERB

  def initialize(variants = {}, classes = nil)
    @variants = variants
    @classes = classes
  end
end
