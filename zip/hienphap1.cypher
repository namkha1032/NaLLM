CREATE (:`'Organization'` {import_name: '\'Chính phủ\''  })
CREATE (:`'Organization'` {import_name: '\'TÒA ÁN NHÂN DÂN\''  })
CREATE (:`'Organization'` {import_name: '\'VIỆN KIỂM SÁT NHÂN DÂN\''  })
CREATE (:`'Person'` {import_name: '\'Chủ tịch nước\''  })
CREATE (:`'Person'` {import_name: '\'Quốc hội\''  })
CREATE (:`'Person'` {import_name: '\'người đứng đầu cơ quan trung ương của tổ chức chính trị - xã hội\''  })
CREATE (:`Organization` {import_name: 'Chính phủ', `structure`: 'tập thể', `decision-making`: 'đa số'  })
CREATE (:`Organization` {import_name: 'Quốc hội'  })
CREATE (:`Organization` {import_name: 'Ủy ban thường vụ Quốc hội'  })
CREATE (:`Organization` {import_name: 'Kiểm toán nhà nước'  })
CREATE (:`Organization` {import_name: 'Ủy ban dự thảo Hiến pháp'  })
CREATE (:`Person` {import_name: 'Công dân'  })
CREATE (:`Person` {import_name: 'Mọi người'  })
CREATE (:`Person` {import_name: 'Mọi người'  })
CREATE (:`Person` {import_name: 'Nhà nước'  })
CREATE (:`Person` {import_name: 'hĩa vụ trung'  })
CREATE (:`Person` {import_name: 'Tổ quốc'  })
CREATE (:`Person` {import_name: 'Lực lượng vũ trang nhân dân'  })
CREATE (:`Person` {import_name: 'Nhân dân'  })
CREATE (:`Person` {import_name: 'Đảng'  })
CREATE (:`Person` {import_name: 'Công an nhân dân'  })
CREATE (:`Person` {import_name: 'lực lượng dân quân tự vệ'  })
CREATE (:`Person` {import_name: 'Chủ tịch nước'  })
CREATE (:`Person` {import_name: 'Phó Chủ tịch nước'  })
CREATE (:`Person` {import_name: 'Chủ tịch Quốc hội'  })
CREATE (:`Person` {import_name: 'Phó Chủ tịch Quốc hội'  })
CREATE (:`Person` {import_name: 'Ủy viên Ủy ban thường vụ Quốc hội'  })
CREATE (:`Person` {import_name: 'Chủ tịch Hội đồng dân tộc'  })
CREATE (:`Person` {import_name: 'Chủ nhiệm Ủy ban của Quốc hội'  })
CREATE (:`Person` {import_name: 'Thủ tướng Chính phủ'  })
CREATE (:`Person` {import_name: 'Chánh án Tòa án nhân dân tối cao'  })
CREATE (:`Person` {import_name: 'Viện trưởng Viện kiểm sát nhân dân tối cao'  })
CREATE (:`Person` {import_name: 'Chủ tịch Hội đồng bầu cử quốc gia'  })
CREATE (:`Person` {import_name: 'Tổng Kiểm toán nhà nước'  })
CREATE (:`Person` {import_name: 'người đứng đầu cơ quan khác do Quốc hội thành lập'  })
CREATE (:`Person` {import_name: 'Ủy viên'  })
CREATE (:`Person` {import_name: 'Chính phủ'  })
CREATE (:`Person` {import_name: 'Tòa án nhân dân tối cao'  })
CREATE (:`Person` {import_name: 'Viện kiểm sát nhân dân tối cao'  })
CREATE (:`Person` {import_name: 'Quốc hội'  })
CREATE (:`Person` {import_name: 'Hội đồng dân tộc'  })
CREATE (:`Person` {import_name: 'Chủ tịch'  })
CREATE (:`Person` {import_name: 'Phó Chủ tịch'  })
CREATE (:`Person` {import_name: 'Ủy viên'  })
CREATE (:`Person` {import_name: 'Ủy ban thường vụ Quốc hội'  })
CREATE (:`Person` {import_name: 'Đại biểu Quốc hội'  })
CREATE (:`Person` {import_name: 'Nhân dân'  })
CREATE (:`Person` {import_name: 'Chủ tịch nước'  })
CREATE (:`Person` {import_name: 'Chủ tịch Quốc hội'  })
CREATE (:`Person` {import_name: 'Thủ tướng Chính phủ'  })
CREATE (:`Person` {import_name: 'Bộ trưởng'  })
CREATE (:`Person` {import_name: 'Tổng Kiểm toán Nhà nước'  })
CREATE (:`Person` {import_name: 'Quốc hội'  })
CREATE (:`Person` {import_name: 'Đại biểu Quốc hội'  })
CREATE (:`Person` {import_name: 'Chính phủ'  })
CREATE (:`Person` {import_name: 'Kiểm toán nhà nước'  })
CREATE (:`Person` {import_name: 'Ủy ban trung ương Mặt trận Tổ quốc Việt Nam'  })
CREATE (:`Person` {import_name: 'Thủ tướng Chính phủ', `responsibility`: 'trước Quốc hội'  })
CREATE (:`Person` {import_name: 'Phó Thủ tướng Chính phủ'  })
CREATE (:`Person` {import_name: 'Thủ trưởng cơ quan ngang bộ'  })
CREATE (:`Person` {import_name: 'Chủ tịch nước'  })
CREATE (:`Person` {import_name: 'Thủ trưởng cơ quan ngang bộ'  })
CREATE (:`Person` {import_name: 'Chánh án Tòa án nhân dân tối cao'  })
CREATE (:`Person` {import_name: 'Tổng Kiểm toán nhà nước', `position`: 'Tổng Kiểm toán nhà nước'  });
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Thủ tướng Chính phủ' }) CREATE (source)-[:`includes` {}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Phó Thủ tướng Chính phủ' }) CREATE (source)-[:`includes` {}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Bộ trưởng' }) CREATE (source)-[:`includes` {}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Thủ trưởng cơ quan ngang bộ' }) CREATE (source)-[:`includes` {}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Hiến pháp' }) CREATE (source)-[:`executes` {`type`: 'law'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'luật' }) CREATE (source)-[:`executes` {`type`: 'law'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'nghị quyết của Quốc hội' }) CREATE (source)-[:`executes` {`type`: 'resolution'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'pháp lệnh' }) CREATE (source)-[:`executes` {`type`: 'decree'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'nghị quyết của Ủy ban thường vụ Quốc hội' }) CREATE (source)-[:`executes` {`type`: 'resolution'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'lệnh' }) CREATE (source)-[:`executes` {`type`: 'order'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'quyết định của Chủ tịch nước' }) CREATE (source)-[:`executes` {`type`: 'decision'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'chính sách' }) CREATE (source)-[:`proposes` {`type`: 'policy'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'trình Quốc hội' }) CREATE (source)-[:`proposes` {`type`: 'proposal'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Ủy ban thường vụ Quốc hội quyết định' }) CREATE (source)-[:`proposes` {`type`: 'proposal'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'nhiệm vụ' }) CREATE (source)-[:`decides` {`type`: 'duty'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'quyền hạn' }) CREATE (source)-[:`decides` {`type`: 'authority'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Thủ tướng Chính phủ' }) CREATE (source)-[:`report_to` {`report_type`: 'công tác'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'Thủ tướng Chính phủ' }) CREATE (source)-[:`report_to` {`report_type`: 'công tác'}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'TÒA ÁN NHÂN DÂN' }) CREATE (source)-[:`\'discussing related issues with\'` {}]->(target);
MATCH (source { import_name: 'Chính phủ' }), (target { import_name: 'VIỆN KIỂM SÁT NHÂN DÂN' }) CREATE (source)-[:`\'discussing related issues with\'` {}]->(target);