// Autogenerated with DRAKON Editor 1.27

public class ReverseStringComparer implements Comparer {

    public int compare(Object leftObj, Object rightObj) {
        // item 6
        String left = (String)leftObj;
        String right = (String)rightObj;
        return right.compareTo(left);
    }
}