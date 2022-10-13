class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.where(category_id: params[:category_id]).order('created_at DESC')
    @id = params[:category_id]
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @id = params[:category_id]
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    expense = Expense.new(expense_params)
    expense.user_id = current_user.id
    redirect_to category_expenses_path(params[:expense][:category_id])
    if expense.save
      flash[:notice] = 'Expense created successfully'
    else
      flash[:alert] = 'Error occurred while creating the expense'
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  # def update
  #   respond_to do |format|
  #     if @expense.update(expense_params)
  #       format.html { redirect_to expense_url(@expense), notice: "Expense was successfully updated." }
  #       format.json { render :show, status: :ok, location: @expense }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @expense.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :amount, :category_id)
    end
end
