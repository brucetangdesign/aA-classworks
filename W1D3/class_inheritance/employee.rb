class Employee
    attr_reader :name, :salary
    def initialize(name, salary, title, boss=nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end