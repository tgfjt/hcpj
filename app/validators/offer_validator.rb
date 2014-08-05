class OfferValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.project_id.blank? and record.project_name.blank?
      record.errors[attribute] << " が指定されていません"
    end
  end
end