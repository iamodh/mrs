class RegistrationsController < ApplicationController
  before_action :set_course, only: %i[ new ]
  
  def new
    @registration = @course.registrations.build
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def registration_params
    params.expect(registration: [ :name, :date_of_birth, :phone, :address ])
  end
end
