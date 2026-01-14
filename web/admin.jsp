<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hệ Thống Bán Khóa Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; }
        .sidebar { min-height: 100vh; background-color: #343a40; color: white; }
        .sidebar a { color: #adb5bd; text-decoration: none; padding: 15px; display: block; border-bottom: 1px solid #495057; }
        .sidebar a:hover, .sidebar a.active { background-color: #495057; color: white; }
        .sidebar i { width: 25px; }
        .stat-card { transition: transform 0.2s; }
        .stat-card:hover { transform: translateY(-5px); }
        .card-icon { font-size: 3rem; opacity: 0.3; position: absolute; right: 20px; top: 20px; }
        .number-text {text-align: center; font-size: 40px}
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse show">
            <div class="pt-3 text-center mb-4">
                <h4><i class="fas fa-graduation-cap"></i> Code Academy </h4>
                <small>Xin chào, ${sessionScope.user.fullName != null ? sessionScope.user.fullName : "Admin"}</small>
            </div>
            <div class="list-group list-group-flush">
                <a href="DashboardServlet" class="active"><i class="fas fa-tachometer-alt"></i> Tổng quan (Dashboard)</a>
                <a href="ManageCoursesServlet"><i class="fas fa-book"></i> Quản lý Khóa học</a>
                <a href="ManageUsersServlet"><i class="fas fa-users"></i> Quản lý Học viên</a>
                <a href="ManageOrdersServlet"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
                <a href="LogoutServlet" class="text-danger"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Bảng Điều Khiển</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <button type="button" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-calendar"></i> Hôm nay: <%= new java.util.Date() %>
                    </button>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-primary stat-card h-100">
                        <div class="card-body">
                            <div class="card-icon"><i class="fas fa-user-graduate"></i></div>
                            <h5 class="card-title">Tổng Học Viên</h5>
                            <h2 class="display-4">${totalStudent}</h2>
                            <p class="card-text">Tăng 12% so với tháng trước</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-success stat-card h-100">
                        <div class="card-body">
                            <div class="card-icon"><i class="fas fa-book-open"></i></div>
                            <h5 class="card-title">Khóa Học Đang Bán</h5>
                            <h2 class="display-4">${totalCourse}</h2>
                            <p class="card-text">3 khóa học mới tuần này</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-warning stat-card h-100">
                        <div class="card-body">
                            <div class="card-icon"><i class="fas fa-coins"></i></div>
                            <h5 class="card-title">Doanh Thu Tháng</h5>
                            <h2 class="display-4">${totalRevenue} đ</h2>
                            <p class="card-text">Đơn hàng chờ duyệt: ${pendingOrders}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="fas fa-list"></i> Đơn Mua Khóa Học Gần Nhất</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Mã ĐH</th>
                                    <th>Học Viên</th>
                                    <th>Khóa Học</th>
                                    <th>Ngày Mua</th>
                                    <th>Trạng Thái</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${recentOrders}">
                                    <tr>
                                        <td>#${o.id}</td>
                                        <td>${o.studentName}</td>
                                        <td>${o.courseName}</td>
                                        <td>${o.orderDate}</td>
                                        <td>
                                            <span class="badge ${o.status == 'Completed' ? 'bg-success' : 'bg-warning'}">
                                                ${o.status}
                                            </span>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-primary">Chi tiết</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty recentOrders}">
                                    <tr>
                                        <td>#1023</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Java Spring Boot</td>
                                        <td>10/01/2026</td>
                                        <td><span class="badge bg-success">Đã thanh toán</span></td>
                                        <td><button class="btn btn-sm btn-primary">Chi tiết</button></td>
                                    </tr>
                                    <tr>
                                        <td>#1024</td>
                                        <td>Trần Thị B</td>
                                        <td>ReactJS Master</td>
                                        <td>10/01/2026</td>
                                        <td><span class="badge bg-warning text-dark">Chờ duyệt</span></td>
                                        <td><button class="btn btn-sm btn-primary">Chi tiết</button></td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <a href="#" class="btn btn-link">Xem tất cả đơn hàng</a>
                </div>
            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>