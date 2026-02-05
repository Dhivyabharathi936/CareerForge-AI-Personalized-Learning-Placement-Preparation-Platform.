-- Seed data for AI-Powered Learning Platform

-- Insert subjects
INSERT INTO subjects (name, code, description, icon, color, display_order) VALUES
('Object-Oriented Programming', 'OOPS', 'Core concepts of OOP including inheritance, polymorphism, encapsulation', 'code', '#3B82F6', 1),
('Database Management Systems', 'DBMS', 'Database design, SQL, normalization, transactions', 'database', '#10B981', 2),
('Operating Systems', 'OS', 'Process management, memory management, file systems', 'server', '#F59E0B', 3),
('Computer Networks', 'CN', 'Network protocols, OSI model, TCP/IP, security', 'network', '#EF4444', 4),
('Core Computer Science', 'CS', 'Computer architecture, digital logic, theory of computation', 'cpu', '#8B5CF6', 5),
('Aptitude & Reasoning', 'APT', 'Quantitative aptitude, logical reasoning, verbal ability', 'brain', '#EC4899', 6),
('Data Structures & Algorithms', 'DSA', 'Arrays, trees, graphs, sorting, searching algorithms', 'tree', '#06B6D4', 7),
('SQL', 'SQL', 'Database queries, joins, subqueries, optimization', 'table', '#84CC16', 8),
('Programming', 'PROG', 'Programming languages, coding practices, debugging', 'terminal', '#F97316', 9);

-- Insert companies (Product-based)
INSERT INTO companies (name, type, description, website_url) VALUES
('Google', 'product', 'Search engine and cloud computing giant', 'https://careers.google.com'),
('Microsoft', 'product', 'Software and cloud services company', 'https://careers.microsoft.com'),
('Amazon', 'product', 'E-commerce and cloud computing leader', 'https://amazon.jobs'),
('Apple', 'product', 'Consumer electronics and software company', 'https://jobs.apple.com'),
('Meta', 'product', 'Social media and virtual reality company', 'https://careers.meta.com'),
('Netflix', 'product', 'Streaming entertainment service', 'https://jobs.netflix.com'),
('Adobe', 'product', 'Creative software and digital marketing', 'https://adobe.wd5.myworkdayjobs.com'),
('Salesforce', 'product', 'Customer relationship management platform', 'https://salesforce.wd1.myworkdayjobs.com'),
('Uber', 'product', 'Ride-sharing and delivery platform', 'https://uber.com/careers'),
('Airbnb', 'product', 'Online marketplace for lodging', 'https://careers.airbnb.com');

-- Insert companies (Service-based)
INSERT INTO companies (name, type, description, website_url) VALUES
('Tata Consultancy Services', 'service', 'IT services and consulting company', 'https://tcs.com/careers'),
('Infosys', 'service', 'Digital services and consulting', 'https://infosys.com/careers'),
('Wipro', 'service', 'Information technology services corporation', 'https://wipro.com/careers'),
('Accenture', 'service', 'Professional services company', 'https://accenture.com/careers'),
('Cognizant', 'service', 'Multinational technology company', 'https://careers.cognizant.com'),
('HCL Technologies', 'service', 'IT services and consulting', 'https://hcltech.com/careers'),
('Tech Mahindra', 'service', 'Information technology company', 'https://techmahindra.com/careers'),
('Capgemini', 'service', 'Consulting and technology services', 'https://capgemini.com/careers'),
('IBM', 'service', 'Technology and consulting corporation', 'https://ibm.com/careers'),
('Deloitte', 'service', 'Professional services network', 'https://deloitte.com/careers');

-- Get subject IDs for reference
DO $$
DECLARE
    oops_id UUID;
    dbms_id UUID;
    os_id UUID;
    cn_id UUID;
    cs_id UUID;
    apt_id UUID;
    dsa_id UUID;
    sql_id UUID;
    prog_id UUID;
