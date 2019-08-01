# frozen_string_literal: true

class HealthCheckController < ApplicationController
  # GET / or /health_check
  def main
    render json: {
      meta: {
        name: :pets,
        uptime: uptime_in_hours
      }
    }
  end

  private

  def uptime_in_hours
    proccess_up_time = `stat -c %Y /proc/#{Process.pid}`.split[0].to_i

    (Time.now.to_i - proccess_up_time) / (60 * 60).to_f
  end
end
