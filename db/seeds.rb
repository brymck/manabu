# coding: utf-8

# Default to English
I18n.locale = :en

# Create JLPT
@jlpt = Exam.create :name => "Japanese Language Proficiency Test", :abbreviation => "JLPT"
I18n.locale = :ja
@jlpt.update_attribute :name, "日本語能力試験"
I18n.locale = :en

# Create levels of JLPT
%w(N1 N2 N3 N4 N5).each do |n|
  Level.create :name => n, :exam_id => @jlpt.id, :abbreviation => n.downcase
end

# Create sections of JLPT
@sections = []
@sections << Section.create(:name => "Grammar")
@sections << Section.create(:name => "Vocabulary")
@sections << Section.create(:name => "Kanji")
@sections << Section.create(:name => "Reading Comprehension")

# Set parts of JLPT in Japanese
I18n.locale = :ja
@sections[0].update_attribute :name, "文法"
@sections[1].update_attribute :name, "語彙"
@sections[2].update_attribute :name, "漢字"
@sections[3].update_attribute :name, "読解"
I18n.locale = :en

# Add all sections to all levels
Level.find(:all).each do |level|
  Section.find(:all).each do |section|
    level.sections << section
  end
end

# Create me
@me = User.create :name => "Bryan McKelvey", :email => "bryan.mckelvey@gmail.com"
@me.update_attribute :admin, true


# Create authentications for me
Authentication.create(
  :provider => "facebook",
  :uid      => "2724737",
  :user_id  => @me.id
)
Authentication.create(
  :provider => "google",
  :uid      => "https://www.google.com/accounts/o8/id?id=AItOawkjEi8xQ_3R_kE5BZzAqS82QTo9SKqaJsE",
  :user_id  => @me.id
)
Authentication.create(
  :provider => "twitter",
  :uid      => "2724737",
  :user_id  => @me.id
)
