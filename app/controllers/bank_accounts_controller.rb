class BankAccountsController < ApplicationController
  before_action :find_bank_account, only: [:show, :edit, :destroy, :update]

#Get request / bank_accounts (url)
  def index
    @bank_accounts = current_user.bank_accounts
  end

#Get request /bank_accounts/:id
  def show
  end

#creates in memory and renders form - Get request bank_accounts/new
  def new
    @bank_account = current_user.bank_accounts.new
  end

#GET, renders form /bank_accounts/edit
  def edit
  end

#PUT/Patch /bank_accounts/:id
  def update
    if @bank_account.update(bank_account_params)
      redirect_to @bank_account
    else
      render :edit
    end
  end

#Post /bank_accounts
  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    if @bank_account.save
      redirect_to @bank_account
    else
      render :new
    end
  end

#Delete /bank_accouns/:id
  def destroy
    @bank_account.destroy
    redirect_to bank_accounts_url
  end

  private
    #call back method to find a user's bank acct
    def find_bank_account
      @bank_account = current_user.bank_accounts.find(params[:id])
    end

    def bank_account_params
      params.require(:bank_account).permit(:amount, :institution, :active, :body)
    end
end
