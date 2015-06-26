class DateValidator < ActiveModel::Validator
  def validate(record)
    start_date = record.send(options[:start_date])
    end_date = record.send(options[:end_date])
    record.errors[options[:start_date]] << 'Must be before end date' unless start_date < end_date
  end

end