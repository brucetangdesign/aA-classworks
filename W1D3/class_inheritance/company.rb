require_relative "employee.rb"
require_relative "manager.rb"

class Company
    def initialize
        @employees = []
    end

    def add_employee(name,salary,title, boss=nil)
        if title == "Founder" || title.include?("Manager")
            @employees << Manager.new(name,salary,title,boss)
        else
            @employees << Employee.new(name,salary,title,boss)
        end
    end
end

c = Company.new

c.add_employee("Ned","$1,000,000","Founder")
c.add_employee("Darren","$78,000","TA Manager","Ned")
c.add_employee("Shawna","$12,000","TA","Darren")
c.add_employee("David","$10,000","TA","Darren")