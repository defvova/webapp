module ApplicationHelper
  def cn(*args)
    TailwindMerge::Merger.new.merge(clsx(*args))
  end

  def clsx(*args)
    result = clsx_args_processor(*args)
    result.uniq!
    result.join(" ").presence
  end

  private

  def clsx_args_processor(*args)
    result = []
    complex_keys = []

    args.flatten!
    args.each do |arg|
      next if arg.blank? || arg.is_a?(TrueClass) || arg.is_a?(Proc)
      next result << arg.to_s unless arg.is_a?(Hash)

      arg.each { |key, value| complex_keys << key if value }
    end

    return result if complex_keys.empty?

    result + clsx_args_processor(*complex_keys)
  end
end
