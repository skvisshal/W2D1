class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers.push(teacher)
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students.push(student)
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.any? {|ele| ele == student}
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student].push(grade)
            return true
        else
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if !enrolled?(student) || !@grades.include?(student)
        @grades[student].inject(0) {|acc, el| acc + el} / @grades[student].length
    end
end
