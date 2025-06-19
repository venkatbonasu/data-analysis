class Employee:
    def __init__(self, emp_id, emp_name, emp_salary, emp_department):
        self.emp_id = emp_id
        self.emp_name = emp_name
        self.emp_salary = emp_salary
        self.emp_department = emp_department

    def assign_department(self, new_department):
        self.emp_department = new_department

    def calculate_emp_salary(self, salary, hours_worked):
        if hours_worked > 50:
            overtime = hours_worked - 50
            overtime_amount = overtime * (salary / 50)
            total_salary = salary + overtime_amount
        else:
            total_salary = salary
        self.emp_salary = total_salary
        return total_salary

    def print_employee_details(self):
        print(f"Employee ID: {self.emp_id}")
        print(f"Employee Name: {self.emp_name}")
        print(f"Employee Salary: {self.emp_salary}")
        print(f"Employee Department: {self.emp_department}")

emp = Employee(101, "Raj", 50000, "IT")
emp.print_employee_details()
print()

new_salary = emp.calculate_emp_salary(emp.emp_salary, 55)
print(f"Updated Salary with overtime: {new_salary}")

emp.assign_department("HR")
emp.print_employee_details()
