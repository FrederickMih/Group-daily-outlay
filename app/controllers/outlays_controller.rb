class OutlaysController < ApplicationController
  before_action :authenticate_user!

  def new
    @outlay = Outlay.new
  end

  def index

    @most_recent_outlays = my_outlays


    @outlays = Outlay.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).joins(:groups).order(:created_at)
       @skip_footer = true
  end

  def index_no_group
    @outlays = Outlay.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).left_outer_joins(:groups).where('groups.id IS NULL')
    render 'index'
  end

  def create
    @outlay = Outlay.new(outlay_params)
    @outlay.author_id = current_user.id
    # ids = params[:outlay][:group].reject(&:empty?)
    # groups = Group.find(ids)
    # @outlay.groups << groups
    if @outlay.save
      @outlay.outlay_groups.create(show_group_id)
      flash[:success] = ['An Item Is Added']
      redirect_to outlays_path
    else
      flash[:danger] = @outlay.errors.full_messages
      redirect_back(fallback_location: new_outlay_path)
    end
  end

  # def create
  #  @outlay = Outlay.new(outlay_params)
   
  #  if @outlay.save
  #     @outlay.outlay_groups.create(show_group_id)
  #     redirect_to outlays_path, notice: 'An Item was successfully registered'
  #  else
  #    flash[:danger] = @outlay.errors.full_messages
  #    redirect_back(fallback_location: new_outlay_path) 
  #  end

  # end


  def external_outlay
    @external = my_outlays.left_joins(:outlay_groups).where('group_id IS NULL')
    @total_outlay = @external.sum(:amount)
  end



  private

  def set_outlay
    @outlay = Outlay.find(params[:id])
  end

  def outlay_params
    params.require(:outlay).permit(:name, :amount, :user_id, group_ids: [])
  end
   
  def show_group_id
    params.require(:travel).permit(group_id)
  end

  def my_outlays
    current_user.outlays.includes(:groups).recent_first
  end


end
