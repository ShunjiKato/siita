class DraftsController < ApplicationController
  before_action :set_draft, only: [:show, :edit, :update, :destroy]

  # GET /drafts
  # GET /drafts.json
  def index
    @drafts = current_user.drafts.all
    if params[:id].present?
      @draft = current_user.drafts.find(params[:id])
    end
  end

  # GET /drafts/1
  # GET /drafts/1.json
  def show
  end

  # GET /drafts/new
  def new
    @draft = current_user.drafts.build
  end

  # GET /drafts/1/edit
  def edit
  end

  # POST /drafts
  # POST /drafts.json
  def create
    @draft = current_user.drafts.build(draft_params)

    respond_to do |format|
      if @draft.save
        if params[:check_box_post]
          format.html { render :new } unless entry_item
        end
        format.html { redirect_to @draft, notice: 'Draft was successfully created.' }
        format.json { render :show, status: :created, location: @draft }
      else
        format.html { render :new }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drafts/1
  # PATCH/PUT /drafts/1.json
  def update
    respond_to do |format|
      if @draft.update(draft_params)
        if params[:check_box_post]
          format.html { render :new } unless entry_item
        end
        format.html { redirect_to @draft, notice: 'Draft was successfully updated.' }
        format.json { render :show, status: :ok, location: @draft }
      else
        format.html { render :edit }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drafts/1
  # DELETE /drafts/1.json
  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url, notice: 'Draft was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft
      @draft = Draft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draft_params
      params.require(:draft).permit(:title, :content, :user_id)
    end

    def entry_item
      @item = current_user.items.find_by(draft_id: params[:id])
      @item = current_user.items.build if @item.nil?
      @item.title = draft_params[:title]
      @item.content = draft_params[:content]
      @item.user_id = @draft.user_id
      @item.draft_id = @draft.id
      @item.save
    end
end
