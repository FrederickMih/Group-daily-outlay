class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

   # GET /groups/new
  def new
    @group = Group.new
  end


  def index
    @groups = Group.includes(:user).paginate(page: params[:page], per_page: 3).order(:name).with_attached_icon
     @skip_footer = true
  end

  # GET /groups/1 or /groups/1.json
  def show
    # @group = Group.includes(:outlays, :user).find(params[:id])
     @skip_footer = true
     @group_outlays = @group.outlays.includes(:user)
    #  @amount = @group_outlays.pluck(:amount).sum
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    group = Group.new(group_params)
    group.user_id = current_user.id

    if group.save
      flash[:success] = ['Group has been Added!']
      redirect_to groups_path
    else
      flash[:danger] = group.errors.full_messages
      redirect_back(fallback_location: new_group_path)
    end
    
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
