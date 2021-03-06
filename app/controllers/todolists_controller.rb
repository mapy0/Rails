class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  def create
    # １. データを新規登録するためのインスタンス作成
   @list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
     # ３. トップ画面へリダイレクト
    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
    else
    render :new
    end
  end
  
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
   list = List.find(params[:id])
   list.destroy
   redirect_to todolists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end