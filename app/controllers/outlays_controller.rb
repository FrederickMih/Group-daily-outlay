class OutlaysController < ApplicationController
     before_action :authenticate_user!

  def new
    @outlay = Outlay.new
  end

  def index
    @outlays = Outlay.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).joins(:groups).order(:created_at)
  end

  def index_no_group
    @outlays = Outlay.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).left_outer_joins(:groups).where('groups.id IS NULL')
    render 'index'
  end

  def create
    @outlay = Outlay.new(outlay_params)
    @outlay.author_id = current_user.id
    ids = params[:outlay][:group].reject(&:empty?)
    groups = Group.find(ids)
    @outlay.groups << groups
    if @outlay.save
      flash[:success] = ['Outlay Added']
      redirect_to outlays_path
    else
      flash[:danger] = @outlay.errors.full_messages
      redirect_back(fallback_location: new_outlay_path)
    end
  end


  private

  def outlay_params
    params.require(:outlay).permit(:name, :amount)
  end
end
