class Doctor
  attr_reader(:name, :specialty, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  define_method(:save) do
    doctor = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = doctor.first.fetch('id').to_i()
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&(self.specialty().==(another_doctor.specialty())).&(self.id().==(another_doctor.id()))
  end

  define_method(:patients_doctor_assignment) do
    patients_list = []
    returned_patient_list = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
    returned_patient_list.each() do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients_list.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id, :id => id}))
    end
    patients_list
  end

end
