<%@ page import="java.util.*" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

      <script type="text/javascript">
        $(document).ready(function () {
          $("input[type='button']").click(function () {
            var selectdiv = $(".col-sm-9");
            div = $(this).parents(selectdiv);
            //alert(div.html());
            btn = $(this).val();
            //alert(btn);


            if (btn == "Edit") {
              $(this).val("update");

              div.find(".lbl").addClass('h');
              div.find(".lbl").removeClass('s');

              div.find(".txt").addClass('s');
              div.find(".txt").removeClass('h');
            }
            else if (btn == "update") {
              $(this).val("Edit");
              div.find(".profileNameshow").addClass('s');
              var dataToSend = {
                v_id: div.find("#v_id").val(),
                vname: div.find("#vname").val(),
                vemail: div.find("#vemail").val(),
                vcom: div.find("#vcom").val(),
                vmob: div.find("#vmob").val(),
                vadr: div.find("#vadr").val()
              };

              // alert(vname);

              $.ajax({
                url: "/Account",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(dataToSend),
                success: function (response) {
                  window.location.reload();
                }

              });
            }

          })

        })

      </script>

      <style>
        .h {
          display: none;
        }

        .s {
          display: block;
        }
      </style>


      <jsp:include page="vheader.jsp" />

      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
        <div class="page-header d-flex align-items-center"
          style="background-image:linear-gradient(rgba(5, 255, 101, 0.184), rgba(43, 58, 82, 0.262)), url('../img/bg.avif');">
          <div class="container position-relative">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-6 text-center">
                <h2>Account Details</h2>

              </div>
            </div>
          </div>
        </div>
      </div><!-- End Breadcrumbs -->
      <c:forEach var="vendor" items="${vendordetails}">
        <section style="background-color: #eee;">
          <div class="container py-5">


            <div class="row">
              <div class="col-lg-4">
                <div class="card mb-4">
                  <div class="card-body text-center selectDiv">

                    <img src="data:image/jpeg;base64,${ Base64.getEncoder().encodeToString(vendor.photo) }" class="rounded-circle img-fluid profileNameshow s m-auto" style="width: 150px;">
                    <h5 class="my-3 profileNameshow s">${vendor.vname}</h5>

                    <div class="d-flex justify-content-center mb-2">
                      <input type="button" class="btn btn-success" value="Edit" />

                    </div>
                  </div>
                </div>

              </div>



              <div class="col-lg-8">
                <div class="card mb-4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-sm-3">
                        <p class="mb-0">Full Name</p>
                      </div>
                      <div class="col-sm-9">
                        <p class="text-muted mb-0">
                          <input type="hidden" id="v_id" value="${vendor.vendor_id}">
                          <label class="s lbl">${vendor.vname}</label>
                          <input class="h txt" id="vname" value="${vendor.vname}">

                        </p>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <p class="mb-0">Email</p>
                      </div>
                      <div class="col-sm-9">

                        <p class="text-muted mb-0">
                          <label class="s lbl">${vendor.vemail}</label>
                          <input class="h txt" id="vemail" value="${vendor.vemail}">
                        </p>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <p class="mb-0">Company</p>
                      </div>
                      <div class="col-sm-9">
                        <p class="text-muted mb-0">
                          <label class="s lbl">${vendor.company}</label>
                          <input class="h txt" id="vcom" value="${vendor.company}">
                        </p>

                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <p class="mb-0">Mobile</p>
                      </div>
                      <div class="col-sm-9">
                        <p class="text-muted mb-0">
                          <label class="s lbl">${vendor.vmobile}</label>
                          <input class="h txt" id="vmob" value="${vendor.vmobile}">
                        </p>

                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <p class="mb-0">Address</p>
                      </div>
                      <div class="col-sm-9">
                        <p class="text-muted mb-0">
                          <label class="s lbl">${vendor.address}</label>
                          <input class="h txt" id="vadr" value="${vendor.address}">
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
          </div>
        </section>
      </c:forEach>