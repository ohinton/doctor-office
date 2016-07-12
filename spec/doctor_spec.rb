require ('spec_helper')

describe(Doctor) do
  describe ('#name') do
    it ('tells you the doctors name') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :specialty => 'Family', :id => nil})
      expect(test_doctor.name()).to(eq('Dr. Love'))
    end
  end

  describe('#specialty') do
    it('tells you the doctors specialty') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty => 'Family'})
      expect(test_doctor.specialty()).to(eq('Family'))
    end
  end

end
