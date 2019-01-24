class Patient
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @appointments = []
    end

    def new_appointment(doctor, date)
        appointment = Appointment.new(self, date, doctor)
        @appointments << appointment
        appointment
    end

    def appointments
        @appointments
    end

    def doctors
        doctors = []
        Appointment.all.select do |appointment|
            if !doctors.include?(appointment.doctor) && appointment.patient == self
                doctors << appointment.doctor
            end
        end
        doctors
    end

    def self.all
        @@all
    end

end