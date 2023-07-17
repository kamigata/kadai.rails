class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 以下は削除しないでください

  # バリデーションエラー時の処理
  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error

  private

  # バリデーションエラー時のレスポンス処理
  def render_validation_error(exception)
    render json: { error: exception.record.errors }, status: :unprocessable_entity
  end
end
