CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(191) NOT NULL UNIQUE,
    phone VARCHAR(20) NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('customer', 'vendor', 'admin') NOT NULL DEFAULT 'customer',
    status ENUM('active', 'inactive', 'blocked') NOT NULL DEFAULT 'active',
    email_verified_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE vendors (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    shop_name VARCHAR(191) NOT NULL,
    slug VARCHAR(191) NOT NULL UNIQUE,
    business_name VARCHAR(191) NULL,
    gst_number VARCHAR(50) NULL,
    pan_number VARCHAR(50) NULL,
    support_email VARCHAR(191) NULL,
    support_phone VARCHAR(20) NULL,
    approval_status ENUM('pending', 'approved', 'rejected', 'suspended') NOT NULL DEFAULT 'pending',
    commission_type ENUM('percent', 'fixed') NOT NULL DEFAULT 'percent',
    commission_value DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    payout_status ENUM('pending', 'active', 'hold') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_vendors_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE addresses (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NULL,
    vendor_id BIGINT UNSIGNED NULL,
    type ENUM('billing', 'shipping', 'pickup', 'return') NOT NULL DEFAULT 'shipping',
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255) NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'India',
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_addresses_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_addresses_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE categories (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    parent_id BIGINT UNSIGNED NULL,
    name VARCHAR(150) NOT NULL,
    slug VARCHAR(191) NOT NULL UNIQUE,
    description TEXT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_categories_parent
        FOREIGN KEY (parent_id) REFERENCES categories(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE products (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vendor_id BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(191) NOT NULL,
    slug VARCHAR(191) NOT NULL UNIQUE,
    description TEXT NULL,
    brand VARCHAR(150) NULL,
    status ENUM('draft', 'pending', 'active', 'inactive', 'rejected') NOT NULL DEFAULT 'draft',
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE product_variants (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    sku VARCHAR(191) NOT NULL UNIQUE,
    variant_name VARCHAR(191) NULL,
    color VARCHAR(100) NULL,
    size VARCHAR(100) NULL,
    price DECIMAL(12,2) NOT NULL,
    compare_at_price DECIMAL(12,2) NULL,
    weight DECIMAL(10,3) NULL,
    barcode VARCHAR(191) NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_variants_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE product_images (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NULL,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_images_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_images_variant
        FOREIGN KEY (variant_id) REFERENCES product_variants(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE inventory (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NULL,
    warehouse_location VARCHAR(191) NULL,
    quantity_on_hand INT NOT NULL DEFAULT 0,
    quantity_reserved INT NOT NULL DEFAULT 0,
    low_stock_threshold INT NOT NULL DEFAULT 5,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_inventory_variant
        FOREIGN KEY (variant_id) REFERENCES product_variants(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE carts (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    session_token VARCHAR(191) NULL UNIQUE,
    status ENUM('active', 'converted', 'abandoned') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_carts_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE cart_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NULL,
    vendor_id BIGINT UNSIGNED NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_cart_items_cart
        FOREIGN KEY (cart_id) REFERENCES carts(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cart_items_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_cart_items_variant
        FOREIGN KEY (variant_id) REFERENCES product_variants(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_cart_items_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE orders (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    billing_address_id BIGINT UNSIGNED NULL,
    shipping_address_id BIGINT UNSIGNED NULL,
    order_number VARCHAR(50) NOT NULL UNIQUE,
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    shipping_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    grand_total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    payment_status ENUM('pending', 'paid', 'failed', 'refunded', 'partially_refunded') NOT NULL DEFAULT 'pending',
    order_status ENUM('pending', 'confirmed', 'packed', 'shipped', 'delivered', 'cancelled', 'returned') NOT NULL DEFAULT 'pending',
    notes TEXT NULL,
    placed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_orders_billing_address
        FOREIGN KEY (billing_address_id) REFERENCES addresses(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_orders_shipping_address
        FOREIGN KEY (shipping_address_id) REFERENCES addresses(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE order_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NULL,
    vendor_id BIGINT UNSIGNED NOT NULL,
    sku VARCHAR(191) NULL,
    product_name VARCHAR(191) NOT NULL,
    variant_name VARCHAR(191) NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(12,2) NOT NULL,
    tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    line_total DECIMAL(12,2) NOT NULL,
    fulfillment_status ENUM('pending', 'packed', 'shipped', 'delivered', 'returned', 'cancelled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_order_items_variant
        FOREIGN KEY (variant_id) REFERENCES product_variants(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_order_items_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE payments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    gateway_name VARCHAR(100) NULL,
    gateway_transaction_id VARCHAR(191) NULL UNIQUE,
    amount DECIMAL(12,2) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'INR',
    status ENUM('initiated', 'success', 'failed', 'refunded', 'partial_refund') NOT NULL DEFAULT 'initiated',
    paid_at TIMESTAMP NULL,
    raw_response JSON NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE commissions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vendor_id BIGINT UNSIGNED NOT NULL,
    order_item_id BIGINT UNSIGNED NULL,
    commission_type ENUM('percent', 'fixed') NOT NULL DEFAULT 'percent',
    commission_rate DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    commission_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_commissions_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_commissions_order_item
        FOREIGN KEY (order_item_id) REFERENCES order_items(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE vendor_payouts (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vendor_id BIGINT UNSIGNED NOT NULL,
    payout_reference VARCHAR(191) NOT NULL UNIQUE,
    payout_period_start DATE NOT NULL,
    payout_period_end DATE NOT NULL,
    gross_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    commission_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    refund_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    net_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    payout_status ENUM('pending', 'processing', 'paid', 'failed', 'cancelled') NOT NULL DEFAULT 'pending',
    payout_date DATE NULL,
    notes TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_payouts_vendor
        FOREIGN KEY (vendor_id) REFERENCES vendors(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE shipments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    order_item_id BIGINT UNSIGNED NULL,
    courier_name VARCHAR(100) NULL,
    tracking_number VARCHAR(191) NULL UNIQUE,
    shipped_at TIMESTAMP NULL,
    delivered_at TIMESTAMP NULL,
    shipment_status ENUM('pending', 'shipped', 'in_transit', 'delivered', 'returned', 'lost') NOT NULL DEFAULT 'pending',
    shipping_label_url VARCHAR(500) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_shipments_order
        FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_shipments_order_item
        FOREIGN KEY (order_item_id) REFERENCES order_items(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE returns_refunds (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    order_item_id BIGINT UNSIGNED NULL,
    payment_id BIGINT UNSIGNED NULL,
    request_type ENUM('return', 'refund', 'replacement') NOT NULL DEFAULT 'return',
    reason VARCHAR(255) NOT NULL,
    request_status ENUM('requested', 'approved', 'rejected', 'picked_up', 'processed', 'completed') NOT NULL DEFAULT 'requested',
    requested_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    approved_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    resolved_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_returns_order
        FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_returns_order_item
        FOREIGN KEY (order_item_id) REFERENCES order_items(id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_returns_payment
        FOREIGN KEY (payment_id) REFERENCES payments(id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


use multivendor_ecommerce;

select database();

Show tables;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(50),
    customer_state VARCHAR(10)
);

drop tables customers;

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city, customer_state) VALUES
('CUST001','Amit','amit@gmail.com','Delhi','DL'),
('CUST002','Anita','anita@yahoo.com','Mumbai','MH'),
('CUST003','Arjun','arjun@gmail.com','Kolkata','WB'),
('CUST004','Bhavna','bhavna@hotmail.com','Chennai','TN'),
('CUST005','Chetan','chetan@gmail.com','Bangalore','KA'),
('CUST006','Deepak','deepak@gmail.com','Hyderabad','TS'),
('CUST007','Divya','divya@yahoo.com','Pune','MH'),
('CUST008','Farhan','farhan@gmail.com','Lucknow','UP'),
('CUST009','Geeta','geeta@hotmail.com','Jaipur','RJ'),
('CUST010','Harish','harish@gmail.com','Ahmedabad','GJ'),
('CUST011','Isha','isha@gmail.com','Delhi','DL'),
('CUST012','Jatin','jatin@yahoo.com','Mumbai','MH'),
('CUST013','Kiran','kiran@gmail.com','Kolkata','WB'),
('CUST014','Leena','leena@hotmail.com','Chennai','TN'),
('CUST015','Manish','manish@gmail.com','Bangalore','KA'),
('CUST016','Nisha','nisha@gmail.com','Hyderabad','TS'),
('CUST017','Omkar','omkar@yahoo.com','Pune','MH'),
('CUST018','Pooja','pooja@gmail.com','Lucknow','UP'),
('CUST019','Qadir','qadir@hotmail.com','Jaipur','RJ'),
('CUST020','Ravi','ravi@gmail.com','Ahmedabad','GJ'),
('CUST021','Sita','sita@gmail.com','Delhi','SP'),
('CUST022','Tanya','tanya@yahoo.com','Mumbai','MH'),
('CUST023','Umesh','umesh@gmail.com','Kolkata','WB'),
('CUST024','Varun','varun@hotmail.com','Chennai','TN'),
('CUST025','Yash','yash@gmail.com','Bangalore','KA'),
('CUST026','Zoya','zoya@gmail.com','Hyderabad','TS'),
('CUST027','Aarti','aarti@yahoo.com','Pune','MH'),
('CUST028','Brijesh','brijesh@gmail.com','Lucknow','UP'),
('CUST029','Chirag','chirag@hotmail.com','Jaipur','RJ'),
('CUST030','Dolly','dolly@gmail.com','Ahmedabad','GJ'),
('CUST031','Eshan','eshan@gmail.com','Delhi','DL'),
('CUST032','Falguni','falguni@yahoo.com','Mumbai','MH'),
('CUST033','Gaurav','gaurav@gmail.com','Kolkata','WB'),
('CUST034','Hemant','hemant@hotmail.com','Chennai','TN'),
('CUST035','Indu','indu@gmail.com','Bangalore','KA'),
('CUST036','Jay','jay@gmail.com','Hyderabad','TS'),
('CUST037','Kajal','kajal@yahoo.com','Pune','MH'),
('CUST038','Laxmi','laxmi@gmail.com','Lucknow','UP'),
('CUST039','Mohan','mohan@hotmail.com','Jaipur','RJ'),
('CUST040','Neha','neha@gmail.com','Ahmedabad','GJ'),
('CUST041','Om','om@gmail.com','Delhi','SP'),
('CUST042','Pinky','pinky@yahoo.com','Mumbai','MH'),
('CUST043','Qasim','qasim@gmail.com','Kolkata','WB'),
('CUST044','Ritika','ritika@hotmail.com','Chennai','TN'),
('CUST045','Suresh','suresh@gmail.com','Bangalore','KA'),
('CUST046','Tina','tina@gmail.com','Hyderabad','TS'),
('CUST047','Usha','usha@yahoo.com','Pune','MH'),
('CUST048','Vikas','vikas@gmail.com','Lucknow','UP'),
('CUST049','Waseem','waseem@hotmail.com','Jaipur','RJ'),
('CUST050','Xenia','xenia@gmail.com','Ahmedabad','GJ'),
('CUST051','Yogesh','yogesh@gmail.com','Delhi','DL'),
('CUST052','Zubair','zubair@yahoo.com','Mumbai','MH'),
('CUST053','Akhil','akhil@gmail.com','Kolkata','WB'),
('CUST054','Bina','bina@hotmail.com','Chennai','TN'),
('CUST055','Chandan','chandan@gmail.com','Bangalore','KA'),
('CUST056','Diksha','diksha@gmail.com','Hyderabad','TS'),
('CUST057','Esha','esha@yahoo.com','Pune','MH'),
('CUST058','Firoz','firoz@gmail.com','Lucknow','UP'),
('CUST059','Gita','gita@hotmail.com','Jaipur','RJ'),
('CUST060','Harsha','harsha@gmail.com','Ahmedabad','GJ'),
('CUST061','Irfan','irfan@gmail.com','Delhi','SP'),
('CUST062','Jaya','jaya@yahoo.com','Mumbai','MH'),
('CUST063','Kavita','kavita@gmail.com','Kolkata','WB'),
('CUST064','Lalit','lalit@hotmail.com','Chennai','TN'),
('CUST065','Meena','meena@gmail.com','Bangalore','KA'),
('CUST066','Naveen','naveen@gmail.com','Hyderabad','TS'),
('CUST067','Omi','omi@yahoo.com','Pune','MH'),
('CUST068','Prakash','prakash@gmail.com','Lucknow','UP'),
('CUST069','Ramesh','ramesh@hotmail.com','Jaipur','RJ'),
('CUST070','Sonia','sonia@gmail.com','Ahmedabad','GJ'),
('CUST071','Tarun','tarun@gmail.com','Delhi','DL'),
('CUST072','Uma','uma@yahoo.com','Mumbai','MH'),
('CUST073','Vandana','vandana@gmail.com','Kolkata','WB'),
('CUST074','Wasim','wasim@hotmail.com','Chennai','TN'),
('CUST075','Xavier','xavier@gmail.com','Bangalore','KA'),
('CUST076','Yamini','yamini@gmail.com','Hyderabad','TS'),
('CUST077','Zakir','zakir@yahoo.com','Pune','MH'),
('CUST078','Alka','alka@gmail.com','Lucknow','UP'),
('CUST079','Bhavesh','bhavesh@hotmail.com','Jaipur','RJ'),
('CUST080','Chitra','chitra@gmail.com','Ahmedabad','GJ'),
('CUST081','Dev','dev@gmail.com','Delhi','SP'),
('CUST082','Esha','esha@yahoo.com','Mumbai','MH'),
('CUST083','Farida','farida@gmail.com','Kolkata','WB'),
('CUST084','Gagan','gagan@hotmail.com','Chennai','TN'),
('CUST085','Hina','hina@gmail.com','Bangalore','KA'),
('CUST086','Iqbal','iqbal@gmail.com','Hyderabad','TS'),
('CUST087','Jasmin','jasmin@yahoo.com','Pune','MH'),
('CUST088','Karan','karan@gmail.com','Lucknow','UP'),
('CUST089','Lata','lata@hotmail.com','Jaipur','RJ'),
('CUST090','Mira','mira@gmail.com','Ahmedabad','GJ'),
('CUST091','Nikhil','nikhil@gmail.com','Delhi','DL'),
('CUST092','Ojas','ojas@yahoo.com','Mumbai','MH'),
('CUST093','Poonam','poonam@gmail.com','Kolkata','WB'),
('CUST094','Quresh','quresh@hotmail.com','Chennai','TN'),
('CUST095','Rohit','rohit@gmail.com','Bangalore','KA'),
('CUST096','Seema','seema@gmail.com','Hyderabad','TS'),
('CUST097','Tushar','tushar@yahoo.com','Pune','MH'),
('CUST098','Urvashi','urvashi@gmail.com','Lucknow','UP'),
('CUST099','Vivek','vivek@hotmail.com','Jaipur','RJ'),
('CUST100','Zoya','zoya@gmail.com','Ahmedabad','GJ');

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city, customer_state) VALUES
('CUST101','Ajay','ajay@gmail.com','Delhi','SP'),
('CUST102','Alok','alok@yahoo.com','Mumbai','MH'),
('CUST103','Anjali','anjali@gmail.com','Kolkata','WB'),
('CUST104','Bharat','bharat@hotmail.com','Chennai','TN'),
('CUST105','Charu','charu@gmail.com','Bangalore','KA'),
('CUST106','Dinesh','dinesh@gmail.com','Hyderabad','TS'),
('CUST107','Ekta','ekta@yahoo.com','Pune','MH'),
('CUST108','Faisal','faisal@gmail.com','Lucknow','UP'),
('CUST109','Gopal','gopal@hotmail.com','Jaipur','RJ'),
('CUST110','Heena','heena@gmail.com','Ahmedabad','GJ'),
('CUST111','Irfan','irfan@gmail.com','Delhi','DL'),
('CUST112','Jyoti','jyoti@yahoo.com','Mumbai','MH'),
('CUST113','Kavita','kavita@gmail.com','Kolkata','WB'),
('CUST114','Lalit','lalit@hotmail.com','Chennai','TN'),
('CUST115','Meena','meena@gmail.com','Bangalore','KA'),
('CUST116','Naveen','naveen@gmail.com','Hyderabad','TS'),
('CUST117','Omi','omi@yahoo.com','Pune','MH'),
('CUST118','Prakash','prakash@gmail.com','Lucknow','UP'),
('CUST119','Ramesh','ramesh@hotmail.com','Jaipur','RJ'),
('CUST120','Sita','sita@gmail.com','Ahmedabad','GJ'),
('CUST121','Tarun','tarun@gmail.com','Delhi','SP'),
('CUST122','Uma','uma@yahoo.com','Mumbai','MH'),
('CUST123','Vandana','vandana@gmail.com','Kolkata','WB'),
('CUST124','Wasim','wasim@hotmail.com','Chennai','TN'),
('CUST125','Xavier','xavier@gmail.com','Bangalore','KA'),
('CUST126','Yamini','yamini@gmail.com','Hyderabad','TS'),
('CUST127','Zakir','zakir@yahoo.com','Pune','MH'),
('CUST128','Alka','alka@gmail.com','Lucknow','UP'),
('CUST129','Bhavesh','bhavesh@hotmail.com','Jaipur','RJ'),
('CUST130','Chitra','chitra@gmail.com','Ahmedabad','GJ'),
('CUST131','Dev','dev@gmail.com','Delhi','DL'),
('CUST132','Esha','esha@yahoo.com','Mumbai','MH'),
('CUST133','Farida','farida@gmail.com','Kolkata','WB'),
('CUST134','Gagan','gagan@hotmail.com','Chennai','TN'),
('CUST135','Hina','hina@gmail.com','Bangalore','KA'),
('CUST136','Iqbal','iqbal@gmail.com','Hyderabad','TS'),
('CUST137','Jasmin','jasmin@yahoo.com','Pune','MH'),
('CUST138','Karan','karan@gmail.com','Lucknow','UP'),
('CUST139','Lata','lata@hotmail.com','Jaipur','RJ'),
('CUST140','Mira','mira@gmail.com','Ahmedabad','GJ'),
('CUST141','Nikhil','nikhil@gmail.com','Delhi','SP'),
('CUST142','Ojas','ojas@yahoo.com','Mumbai','MH'),
('CUST143','Poonam','poonam@gmail.com','Kolkata','WB'),
('CUST144','Quresh','quresh@hotmail.com','Chennai','TN'),
('CUST145','Rohit','rohit@gmail.com','Bangalore','KA'),
('CUST146','Seema','seema@gmail.com','Hyderabad','TS'),
('CUST147','Tushar','tushar@yahoo.com','Pune','MH'),
('CUST148','Urvashi','urvashi@gmail.com','Lucknow','UP'),
('CUST149','Vivek','vivek@hotmail.com','Jaipur','RJ'),
('CUST150','Zoya','zoya@gmail.com','Ahmedabad','GJ'),
('CUST151','Aakash','aakash@gmail.com','Delhi','DL'),
('CUST152','Bobby','bobby@yahoo.com','Mumbai','MH'),
('CUST153','Chanchal','chanchal@gmail.com','Kolkata','WB'),
('CUST154','Deepa','deepa@hotmail.com','Chennai','TN'),
('CUST155','Eklavya','eklavya@gmail.com','Bangalore','KA'),
('CUST156','Fiza','fiza@gmail.com','Hyderabad','TS'),
('CUST157','Girish','girish@yahoo.com','Pune','MH'),
('CUST158','Harsha','harsha@gmail.com','Lucknow','UP'),
('CUST159','Indira','indira@hotmail.com','Jaipur','RJ'),
('CUST160','Javed','javed@gmail.com','Ahmedabad','GJ'),
('CUST161','Kartik','kartik@gmail.com','Delhi','SP'),
('CUST162','Lina','lina@yahoo.com','Mumbai','MH'),
('CUST163','Madhav','madhav@gmail.com','Kolkata','WB'),
('CUST164','Naina','naina@hotmail.com','Chennai','TN'),
('CUST165','Om','om@gmail.com','Bangalore','KA'),
('CUST166','Pinky','pinky@gmail.com','Hyderabad','TS'),
('CUST167','Qasim','qasim@yahoo.com','Pune','MH'),
('CUST168','Ritika','ritika@gmail.com','Lucknow','UP'),
('CUST169','Suresh','suresh@hotmail.com','Jaipur','RJ'),
('CUST170','Tina','tina@gmail.com','Ahmedabad','GJ'),
('CUST171','Usha','usha@gmail.com','Delhi','DL'),
('CUST172','Vikas','vikas@yahoo.com','Mumbai','MH'),
('CUST173','Waseem','waseem@gmail.com','Kolkata','WB'),
('CUST174','Xenia','xenia@hotmail.com','Chennai','TN'),
('CUST175','Yogesh','yogesh@gmail.com','Bangalore','KA'),
('CUST176','Zubair','zubair@gmail.com','Hyderabad','TS'),
('CUST177','Akhil','akhil@yahoo.com','Pune','MH'),
('CUST178','Bina','bina@gmail.com','Lucknow','UP'),
('CUST179','Chandan','chandan@hotmail.com','Jaipur','RJ'),
('CUST180','Diksha','diksha@gmail.com','Ahmedabad','GJ'),
('CUST181','Esha','esha@gmail.com','Delhi','SP'),
('CUST182','Firoz','firoz@yahoo.com','Mumbai','MH'),
('CUST183','Gita','gita@gmail.com','Kolkata','WB'),
('CUST184','Harsha','harsha@hotmail.com','Chennai','TN'),
('CUST185','Irfan','irfan@gmail.com','Bangalore','KA'),
('CUST186','Jaya','jaya@gmail.com','Hyderabad','TS'),
('CUST187','Kavita','kavita@yahoo.com','Pune','MH'),
('CUST188','Lalit','lalit@gmail.com','Lucknow','UP'),
('CUST189','Meena','meena@hotmail.com','Jaipur','RJ'),
('CUST190','Naveen','naveen@gmail.com','Ahmedabad','GJ'),
('CUST191','Omi','omi@gmail.com','Delhi','DL'),
('CUST192','Prakash','prakash@yahoo.com','Mumbai','MH'),
('CUST193','Ramesh','ramesh@gmail.com','Kolkata','WB'),
('CUST194','Sonia','sonia@hotmail.com','Chennai','TN'),
('CUST195','Tarun','tarun@gmail.com','Bangalore','KA'),
('CUST196','Uma','uma@gmail.com','Hyderabad','TS'),
('CUST197','Vandana','vandana@yahoo.com','Pune','MH'),
('CUST198','Wasim','wasim@gmail.com','Lucknow','UP'),
('CUST199','Xavier','xavier@hotmail.com','Jaipur','RJ'),
('CUST200','Yash','yash@gmail.com','Ahmedabad','GJ');


















