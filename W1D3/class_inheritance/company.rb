require_relative "employee.rb"
require_relative "manager.rb"

class Company
    def initialize
        @employees = Hash.new
    end

    def add_employee(name,salary,title, boss=nil)
        if title == "Founder" || title.include?("Manager")
            @employees[name] = Manager.new(name,salary,title,boss)
        else
            @employees[name]git status = Employee.new(name,salary,title,boss)
        end
    end

    def get_bonus(name, multiplier)
        @employees[name].bonus(multiplier)
    end
end

c = Company.new

ned = c.add_employee("Ned",1000000,"Founder")
darren = c.add_employee("Darren",78000,"TA Manager","Ned")
shawna = c.add_employee("Shawna",12000,"TA","Darren")
david = c.add_employee("David",10000,"TA","Darren")

darren.add_subordinates([shawna,david])
ned.add_subordinates([darren])

p c.get_bonus("Ned",2)