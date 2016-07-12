require ('spec_helper')

describe(Doctor) do
  describe ('#name') do
    it ('tells you the doctors name') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :specialty_id => nil, :id => nil})
      expect(test_doctor.name()).to(eq('Dr. Love'))
    end
  end

  describe('#specialty_id') do
    it('tells you the doctors specialty id') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty_id => 1})
      expect(test_doctor.specialty_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('will remain empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the doctor info') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty_id => 1})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('#patients_doctor_assignment') do
    it('will display a list of patients assigned to a particular doctor') do
      test_doctor = Doctor.new({:name => 'Dr. Love', :id => nil, :specialty_id => 1})
      test_doctor.save
      patient1 = Patient.new({:name => 'Bob', :birthday => '1991-01-01', :doctor_id => test_doctor.id()})
      patient1.save()
      patient2 = Patient.new({:name => 'Jill', :birthday => '1992-02-02', :doctor_id => test_doctor.id()})
      patient2.save()
      expect(test_doctor.patients_doctor_assignment()).to(eq([patient1, patient2]))
    end
  end

  describe('.doctor_list_alpha') do
    it('will return an alphabetical list of doctors') do
      test_doctor = Doctor.new({:name => 'Dr. Matthews', :id => nil, :specialty_id => 1})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => 'Dr. Jones', :id => nil, :specialty_id => 2})
      test_doctor2.save()
      expect(Doctor.doctor_list_alpha()).to(eq([test_doctor2, test_doctor]))
    end
  end



end
