<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="java.util.*" %>
    <jsp:include page="aheader.jsp" />

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center"
        style="background-image:linear-gradient(rgba(5, 255, 101, 0.184), rgba(43, 58, 82, 0.262)), url('../img/bg.avif');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Vendor Details</h2>
            </div>
          </div>
        </div>
      </div>
    </div><!-- End Breadcrumbs -->



    <table class="table table-dark table-hover mt-5 table-bordered">
      <tr class="table-success">
        <th class="p-4">vendor id</th>
        <th class="p-4">Name</th>
        <th class="p-4">Mobile</th>
        <th class="p-4">Email</th>
        <th class="p-4">Company</th>
        <th class="p-4">Address</th>
        <th class="p-4">Image</th>
        <th class="p-4">Action</th>
      </tr>
      <c:forEach var="vendor" items="${vendordetails}">
        <tr>
          <td class="p-4">${vendor.vendor_id}</td>
          <td class="p-4">${vendor.vname}</td>
          <td class="p-4">${vendor.vmobile}</td>
          <td class="p-4">${vendor.vemail}</td>
          <td class="p-4">${vendor.company}</td>
          <td class="p-4">${vendor.address}</td>
          <td class="p-4"><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(vendor.photo)}"
              alt="vendor photo" width="100px" /></td>
          <td>
            <form action="/removevendor" method="post">
              <input type="hidden" name="vendor_id" value="${vendor.vendor_id}">
              <input type="submit" name="btn" class="btn btn-md btn-success" value="Remove vendor">
            </form>
          </td>
        </tr>
      </c:forEach>

    </table>