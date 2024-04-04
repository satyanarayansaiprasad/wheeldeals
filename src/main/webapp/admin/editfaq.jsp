<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="aheader.jsp" />
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
        <div class="page-header d-flex align-items-center"
            style="background-image:linear-gradient(rgba(5, 255, 101, 0.184), rgba(43, 58, 82, 0.262)), url('../img/bg.avif');">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2>Update your Faq</h2>

                    </div>
                </div>
            </div>
        </div>
    </div><!-- End Breadcrumbs -->

    <div class="bg-light py-3 py-md-5">
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
                    <div class="bg-white p-4 p-md-5 rounded shadow-sm">
                        <form action="/updatefaq" method="post">
                            <div class="row gy-3 gy-md-4 overflow-hidden">
                                <div class="col-12">
                                    <label for="question" class="form-label">Question<span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="question" id="question"
                                        value="${faqs[0].questions}" required>
                                </div>
                                <div class="col-12">
                                    <label for="answer" class="form-label">Answer <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="answer" id="answer"
                                        value="${faqs[0].answers}" required>
                                </div>
                                <div class="col-12">
                                    <input type="hidden" class="form-control" name="id" id="id"
                                        value="${faqs[0].id}">
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <input class="btn btn-lg btn-success" name="btn" type="submit" value="Update" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>