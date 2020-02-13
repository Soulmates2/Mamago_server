class Api::DialogsController < Api::BaseController
  before_action :set_dialog, only: [:update, :translate]

  def create
    source = params[:source]
    target = params[:target]

    dialog = DialogService.create_dialog(target: target, source: source, user: current_user)

    render json: { dialog: dialog }
  end

  def update
    original = params[:original]
    feedback = params[:feedback]
    user_intention = params[:user_intention]
    complete = params[:complete]

    dialog = DialogService.update_dialog(
      @dialog,
      original: original,
      feedback: feedback,
      user_intention: user_intention,
      complete: complete
      )

    render json: { dialog: dialog }
  end

  private

  def set_dialog
    @dialog = Dialog.find(params[:id])
  end

  def create_params
    params.permit(:target, :source, :user)
  end

  def dialog_params
    params.permit(:target, :source, :complete, :feedback, :original, :user_intention)
  end

  def dialog_update_params
    params.require(:dialog).permit(:id, :source, :target, :user_id, :complete, :feedback, :question_id, :original, :translated, :comprehended, :user_intention, :user_intention_translated)
  end
end