BEGIN
    SELECT id INTO oops_id FROM subjects WHERE code = 'OOPS';
    SELECT id INTO dbms_id FROM subjects WHERE code = 'DBMS';
    SELECT id INTO os_id FROM subjects WHERE code = 'OS';
    SELECT id INTO cn_id FROM subjects WHERE code = 'CN';
    SELECT id INTO cs_id FROM subjects WHERE code = 'CS';
    SELECT id INTO apt_id FROM subjects WHERE code = 'APT';
    SELECT id INTO dsa_id FROM subjects WHERE code = 'DSA';
    SELECT id INTO sql_id FROM subjects WHERE code = 'SQL';
    SELECT id INTO prog_id FROM subjects WHERE code = 'PROG';

    -- Insert topics for OOPS
    INSERT INTO topics (subject_id, name, description, difficulty_level, estimated_time, display_order) VALUES
    (oops_id, 'Classes and Objects', 'Basic concepts of classes, objects, and instantiation', 1, 45, 1),
    (oops_id, 'Inheritance', 'Single, multiple, and multilevel inheritance', 2, 60, 2),
    (oops_id, 'Polymorphism', 'Method overloading and overriding', 2, 50, 3),
    (oops_id, 'Encapsulation', 'Data hiding and access modifiers', 2, 40, 4),
    (oops_id, 'Abstraction', 'Abstract classes and interfaces', 3, 55, 5);

    -- Insert topics for DBMS
    INSERT INTO topics (subject_id, name, description, difficulty_level, estimated_time, display_order) VALUES
    (dbms_id, 'Database Fundamentals', 'Introduction to databases and DBMS', 1, 40, 1),
    (dbms_id, 'ER Model', 'Entity-Relationship modeling', 2, 50, 2),
    (dbms_id, 'Normalization', 'Database normalization forms', 3, 60, 3),
    (dbms_id, 'SQL Basics', 'Basic SQL queries and operations', 2, 45, 4),
    (dbms_id, 'Transactions', 'ACID properties and concurrency control', 4, 70, 5);

    -- Insert topics for DSA
    INSERT INTO topics (subject_id, name, description, difficulty_level, estimated_time, display_order) VALUES
    (dsa_id, 'Arrays', 'Array operations and algorithms', 1, 40, 1),
    (dsa_id, 'Linked Lists', 'Singly, doubly, and circular linked lists', 2, 50, 2),
    (dsa_id, 'Stacks and Queues', 'Stack and queue implementations', 2, 45, 3),
    (dsa_id, 'Trees', 'Binary trees, BST, AVL trees', 3, 70, 4),
    (dsa_id, 'Graphs', 'Graph representation and algorithms', 4, 80, 5),
    (dsa_id, 'Sorting Algorithms', 'Bubble, merge, quick, heap sort', 3, 60, 6),
    (dsa_id, 'Searching Algorithms', 'Linear and binary search', 2, 35, 7);

    -- Insert topics for OS
    INSERT INTO topics (subject_id, name, description, difficulty_level, estimated_time, display_order) VALUES
    (os_id, 'Process Management', 'Process creation, scheduling, synchronization', 3, 65, 1),
    (os_id, 'Memory Management', 'Virtual memory, paging, segmentation', 3, 60, 2),
    (os_id, 'File Systems', 'File organization and directory structures', 2, 50, 3),
    (os_id, 'Deadlocks', 'Deadlock prevention and detection', 4, 55, 4);

    -- Insert topics for CN
    INSERT INTO topics (subject_id, name, description, difficulty_level, estimated_time, display_order) VALUES
    (cn_id, 'OSI Model', 'Seven layers of OSI reference model', 2, 45, 1),
    (cn_id, 'TCP/IP Protocol', 'Internet protocol suite', 3, 55, 2),
    (cn_id, 'Network Security', 'Encryption, authentication, firewalls', 4, 70, 3),
    (cn_id, 'Routing Algorithms', 'Distance vector and link state routing', 4, 65, 4);

END $$;

-- Insert company subject weights for product-based companies
INSERT INTO company_subject_weights (company_id, subject_id, weight)
SELECT c.id, s.id,
    CASE 
        WHEN s.code = 'DSA' THEN 0.25
        WHEN s.code = 'OOPS' THEN 0.20
        WHEN s.code = 'PROG' THEN 0.15
        WHEN s.code = 'DBMS' THEN 0.12
        WHEN s.code = 'OS' THEN 0.10
        WHEN s.code = 'CN' THEN 0.08
        WHEN s.code = 'CS' THEN 0.05
        WHEN s.code = 'APT' THEN 0.03
        WHEN s.code = 'SQL' THEN 0.02
    END as weight
FROM companies c
CROSS JOIN subjects s
WHERE c.type = 'product';

-- Insert company subject weights for service-based companies
INSERT INTO company_subject_weights (company_id, subject_id, weight)
SELECT c.id, s.id,
    CASE 
        WHEN s.code = 'APT' THEN 0.20
        WHEN s.code = 'PROG' THEN 0.18
        WHEN s.code = 'SQL' THEN 0.15
        WHEN s.code = 'DBMS' THEN 0.15
        WHEN s.code = 'DSA' THEN 0.12
        WHEN s.code = 'OOPS' THEN 0.10
        WHEN s.code = 'OS' THEN 0.05
        WHEN s.code = 'CN' THEN 0.03
        WHEN s.code = 'CS' THEN 0.02
    END as weight
FROM companies c
CROSS JOIN subjects s
WHERE c.type = 'service';

-- Insert sample resources
INSERT INTO resources (subject_id, title, description, resource_type, url, difficulty_level, estimated_time)
SELECT s.id, 
    'Introduction to ' || s.name,
    'Comprehensive guide to ' || s.name || ' fundamentals',
    'tutorial',
    'https://example.com/' || LOWER(s.code),
    1,
    60
FROM subjects s;

-- Insert system settings
INSERT INTO system_settings (setting_key, setting_value, description) VALUES
('weekly_test_enabled', 'true', 'Enable/disable weekly AI-generated tests'),
('email_notifications_enabled', 'true', 'Enable/disable email notifications'),
('ai_tutor_enabled', 'true', 'Enable/disable AI tutor functionality'),
('maintenance_mode', 'false', 'Enable/disable maintenance mode'),
('max_daily_ai_requests', '50', 'Maximum AI requests per user per day'),
('session_timeout_minutes', '60', 'User session timeout in minutes'),
('weekly_test_questions_count', '20', 'Number of questions in weekly tests'),
('weakness_threshold', '0.6', 'Accuracy threshold below which topic is marked as weakness');

-- Create admin user (password: admin123)
INSERT INTO users (email, password_hash, first_name, last_name, role, is_active, is_verified) VALUES
('admin@learningplatform.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj6hsxq5S/kS', 'Admin', 'User', 'admin', true, true);

-- Create sample student user (password: student123)
INSERT INTO users (email, password_hash, first_name, last_name, role, is_active, is_verified) VALUES
('student@example.com', '$2b$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John', 'Doe', 'student', true, true);

-- Create student profile for sample user
INSERT INTO student_profiles (user_id, college, graduation_year, current_year, branch, phone)
SELECT u.id, 'Sample University', 2025, 4, 'Computer Science', '+1234567890'
FROM users u WHERE u.email = 'student@example.com';