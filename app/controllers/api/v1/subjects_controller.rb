class Api::V1::SubjectsController < ApplicationController
 before_action :find_subject, only: [:show, :update, :destroy]
def index
  @subjects = Subject.all
  render json: @subjects
 end
def show
  render json: @subject
 end
def create
  @subject = Subject.new(subject_params)
  if @Subject.save
   render json: @subject
  else
   render error: { error: 'Unable to create Subject.'}, status: 400
  end
 end
def update
  if @subject
   @Subject.update(subject_params)
   render json: { message: 'Subject successfully update.'}, status:200
  else
   render json: { error: 'Unable to update Subject.'}, status:400
  end
 end
def destroy
  if @subject
   @Subject.destroy
   render json: { message: 'Subject successfully deleted.'}, status:200
else
   render json: { error: 'Unable to delete Subject. '}, status:400
  end
 end
private
def subject_params
  params.require(:subject).permit(:subject, :likes, :user_id)
 end
def find_subject
  @subject = Subject.find(params[:id])
 end
end