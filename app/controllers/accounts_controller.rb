class AccountsController < ApplicationController
  load_and_authorize_resource
  before_filter :require_user
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
	@accounts = @accounts - current_user.accounts
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
	@payments = @account.payments
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
	@user = current_user
    @account = @user.accounts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
	params[:account][:user_id]=current_user.id
	@account = Account.new(params[:account])
	
	
	
    respond_to do |format|
      if @account.save
		current_user.accounts << @account
        format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to ApplicationCon, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_path }
      format.json { head :ok }
    end
  end
  
  # POST /accounts/id/resgister
  # register an account for the watch list
  
  def register
	@account = Account.find(params[:id])
	
	@account.users << current_user
	
	 respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :ok }
    end
	
  end
  
  # POST /accounts/id/unresgister
  # un_register an account for the watch list
  
  def unregister
	@account = Account.find(params[:id])
	
	current_user.accounts.delete(@account) if current_user.accounts
	
	 respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :ok }
    end
	
  end
  
end
