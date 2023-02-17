class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_q, only: [:index, :search]
  def new
    @post = Post.new
  end

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.page(params[:page]).per(10).order(created_at: :desc)

    @q = Post.ransack(params[:q])
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
    @reviews = @post.reviews.page(params[:page]).per(15).order(created_at: :desc)
    @bookmarks_count = Bookmark.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @q = @tag.posts.ransack(params[:q])
    else
      @q = Post.ransack(params[:q])
    end
    @results = @q.result.page(params[:page]).per(10).order(created_at: :desc).distinct
  end

  # def multiple
  #   @multiple_params = reservation_multiple_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
  #   @reservations = Reservation.multiple(@multiple_params).joins(:post)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
  # end

  private

  def set_q
    @q = Post.ransack(params[:q])
    @results = @q.result
  end

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
      :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
      :activity_saturday, :activity_sunday, :holiday, :business_time, :post_comment,
      :address, :lat, :lng, tag_ids: [])
  end

  # ランサックしようせずに絞り込み用
  # def reservation_multiple_params
  #   params.fetch(:multiple, {}).permit(:address, tag_ids: [])
  #   #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
  #   #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  # end

end
