public class Rectangle implements ShapeInterface{
    public Rectangle(Double height, Double width) {
        this.height = height;
        this.width = width;
    }

    public Double height;
    public Double width;

    public Double calculateArea()
    {
        if(height != null && width != null) {
            return height * width;
        } else {
            throw new MyException('height or width must not be null');
        }
    }

    public Double calculatePerimeter()
    {
        if(height != null && width != null) {
            return 2 * height + 2 * width;
        } else {
            throw new MyException('height or width must not be null');
        }
    }
}