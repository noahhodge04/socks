class ApplicationService
  def self.call(**args)
    new(**args).call
  end

  def initialize(**kwargs)
    kwargs.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
