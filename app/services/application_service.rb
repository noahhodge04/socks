require "ostruct"

class ApplicationService < OpenStruct
  def self.call(**args)
    new(**args).call
  end

  def initialize(**kwargs)
    kwargs.each do
      
    end
  end

  def method_missing(method)
    self[method] || super
  end
end