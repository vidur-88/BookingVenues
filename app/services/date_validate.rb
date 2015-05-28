class DateValidation
  #
  # <description>
  # => check start and end date not in the pasr
  # @param [<date>] start_date <description>
  # @param [<date>] end_date <description>
  #
  # @return [<boolean>] <description> false if start and end date in past, else true
  # 
  def self.date_cannot_be_in_the_past(start_date, end_date)
    if start_date.present? && end_date.present? && start_date < Date.today && end_date < Date.today
      return false
    else
      return true
    end
  end

  #
  # <description>
  # => check end date should be after the start date
  #
  # @param [<date>] start_date <"YYYY-MM-DD">
  # @param [<date>] end_date <"YYYY-MM-DD">
  #
  #
  # @return [<type>] <description>
  # 
  def self.end_date_should_be_greater_than_start(start_date, end_date)
    return start_date > end_date
  end
end

