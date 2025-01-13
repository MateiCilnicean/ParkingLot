<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>

    <form method="POST" action="${pageContext.request.contextPath}/CarsServlet">

        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <a href="${pageContext.request.contextPath}/AddCarServlet" class="btn btn-primary btn-lg">Add Car</a>
            <button class="btn btn-danger" type="submit">Delete Cars</button>
        </c:if>

        <div class="container text-center">
            <c:forEach var="car" items="${cars}">
                <div class="row">
                    <div class="col">
                        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                            <input type="checkbox" name="car_ids" value="${car.id}" />
                        </c:if>
                    </div>

                    <div class="col">
                        ${car.licensePlate}
                    </div>
                    <div class="col">
                        ${car.parkingSpot}
                    </div>
                    <div class="col">
                        ${car.ownerName}
                    </div>
                    <div class="col">
                        <img src="${pageContext.request.contextPath}/CarPhotosServlet?id=${car.id}" width="48"/>
                    </div>

                    <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                        <div class="col">
                            <a class="btn btn-secondary"
                               href="${pageContext.request.contextPath}/AddCarPhotoServlet?id=${car.id}" role="button">Add photo</a>
                        </div>

                        <div class="col">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCarServlet?id=${car.id}">Edit Car</a>
                        </div>
                    </c:if>

                </div>
            </c:forEach>
        </div>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>