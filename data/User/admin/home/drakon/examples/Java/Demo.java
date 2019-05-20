// Autogenerated with DRAKON Editor 1.29
import java.util.Iterator;
import java.lang.IllegalStateException;
import java.util.List;
import java.util.ArrayList;

//Символы Юникод

public class Demo {

    public static void main(String[] args) {
        // item 52
        System.out.println("DRAKON-Java demo");
        System.out.println("================");
        // item 242
        alt_select_test();
        // item 189
        foreachDemo();
        // item 50
        quicksortDemo();
        // item 193
        String result = "success";
        // item 192
        System.out.println(result);
    }

    static void alt_select_test() {
        // item 197
        alternative_select(-100, -1);
        alternative_select(100, 1);
        alternative_select(0, 0);
    }

    static void alternative_select(int value, int expected) {
        // item 205
        int actual;
        // item 2060001
        if (value < 0) {
            // item 214
            actual = -1;
        } else {
            // item 2060002
            if (value == 0) {
                // item 215
                actual = 0;
            } else {
                // item 216
                actual = 1;
            }
        }
        // item 217
        if (actual == expected) {
            
        } else {
            // item 223
            throw new 
            IllegalStateException("alt select failure!\n");
        }
        // item 2270001
        if (value < 0) {
            // item 235
            actual = -1;
        } else {
            // item 2270002
            if (value == 0) {
                // item 236
                actual = 0;
            } else {
                // item 2270003
                if (value > 0) {
                    
                } else {
                    // item 2270004
                    throw new IllegalStateException("Condition was not detected.");
                }
                // item 237
                actual = 1;
            }
        }
        // item 238
        if (actual == expected) {
            
        } else {
            // item 243
            throw new 
            IllegalStateException("alt select failure!\n");
        }
    }

    private static List<Object> arrayToList(Object[] input) {
        // item 106
        ArrayList<Object> result = new ArrayList<Object>();
        // item 1050001
        int i = 0;
        while (true) {
            // item 1050002
            if (i < input.length) {
                
            } else {
                break;
            }
            // item 108
            Object item = input[i];
            result.add(item);
            // item 1050003
            i++;
        }
        // item 107
        return result;
    }

    private static List<Integer> fibonacci(int n) {
        // item 185
        List<Integer> result = 
          new ArrayList<Integer>();
        // item 186
        result.add(0);
        // item 1610001
        if (n == 0) {
            
        } else {
            // item 1610002
            if (n == 1) {
                // item 187
                result.add(1);
            } else {
                // item 188
                result.add(1);
                // item 1710001
                int i = 2;
                while (true) {
                    // item 1710002
                    if (i <= n) {
                        
                    } else {
                        break;
                    }
                    // item 172
                    Integer f2 = result.get(i - 2);
                    Integer f1 = result.get(i - 1);
                    Integer fib = f1 + f2;
                    // item 173
                    result.add(fib);
                    // item 1710003
                    i++;
                }
            }
        }
        // item 176
        return result;
    }

    private static void foreachDemo() {
        // item 155
        System.out.println("iteration demo");
        // item 153
        List<Integer> sequence = fibonacci(15);
        // item 154
        printListArrow(sequence);
        printListFor(sequence);
        printListForeach(sequence);
        // item 156
        System.out.println();
        // item 284
        testEarly(20, 60);
        // item 285
        testEarly(35, 70);
        // item 286
        testEarly(4, 0);
    }

    private static int foreachEarlyExit(int value) {
        // item 272
        int found = -1;
        int normal_256;
        normal_256 = 1;
        for (int x : new int[] {10, 20, 30}) {
            // item 260
            if (x == value) {
                // item 264
                found = x;
                normal_256 = 0;
                break;
            } else {
                
            }
        }
        if (normal_256 == 1) {
            // item 263
            found = 0;
        }
        for (int x : new int[] {40, 20, 70}) {
            // item 271
            int m = x / 2;
            // item 266
            if (m == value) {
                // item 270
                return x + found;
            } else {
                
            }
        }
        // item 269
        return 0;
    }

    private static void print(List<Object> collection) {
        for (Object item : collection) {
            // item 98
            write(item);
        }
        // item 99
        System.out.println();
    }

