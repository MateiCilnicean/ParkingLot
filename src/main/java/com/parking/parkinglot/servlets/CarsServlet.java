package com.parking.parkinglot.servlets;
import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.ejb.CarsBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CarsServlet", value = "/CarsServlet")
public class CarsServlet extends HttpServlet {
    @Inject
    CarsBean carsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CarDto> cars = carsBean.findAllCars();

        request.setAttribute("cars", cars);
        request.setAttribute("numberOfFreeParkingSpots", 10);
        request.getRequestDispatcher("/WEB-INF/pages/cars.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] carIdsAsString = request.getParameterValues("car_ids");
        if (carIdsAsString != null) {
            List<Long> carIds = new ArrayList<>();
            for (String carIdAsString : carIdsAsString) {
                carIds.add(Long.parseLong(carIdAsString));
            }
            carsBean.deleteCarsById(carIds);
        }
        response.sendRedirect(request.getContextPath() + "/CarsServlet");
    }
}