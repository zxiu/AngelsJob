module ContactHelper
  def full_name
    fn = String.new
    fn += self.try(:first_name)
    fn += " "
    fn += self.try(:last_name)
  end

  def title
    if self.try("female?")
      title = "Mrs."
    elsif self.try("male?")
      title = "Mr."
    else
      title = "Mrs. or Mr."
    end
  end

  def full_name_with_title
    title + " " + full_name
  end

end
