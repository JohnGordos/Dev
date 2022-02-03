public class GeometryOperations {
    public GeometryOperations() {

    }

    public Double calculateTotalArea(List<ShapeInterface> shapes) {
        Double result = 0;
        for(ShapeInterface shape : shapes) {
            result += shape.calculateArea();
        }
        return result;
    }
}