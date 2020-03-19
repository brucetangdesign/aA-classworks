require_relative "employee.rb"

class Manager < Employee
    attr_reader :employees
    def initialize(name, salary, title, boss=nil)
        @employees = []
        super(name, salary, title, boss=nil)
    end

    def add_subordinates(employees)
        managers = employees.select { |employee| employee.class == Manager }
        managers.each { |employee| @employees.concat(employee.employees) }

        @employees.concat(employees)
    end

    def bonus(multiplier)
        @employees.map{ |employee| employee.salary }.inject { |sum, n| sum + n} * multiplier
    end
end