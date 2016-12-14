class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, except: [:index, :new, :create]

def index
  @jobs = current_user.jobs.all
end

def show
end

def new
  @job = current_user.jobs.new
end

def create
  @job = current_user.jobs.new(job_params)
  if @job.save
    @job.save_images!(params[:images]) if params[:images].present?
    flash[:success] = 'Job created successfully!'
    redirect_to root_path(@job)
  else
    flash[:error] = 'Something went wrong!'
    render :new
  end
end

def edit
end

def update
  if @job.update(job_params)
    redirect_to root_path(@job), success: 'Job edited successfully!'
  else
    render :edit, error: 'Something went wrong!'
  end
end

def destroy
  if current_user.id != @job.user_id
    flash[:error] = "You are not the creator of that job so you can't delete it."
    redirect_to root_path
  else
  	@job.destroy
  	redirect_to root_path
  end
end

private
  def job_params
    params.require(:job).permit(:title, :date_created, :bio, :employee_creator, :materials_needed)
  end

  def set_job
    @job = Job.find(params[:id])
  end

end
