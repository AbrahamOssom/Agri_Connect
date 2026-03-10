-- USER TABLE
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- PRODUCT TABLE
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price FLOAT NOT NULL,
    stock INT NOT NULL
);

-- CART TABLE
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
);

-- CART ITEM TABLE
CREATE TABLE cart_item (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,

    FOREIGN KEY (cart_id) REFERENCES cart(cart_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total FLOAT,

    FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
);

-- ORDER ITEM TABLE
CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price FLOAT,

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
);

-- ARTICLE TABLE
CREATE TABLE article (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    published_at DATE
);

-- NEWSLETTER TABLE
CREATE TABLE newsletter (
    newsletter_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL,
    subscribed_at DATE
);