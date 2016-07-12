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

  describe('.all') do
    it('will remain empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the doctor info') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty => 'Family'})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('#patients_doctor_assignment') do
    it('will display a list of patients assigned to a particular doctor') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty => 'Family'})
      test_doctor.save
      patient1 = Patient.new({:name => 'Bob', :birthday => '1991-01-01', :doctor_id => test_doctor.id()})
      patient1.save()
      patient2 = Patient.new({:name => 'Jill', :birthday => '1992-02-02', :doctor_id => test_doctor.id()})
      patient2.save()
      expect(test_doctor.patients_doctor_assignment()).to(eq([patient1, patient2]))
    end
  end
end
