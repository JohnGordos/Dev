public class Circle implements ShapeInterface{
    public Circle(Double radius) {
        this.radius = radius;
    }
    public Double radius;
    
    public Double calculateArea()
    {
        if(radius != null) {
            return Math.pi * Math.pow(radius, 2);
        } else {
            throw new MyException('radius must not be null');
        }
    }

    public Double calculatePerimeter()
    {
        if(radius != null) {
            return 2 * Math.pi * radius;
        } else {
            throw new MyException('radius must not be null');
        }
    }
}