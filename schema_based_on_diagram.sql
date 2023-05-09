CREATE TABLE patients (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100), 
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(100)
);
  
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100)
);
    
CREATE TABLE med_history_treatments (
  id SERIAL PRIMARY KEY,
  med_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX index_medical_histories_patient_id
ON medical_histories(patient_id);

CREATE INDEX index_invoices_medical_history_id
ON invoices(medical_history_id);

CREATE INDEX index_invoice_items_invoice_id
ON invoice_items(invoice_id);

CREATE INDEX index_invoice_items_treatment_id
ON invoice_items(treatment_id);

CREATE INDEX index_med_history_treatments_medical_history_id
ON med_history_treatments(med_history_id);

CREATE INDEX index_med_history_treatments_treatment_id
ON med_history_treatments(treatment_id);


  