    private static void printListArrow(List<Integer> collection) {
        // item 131
        System.out.println("using if and arrow:");
        // item 126
        int length = collection.size();
        int i = 0;
        while (true) {
            // item 127
            if (i < length) {
                
            } else {
                break;
            }
            // item 125
            Integer item = collection.get(i);
            write(item);
            // item 129
            i++;
        }
        // item 132
        System.out.println("");
    }

    private static void printListFor(List<Integer> collection) {
        // item 142
        System.out.println("using for:");
        // item 184
        int length = collection.size();
        // item 1390001
        int i = 0;
        while (true) {
            // item 1390002
            if (i < length) {
                
            } else {
                break;
            }
            // item 183
            Integer item = collection.get(i);
            write(item);
            // item 1390003
            i += 1;
        }
        // item 143
        System.out.println("");
    }

    private static void printListForeach(List<Integer> collection) {
        // item 119
        System.out.println("using foreach:");
        for (Integer item : collection) {
            // item 116
            write(item);
        }
        // item 118
        System.out.println("");
    }

    private static void quicksortDemo() {
        // item 62
        System.out.println("quick sort demo");
        // item 58
        List<Object> unsorted = arrayToList(new Object[] { "the", "sooner", "we", "start", "this", "the", "better" });
        List<Object> sorted   = arrayToList(new Object[] { "aa", "bb", "cc", "dd", "ee", "ff" });
        List<Object> reverse  = arrayToList(new Object[] { "ff", "ee", "dd", "cc", "bb", "aa" });
        List<Object> empty    = arrayToList(new Object[] {});
        List<Object> flat     = arrayToList(new Object[] { "flat", "flat", "flat", "flat", "flat" });
        // item 59
        Comparer comparer = new ReverseStringComparer();
        Sorter.quicksort(comparer, unsorted, 0, unsorted.size());
        Sorter.quicksort(comparer, sorted, 0, sorted.size());
        Sorter.quicksort(comparer, reverse, 0, reverse.size());
        Sorter.quicksort(comparer, empty, 0, empty.size());
        Sorter.quicksort(comparer, flat, 0, flat.size());
        // item 60
        print(unsorted);
        print(sorted);
        print(reverse);
        print(empty);
        print(flat);
        // item 61
        stringsAreSorted(unsorted);
        stringsAreSorted(sorted);
        stringsAreSorted(reverse);
        stringsAreSorted(empty);
        stringsAreSorted(flat);
        // item 65
        System.out.println();
    }

    private static void stringsAreSorted(List<Object> array) {
        String current = null;
        String after = null;
        int i = 0, j = 0;
        int length = array.size();
        int cmpResult = 0;
        int _next_item_ = 0;
        _next_item_ = 710001;
        while (true) {
            if (_next_item_ == 710001) {
                i = 0;
                _next_item_ = 710002;
        
            } else if (_next_item_ == 710002) {
                if (i < length) {
                    // item 73
                    current = (String)array.get(i);
                    _next_item_ = 740001;
                } else {
                    return;
                }
        
            } else if (_next_item_ == 740001) {
                j = i + 1;
                _next_item_ = 740002;
        
            } else if (_next_item_ == 740002) {
                if (j < length) {
                    // item 76
                    after = (String)array.get(j);
                    _next_item_ = 190;
                } else {
                    // item 710003
                    i += 1;
                    _next_item_ = 710002;
                }
        
            } else if (_next_item_ == 190) {
                cmpResult = current.compareTo(after);
                _next_item_ = 191;
        
            } else if (_next_item_ == 191) {
                if (cmpResult < 0) {
                    // item 88
                    _next_item_ = 77;
                } else {
                    // item 740003
                    j += 1;
                    _next_item_ = 740002;
                }
        
            } else if (_next_item_ == 77) {
                throw new IllegalStateException("Collection is not sorted.");
        
            }
        }
    }

    private static void testEarly(int value, int expected) {
        // item 279
        int actual = foreachEarlyExit(value);
        // item 280
        if (actual == expected) {
            
        } else {
            // item 283
            throw new IllegalStateException("foreach_early_exit failed: " + actual + " " + expected);
        }
    }

    private static void write(Object item) {
        // item 180
        System.out.print(item);
        System.out.print(" ");
    }
}
