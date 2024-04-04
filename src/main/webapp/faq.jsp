<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<!-- ======= Breadcrumbs ======= -->
<div class="breadcrumbs">
    <div class="page-header d-flex align-items-center"
        style="background-image:linear-gradient(rgba(5, 255, 101, 0.184), rgba(43, 58, 82, 0.262)), url('img/bg.avif');">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                    <h2>FAQ'S</h2>

                </div>
            </div>
        </div>
    </div>
    <nav>
        <div class="container">
            <ol>
                <li><a href="/">Home</a></li>
                <li>Faq's</li>
            </ol>
        </div>
    </nav>
</div><!-- End Breadcrumbs -->
<!-- ======= Frequently Asked Questions Section ======= -->
<section id="faq" class="faq">
    <div class="container" data-aos="fade-up">

        <div class="section-header">
            <span>Frequently Asked Questions</span>
            <h2>Frequently Asked Questions</h2>

        </div>

        <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="200">
            <div class="col-lg-10">

                <div class="accordion accordion-flush" id="faqlist">
                    <c:forEach var="faq" items="${faqdetails}" varStatus="loop">
                        <div class="accordion-item">
                            <h3 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#faq-content-${loop.index}">
                                    <i class="bi bi-question-circle question-icon"></i>
                                    ${faq.questions}
                                </button>
                            </h3>
                            <div id="faq-content-${loop.index}" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                <div class="accordion-body">
                                    ${faq.answers}
                                </div>
                            </div>
                        </div><!-- # Faq item-->
                    </c:forEach>
                </div>
                

            </div>
        </div>
    </div>
</section><!-- End Frequently Asked Questions Section -->



<jsp:include page="footer.jsp" />