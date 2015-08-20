class HotalsController < ApplicationController
  
  def new
    @hotal = Hotal.new
  end
  
  def create 
    @hotal = Hotal.new(params[:hotal])
     #puts @hotal.schema_format
    @hotal.password = Digest::MD5.hexdigest(@hotal.password)
    if @hotal.save
        flash[:notice] = "保存成功！"
        redirect_to :action => 'index'
      else
        render 'new'
      end
  end
  
  def index
    @hotals = Hotal.all
   
  end
  
  def show
    @hotal = Hotal.find(params[:id])
  end
   
  def edit
    @hotal = Hotal.find(params[:id])
  end
  
  def update
    @hotal = Hotal.find(params[:id])
    if @hotal.update_attributes(params[:hotal])
      flash[:notice] = "保存成功！"
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end
    
  def destroy
    @hotal = Hotal.find(params[:id])
    @hotal.destroy
    flash[:notice] = "删除成功！"
    redirect_to :action => 'index'
  end
  
  
  
  def login
      @hotal = Hotal.find(params[:id])
      unless request.get?
          username = params[:hotal][:username]
          password = params[:hotal][:password]
          @hint = "ok"
          @hotal = Hotal.find_by_name(username)
          if @hotal.class == NilClass
            @hint = 'Unregisted Username!'
          elsif @hotal.password == params[:hotal][:password]
            @hint = "Welcome back, "
            redirect_to :controller => 'login', :action => 'index'
          else
            @hint = "Login failed, please check up you info"
          end        
       end
   end
end
