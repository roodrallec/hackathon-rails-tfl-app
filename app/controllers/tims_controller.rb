class TimController < ApplicationController
  TimsUpdater.perform_async
end
