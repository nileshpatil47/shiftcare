require 'spec_helper'
require_relative '../../app/lib/shift'

describe Shift do
  let(:shift) { Shift.new }
  let(:data) {
    [
      { "id": 1, "full_name": "John Doe", "email": "john.doe@gmail.com" },
      { "id": 2, "full_name": "Jane Smith", "email": "jane.smith@yahoo.com" },
      { "id": 3, "full_name": "Alex Johnson", "email": "alex.johnson@hotmail.com" },
      { "id": 4, "full_name": "Michael Williams", "email": "michael.williams@outlook.com" },
      { "id": 5, "full_name": "Emily Brown", "email": "emily.brown@aol.com" },
      { "id": 6, "full_name": "William Davis", "email": "william.davis@icloud.com" },
      { "id": 7, "full_name": "Olivia Miller", "email": "olivia.miller@protonmail.com" },
      { "id": 8, "full_name": "James Wilson","email": "james.wilson@yandex.com" },
      { "id": 9, "full_name": "Ava Taylor","email": "ava.taylor@mail.com" },
      { "id": 10, "full_name": "Michael Brown","email": "michael.brown@inbox.com" },
      { "id": 11, "full_name": "Sophia Garcia","email": "sophia.garcia@zoho.com" },
      { "id": 12, "full_name": "Emma Lopez","email": "emma.lopez@protonmail.ch" },
      { "id": 13, "full_name": "Liam Martinez","email": "liam.martinez@fastmail.fm" },
      { "id": 14, "full_name": "Isabella Rodriguez","email": "isabella.rodriguez@me.com" },
      { "id": 15, "full_name": "Another Jane Smith","email": "jane.smith@yahoo.com" }
    ]
  }

  it "initialize shift object" do
    expect(shift).to be_a_kind_of(Shift)
    expect(shift.data).to be_nil
  end

  context "match method" do
    let(:output) { ["Jane Smith", "Another Jane Smith"] }
    before do
      shift.data = data
    end

    it "check object basic attributes" do
      expect(shift).to be_a_kind_of(Shift)
      expect(shift.data).not_to be_nil
    end

    it "check match behivour" do
      expect(shift.send(:match, 'Jane')).to eql output
    end

    it "with small case" do
      expect(shift.send(:match, 'jane')).to eql output
    end

    it "with capital case" do
      expect(shift.send(:match, 'JANE')).to eql output
    end

    it "with no match" do
      expect(shift.send(:match, 'ABCD')).to be_empty
    end
  end

  context "duplicate method" do
    let(:output) { {"jane.smith@yahoo.com"=>2} }
    before do
      shift.data = data
    end

    it "check object basic attributes" do
      expect(shift).to be_a_kind_of(Shift)
      expect(shift.data).not_to be_nil
    end

    it "check duplicate behivour" do
      expect(shift.duplicate).to eql output
    end
  end
end
