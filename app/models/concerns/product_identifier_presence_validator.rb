class ProductIdentifierPresenceValidator < ActiveModel::Validator
  def validate(record)
    if record.url.present?
      if record.name.present? || record.manufacturer.present?
        record.errors[:base] << "Cannot specify both a URL and a name/manufacturer. Choose one identifier."
      end
    elsif record.name.present? || record.manufacturer.present?
      if !record.name.present?
        record.errors[:name] << "You must specify both a name and a manufacturer."
      end
      if !record.manufacturer.present?
        record.errors[:manufacturer] << "You must specify both a name and a manufacturer."
      end
    else
      record.errors[:base] << "You must specify either a URL or a name/manufacturer."
    end
  end
end