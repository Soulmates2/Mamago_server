class DialogsController < Api::BaseController
  before_action :set_dialog, only: [:update, :translate]

  def create
    @dialog = DialogService.create_dialog(dialog_params.merge(user: current_user))
    # render json: api_json_result(data: @spots.map { |i| DialogSerializer.new(i).as_json })
    # render json: api_json_result(data: DialogSerializer.new(@spot).as_json)

    # render json: MyModel.new(level: 'awesome'), adapter: :json
  end

  def update
    @dialog = DialogService.update_dialog(
      @dialog,
      dialog_params.merge(user: current_user)
      )
  end


  private

  def set_dialog
    @dialog = Dialog.find(params[:id])
  end

  def dialog_params
    params.permit(:target, :source, :complete, :feedback, :original, :user_intention,)
  end

  def dialog_update_params
    params.require(:dialog).permit(:id, :source, :target, :user_id, :complete, :feedback, :question_id, :original, :translated, :comprehended, :user_intention, :user_intention_translated)
  end
end