require 'spec_helper'

describe Experience, :type => :model do
  
  it "should not save blank programs" do
    category = Category.create(name: "Tour", description: "Some description")
    params = {experience: {
      title: "title", description: "Some description", category_id: category.id,duration: 10, duration_type: "Days", max_group_size: 30,
                                  programs_attributes:[
                                  {when: "", what: ""},
                                  {when: "10.30-11.30", what: "Meet in Town hall square"},
                                  {when: "10.30-12.00", what: "Old town tour Etc."},
                                  {when: "", what: ""} ]
    }}
    
    experience = Experience.create(params[:experience])
                                  
    expect(experience.programs.size).to eq 2
  end
end
