<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CodeAcademy — Khóa học lập trình</title>

        <!-- Bootstrap 5 CSS (CDN) -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="style/style.css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light border-bottom">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">CodeAcademy</a>

                <form class="d-flex ms-auto me-3" method="get" action="search">
                    <input class="form-control me-2" name="q" type="search" placeholder="Tìm khóa học, ví dụ: Java, React..." aria-label="Search">
                    <button class="btn btn-outline-primary" type="submit">Search</button>
                </form>

                <button class="btn btn-outline-secondary me-2" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas" aria-controls="cartOffcanvas">
                    Cart <span class="badge bg-danger" id="cartCount">0</span>
                </button>

                <a class="btn btn-primary" href="login.jsp">Login</a>
            </div>
        </nav>

        <main class="container my-4">
            <!-- Hero -->
            <div class="hero mb-4 p-4">
                <div class="d-md-flex align-items-center justify-content-between">
                    <div>
                        <h1 class="display-6 mb-2">Học lập trình — từ cơ bản đến nâng cao</h1>
                        <p class="mb-0 text-muted">Khóa học video, bài tập thực hành, mentorship. Bắt đầu học ngay hôm nay và xây dự án thật.</p>
                    </div>
                    <div class="mt-3 mt-md-0">
                        <a href="#courses" class="btn btn-lg btn-primary">Xem khóa học</a>
                    </div>
                </div>
            </div>

            <div class="row g-3">
                <!-- Sidebar: Categories & Filters -->
                <aside class="col-lg-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h6 class="card-title">Lọc theo danh mục</h6>
                            <form method="get" action="courses">
                                <select class="form-select mb-2" name="category">
                                    <option value="">Tất cả</option>
                                    <option value="web">Web Development</option>
                                    <option value="mobile">Mobile</option>
                                    <option value="data">Data Science</option>
                                    <option value="devops">DevOps</option>
                                    <option value="game">Game Dev</option>
                                </select>
                                <div class="d-grid">
                                    <button class="btn btn-outline-primary btn-sm" type="submit">Áp dụng</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Bán chạy</h6>
                            <ul class="list-unstyled mb-0">
                                <li class="py-2 border-bottom">
                                    <a href="#" class="text-decoration-none">Fullstack Java + Spring Boot</a>
                                </li>
                                <li class="py-2 border-bottom">
                                    <a href="#" class="text-decoration-none">React & TypeScript từ Zero</a>
                                </li>
                                <li class="py-2">
                                    <a href="#" class="text-decoration-none">Machine Learning cơ bản</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>

                <!-- Courses grid -->
                <section id="courses" class="col-lg-9">
                    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">

                        <!-- JSTL loop: courses should be set by servlet as request attribute -->
                        <c:if test="${not empty listCoursePage}">
                            <c:forEach var="c" items="${listCoursePage}">
                                <div class="col">
                                    <div class="card h-100 course-card">
                                        <img src="${c.imageUrl}" class="card-img-top" alt="${c.title}" style="height:160px; object-fit:cover;">
                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title mb-1">${c.title}</h5>
                                            
                                            <p class="mb-2 text-muted truncate-2">${c.description}</p>
                                            <div class="mt-auto d-flex justify-content-between align-items-center">
                                                <span class="text-success price-badge">${c.price}₫</span>
                                                <div>
                                                    <button class="btn btn-sm btn-outline-secondary me-2" data-bs-toggle="modal" data-bs-target="#detailModal" data-id="${c.courseId}" data-title="${c.title}" data-desc="${c.description}" data-img="${c.imageUrl}" data-price="${c.price}">Xem</button>
                                                    <form class="d-inline" method="post" action="cart/add">
                                                        <input type="hidden" name="courseId" value="${c.courseId}">
                                                        <button type="submit" class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                        <!-- Fallback sample cards nếu không có courses (cho dev test nhanh) -->
                        
                    </div>

                    <!-- Pagination (static example) -->
                    <nav aria-label="Course pagination" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#">«</a></li>
                            
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a class="page-link" href="?page=${i}">${i}</a></li>
                            </c:forEach>
                            
                            
