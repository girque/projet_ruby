json.array!(@proof_attachments) do |proof_attachment|
  json.extract! proof_attachment, :id, :rage_id, :path
  json.url proof_attachment_url(proof_attachment, format: :json)
end
