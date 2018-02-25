class ApiStatus
  @@success_default = {code: "00000000", msg: "Your request was processed successfully", errors: nil}
  @@error_default = {code: "10000000", msg: "There was an error handling your request", errors: nil}
  @@unauthorized_default = {code: "20000000", msg: "unauthorized"}

  def self.success(options={})
    @@success_default.merge(options)
  end

  def self.error(options={})
    @@error_default.merge(options)
  end

  def self.unauthorized(options={})
    @@unauthorized_default.merge(options)
  end


end