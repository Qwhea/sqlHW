CREATE TABLE Employeers(
employeer_id SERIAL PRIMARY KEY,
employeer_name VARCHAR(100) NOT NULL,
department_id INT REFERENCES Departments(department_id),
boss_id INT,

CONSTRAINT fk_boss FOREIGN KEY (boss_id) REFERENCES Employeers(employeer_id) ON DELETE SET NULL
)

CREATE TABLE Departments(
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(100) NOT NULL
)

SET search_path TO EMP