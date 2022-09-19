-- Role
INSERT INTO `role` VALUES (1,'admin'),(2,'nhân viên');

-- User
INSERT INTO `user` VALUES (1,'admin1@gmail.com','admin123','admin1',_binary '',NULL,1),
                          (2,'admin2@gmail.com','admin123','admin2',_binary '',NULL,1),
                          (3,'thong@gmail.com','thong123','thong@gmail.com',_binary '',NULL,2),
                          (4,'thaivinh@gmail.com','vinh123','nguyễn thái vinh',_binary '',NULL,2),
                          (5,'hoangvinh@gmail.com','vinh123','nguyễn hoàng vinh',_binary '',NULL,2),
                          (6,'long@gmail.com','long123','phan đình long',_binary '',NULL,2);