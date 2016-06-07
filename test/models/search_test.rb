require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  describe Search do
    it "uses v2 of the API" do
      assert_equal "https://www.googleapis.com/qpxExpress/v1/", Search::BASE_URL
    end
  end


end
