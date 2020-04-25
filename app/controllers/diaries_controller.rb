class DiariesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @diary = Diary.new(user_id: @user.id)
  end

  def index
    @user = User.find(params[:user_id])
    @diaries = Diary.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(5)
  end
  
  def all_index
    
    @diaries = Diary.page(params[:page]).per(5).order(created_at: :desc)

    # @page = 5
    # if params[:page].present?
    #   @offset = (params[:page].to_i - 1)*@page
    # else
    #   @offset = 0
    # end
    # @diaries = Diary.limit(@page).offset(@offset)
    # if @params_page.present?
    #   @params_page = params[:page]
    # else
    #   @params_page = 1
    # end
    # @diaries = Diary.all.order(created_at: :desc)
  end
  
  def nonsubmit
    # 未提出者　--> その日のDialyレコードがない生徒 --> user_type = "s"で created_at がその日のレコードがない
    # allusers = [1,2,3,4,5,6,7,8]
    #全員　　@users
    # submitusers = [2,5,6]
    #提出済           @submit_users
    # [1,3,4,7,8]  #のuserインスタンス
    if params[:search_date].nil?
      @search_date = Date.today
    else
      if params[:search_date].to_date > Date.today
        @future = "f"
      end
      @search_date = params[:search_date]
    end
    logger.debug("================== 検索日付 = #{@search_date}")
    
    @users = User.where(user_type: "s")
    @users.each do |user|
      logger.debug("================== 全生徒 = #{user.id}")
    end    
    
    
    
    @diaries = Diary.where(day_of_diary: @search_date)
    submit_user_id =[]
    @diaries.each do |diary|
      submit_user_id << diary.user_id
      logger.debug("================== 提出済diary = #{diary.id} 提出者 = #{diary.user_id}")
    end     

    @submit_users = User.where(id: submit_user_id)
    @submit_users.each do |submit_user|
      logger.debug("================== 提出済生徒 = #{submit_user.id}")
    end     
    
    @nonsubmit_users = @users - @submit_users
    @nonsubmit_users.each do |ns|
    logger.debug("================== 差分 = #{ns.id}")
    end
    
    @diary = Diary.new
    
    # @search_days = user_search_params
    
  end

  def show
    @diary = Diary.find_by(id: params[:id])
    @user = @diary.user_id
  end
  
  def create
        @diary = Diary.new(diary_params)
        if @diary.save
            flash[:notice] = "アップされました"
            redirect_to all_diaries_path
        else
            redirect_to new_user_diary_path(current_user)
        end
  end
  
  private 
      def diary_params
          params.require(:diary).permit({images: []}, :video, :title, :content, :user_id, :day_of_diary).merge(user_id: current_user.id)
      end
end