<!--                            <li class="page-item active"><a class="page-link" href="?page=1">1</a></li>
                            <li class="page-item"><a class="page-link" href="?page=2">2</a></li>
                            <li class="page-item"><a class="page-link" href="?page=3">3</a></li>-->
                            <li class="page-item"><a class="page-link" href="?page=2">»</a></li>
                        </ul>
                    </nav>
                </section>
            </div>
        </main>

        <!-- Course detail modal -->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailModalLabel">Chi tiết khóa học</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-md-5">
                                <img id="modalImg" src="" alt="Course image" class="img-fluid rounded">
                            </div>
                            <div class="col-md-7">
                                <h4 id="modalTitle"></h4>
                                <p id="modalDesc" class="text-muted"></p>
                                <p><strong>Giá:</strong> <span id="modalPrice" class="text-success"></span></p>

                                <form method="post" action="cart/add">
                                    <input type="hidden" name="courseId" id="modalCourseId" value="">
                                    <div class="d-flex gap-2">
                                        <button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
                                        <a href="checkout?courseId=" id="buyNowBtn" class="btn btn-outline-success">Mua ngay</a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Offcanvas: Cart -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas" aria-labelledby="cartOffcanvasLabel">
            <div class="offcanvas-header">
                <h5 id="cartOffcanvasLabel">Giỏ hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Đóng"></button>
            </div>
            <div class="offcanvas-body">
                <div id="cartItems">
                    <!-- Cart items sẽ render từ server hoặc JS -->
                    <p class="text-muted">Giỏ hàng trống.</p>
                </div>
                <div class="mt-3">
                    <a href="checkout" class="btn btn-success w-100">Thanh toán</a>
                </div>
            </div>
        </div>

        <footer class="bg-light py-3 mt-5 border-top">
            <div class="container d-flex justify-content-between">
                <small class="text-muted">&copy; <%= java.time.Year.now() %> CodeAcademy</small>
                <div>
                    <a href="#" class="me-3 text-muted text-decoration-none">Chính sách</a>
                    <a href="#" class="text-muted text-decoration-none">Liên hệ</a>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS (CDN) + small client script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Khi modal show, fill data từ button data-*
            var detailModal = document.getElementById('detailModal');
            detailModal.addEventListener('show.bs.modal', function (event) {
                var button = event.relatedTarget;
                var id = button.getAttribute('data-id');
                var title = button.getAttribute('data-title');
                var desc = button.getAttribute('data-desc');
                var img = button.getAttribute('data-img');
                var price = button.getAttribute('data-price');

                document.getElementById('modalCourseId').value = id;
                document.getElementById('modalTitle').textContent = title;
                document.getElementById('modalDesc').textContent = desc;
                document.getElementById('modalImg').src = img;
                document.getElementById('modalPrice').textContent = price + '₫';
                // Buy now link
                var buyNowBtn = document.getElementById('buyNowBtn');
                buyNowBtn.href = 'checkout?courseId=' + encodeURIComponent(id);
            });

            // (Tùy chọn) demo: cập nhật cartCount nếu localStorage có cart
            function refreshCartCount() {
                try {
                    var cart = JSON.parse(localStorage.getItem('cart')) || [];
                    document.getElementById('cartCount').textContent = cart.length;
                    var cartItems = document.getElementById('cartItems');
                    if (cart.length === 0) {
                        cartItems.innerHTML = '<p class="text-muted">Giỏ hàng trống.</p>';
                    } else {
                        var html = '<ul class="list-group">';
                        cart.forEach(function (it, idx) {
                            html += '<li class="list-group-item d-flex justify-content-between align-items-center">' +
                                    '<div><strong>' + it.title + '</strong><div class="small text-muted">Giá: ' + it.price + '₫</div></div>' +
                                    '<form class="ms-2" onsubmit="removeFromCart(event,' + idx + ')"><button class="btn btn-sm btn-outline-danger">Xóa</button></form>' +
                                    '</li>';
                        });
                        html += '</ul>';
                        cartItems.innerHTML = html;
                    }
                } catch (e) {
                    console.error(e);
                }
            }
            function removeFromCart(e, idx) {
                e.preventDefault();
                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart.splice(idx, 1);
                localStorage.setItem('cart', JSON.stringify(cart));
                refreshCartCount();
            }
            refreshCartCount();
        </script>
    </body>
</html>
