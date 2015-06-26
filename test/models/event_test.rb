require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)

  context "an event with a start date before end date" do
    setup do
      @event = Event.new(start_date: Date.today, end_date: Date.today + 1)
    end

    should "pass validation" do
      assert @event.valid?
    end
  end

  context "an event with a start date and end date the same" do
    setup do
      @event = Event.new(start_date: Date.today, end_date: Date.today)
    end

    should "fail validation" do
      refute @event.valid?
    end
  end

  context "an event with a start date after the end date" do
    setup do
      @event = Event.new(start_date: Date.today + 1, end_date: Date.today)
    end

    should "fail validation" do
      refute @event.valid?
    end
  end
end
