require 'test_helper'

class ProofAttachmentsControllerTest < ActionController::TestCase
  setup do
    @proof_attachment = proof_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proof_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proof_attachment" do
    assert_difference('ProofAttachment.count') do
      post :create, proof_attachment: { path: @proof_attachment.path, rage_id: @proof_attachment.rage_id }
    end

    assert_redirected_to proof_attachment_path(assigns(:proof_attachment))
  end

  test "should show proof_attachment" do
    get :show, id: @proof_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proof_attachment
    assert_response :success
  end

  test "should update proof_attachment" do
    patch :update, id: @proof_attachment, proof_attachment: { path: @proof_attachment.path, rage_id: @proof_attachment.rage_id }
    assert_redirected_to proof_attachment_path(assigns(:proof_attachment))
  end

  test "should destroy proof_attachment" do
    assert_difference('ProofAttachment.count', -1) do
      delete :destroy, id: @proof_attachment
    end

    assert_redirected_to proof_attachments_path
  end
end
