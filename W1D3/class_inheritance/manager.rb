require_relative "employee.rb"

class Manager < Employee
    def bonus
        @employees.map{ |employee| employee.salary }.inject { |sum, n| sum + n} * multiplier
    end
end