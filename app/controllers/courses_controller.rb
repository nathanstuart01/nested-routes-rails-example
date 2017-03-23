class CoursesController < ApplicationController
  before_action :set_school # this is a different thing to do for a nested model, call it on every school
  before_action :set_course, only: [:show, :edit, :update, :destroy]#this you do for every controller setup #except could work

  def index
    @courses = @school.courses #sets the index for the courses from that specific school
  end

  def show
  end

  def new
    @course = @school.courses.new
  end

  def create
    @course = @school.courses.new(course_params)
    if @course.save
      redirect_to school_course_path(@school, @course) #the objects passed in comes from the rake routes
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to school_course_path(@school, @course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to school_courses_path(@school) #if in rake routes you see the id in the url pattern, pass in the @with the variable in parenthesis for it
  end

# strong parameters
private
  def course_params
    params.require(:course).permit(:name, :code, :num_students, :active)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_course
    # NOT best practice!!!!!
    # @course = Course.find(params[:id])
    # Best practice way - scopes the course to the school, prevents users from changing url, allows you to find courese only within the school that has them
    # remember to scope associations with the correct place
    @course = @school.courses.find(params[:id])
  end
end
