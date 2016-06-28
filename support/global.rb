class Global
  class << self
    attr_accessor :timeout
  end

  @timeout = {
      'regular' => 60,
      'double_regular' => 120,
      'stable' => 1,
      'double_stable' => 2,
      'more_stable' => 5,
      'page_load' => 30,
      'wait_for_download' => 180,
  }
end