module CvHelper
  def make_cover_letter(offer:, cv_template: current_user.cv_templates.first)
    liquid_template = Liquid::Template.parse(cv_template.content) unless cv_template.blank?
    unless liquid_template.blank?
      contact = offer.contact
      salutation = "Dear "
      if contact.male?
        salution = salutation + "Mr. "
      elsif contact.female?
        salution = salutation + "Mrs. "
      else
        salution = salutation + "Mr. or Mrs. "
      end
      salution = salution + contact.full_name
      sign = current_user.personal_info.full_name

      source = offer.agent.blank? ? 'internet' : offer.agent.name

      cover_letter = liquid_template.render('salutation' => salution,
                                            'offer' => "\"#{offer.title}\"",
                                            'source' => source,
                                            'date' => Time.now.strftime("%F"),
                                            'sign' => sign)
    end
    return cover_letter
  end
end
