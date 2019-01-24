class Doctor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @appointments = []
        @@all << self
    end

    def new_appointment(patient, date)
        appointment = Appointment.new(patient, date, self)
        @appointments << appointment
        appointment
    end

    def appointments
        @appointments
    end

    def patients
        patients = []
        Appointment.all.select do |appointment|
            if !patients.include?(appointment.patient) && appointment.doctor == self
                patients << appointment.patient
            end
        end
        patients
    end

    def self.all
        @@all
    end
end