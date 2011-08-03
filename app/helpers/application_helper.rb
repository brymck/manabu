# coding: utf-8

module ApplicationHelper
  def textile(text)
    html = RedCloth.new(text).to_html
    html = Sanitize.clean html, Sanitize::Config::BASIC
    html.html_safe
  end

  def title
    "Manabu"
  end

  def copyright_years
    base_year = 2010
    current_year = Time.now.year
    if current_year > base_year
      "#{base_year}‒#{current_year}"
    else
      base_year
    end
  end
end
