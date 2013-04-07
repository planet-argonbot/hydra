require 'spec_helper'

describe Project do
  describe "Validations" do
    it "should not be valid without a name" do
      project = build(:project, name: nil)
      expect(project).to be_invalid
      expect(project).to have(1).error_on(:name)
    end
  end

  describe "States" do
    let(:project) { create(:project) }

    it "should have an initial state of active" do
      expect(project.aasm_state).to eq 'active'
    end

    it "should transition from active to archived" do
      expect { project.archive! }.to change { project.aasm_state }.from('active').to('archived')
    end

    it "should transition from archived to active" do
      project.archive!
      expect { project.activate! }.to change { project.aasm_state }.from('archived').to('active')
    end
  end
end
