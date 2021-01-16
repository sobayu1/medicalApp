class RatesController < ApplicationController

    def new
        @rate = Rate.new
    end
end
