<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="aheader.jsp" />
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
        <div class="page-header d-flex align-items-center"
            style="background-image:linear-gradient(rgba(5, 255, 101, 0.184), rgba(43, 58, 82, 0.262)), url('../img/bg.avif');">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h2>Faq's</h2>

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
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-5">
                                    <h2 class="h3">Add a Faq</h2>
                                </div>
                            </div>
                        </div>
                        <form action="/faqs" method="post" onsubmit="location.reload();">
                            <div class="row gy-3 gy-md-4 overflow-hidden">
                                <div class="col-12">
                                    <label for="question" class="form-label">Question<span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="question" id="question"
                                        placeholder="Add a faq question over here" required>
                                </div>
                                <div class="col-12">
                                    <label for="answer" class="form-label">Answer <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="answer" id="answer"
                                        placeholder="Add your answer" required>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <input class="btn btn-lg btn-success" type="submit" value="submit" />
                                        <br>
                                        ${sms}
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Password Reset 2 - Bootstrap Brain Component -->
    <table class="table table-dark table-hover mt-5 table-bordered"" >
    <tr class=" table-success">
        
        <th class="p-4">Questions</th>
        <th class="p-4">Answers</th>
        <th class="p-4">Action</th>

        </tr>
        <c:forEach var="faqd" items="${faq}">
            <tr>
                
                <td class="p-4">${faqd.questions}</td>
                <td class="p-4">${faqd.answers}</td>
                <td>
                    <form action="/managefaq" method="post">
                        <input type="hidden" name="id" value="${faqd.id}">
                        <input type="submit" name="btn" class="btn btn-md btn-success" value="Edit"><br> <br>
                        <input type="submit" name="btn" class="btn btn-md btn-success" value="Delete">
                    </form>

                </td>
            </tr>
        </c:forEach>
    </table>
