/* Create Tables */

CREATE TABLE project (
  project_id INT PRIMARY KEY,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7,2),
  actual_hours DECIMAL(7,2),
  difficulty INT,
  notes TEXT
);

CREATE TABLE material (
  material_id INT PRIMARY KEY,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7,2),
  FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE step (
  step_id INT PRIMARY KEY,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE category (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(128) NOT NULL
);
CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (project_id, category_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);


-- DROP TABLES
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;

-- CREATE TABLES
CREATE TABLE category (
    category_id INT AUTO_INCREMENT,
    category_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE project (
    project_id INT AUTO_INCREMENT,
    project_name VARCHAR(128) NOT NULL,
    estimated_hours DECIMAL(7,2),
    actual_hours DECIMAL(7,2),
    difficulty INT,
    notes TEXT,
    PRIMARY KEY (project_id)
);

CREATE TABLE material (
    material_id INT AUTO_INCREMENT,
    project_id INT,
    material_name VARCHAR(128) NOT NULL,
    num_required INT,
    cost DECIMAL(7,2),
    PRIMARY KEY (material_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE step (
    step_id INT AUTO_INCREMENT,
    project_id INT,
    step_text TEXT NOT NULL,
    step_order INT,
    PRIMARY KEY (step_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
    project_id INT,
    category_id INT,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);
