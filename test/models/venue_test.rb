require 'test_helper'

class VenueTest < ActiveSupport::TestCase
	test "find a venue" do
    blah = Venus.find(1)
    assert_not_nil blah
	end
   
end
