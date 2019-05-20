// Символы Юникод
// Autogenerated with DRAKON Editor 1.30


function Quadric__p_discriminant() {
    // item 40
    return this.b() * this.b() - 4 * this.a() * this.c()
}

function Quadric__p_roots() {
    // item 710001
    if (this.discriminant() > 0) {
        // item 80
        var radix = Math.sqrt(this.discriminant())
        // item 79
        var x1 = (-this.b() + radix) / (2 * this.a())
        var x2 = (-this.b() - radix) / (2 * this.a())
        // item 81
        return [x1, x2]
    } else {
        // item 710002
        if (this.discriminant() == 0) {
            // item 82
            var x = -this.b() / (2 * this.a())
            // item 83
            return [x]
        } else {
            // item 710003
            if (this.discriminant() < 0) {
                
            } else {
                // item 710004
                throw "Not expected condition.";
            }
            // item 84
            return []
        }
    }
}

function Quadric_roots(a, b, c) {
    var _task = new Quadric()
    _task.a(a)
    _task.b(b)
    _task.c(c)
    return _task.roots()
}

function Quadric() {
    this._a = null
    this.a = function(newValue) {
        if (typeof newValue != "undefined") {
            this._a = newValue
            this._discriminant = null
            this._roots = null
            return
        }
        return this._a
    }
    this._b = null
    this.b = function(newValue) {
        if (typeof newValue != "undefined") {
            this._b = newValue
            this._discriminant = null
            this._roots = null
            return
        }
        return this._b
    }
    this._c = null
    this.c = function(newValue) {
        if (typeof newValue != "undefined") {
            this._c = newValue
            this._discriminant = null
            this._roots = null
            return
        }
        return this._c
    }
    this._discriminant = null
    this.discriminant = function() {
        var value = this._discriminant
        if (value != null) {
            return value
        }
        value = Quadric__p_discriminant.call(this)
        this._discriminant = value
        return value
    }
    this._roots = null
    this.roots = function() {
        var value = this._roots
        if (value != null) {
            return value
        }
        value = Quadric__p_roots.call(this)
        this._roots = value
        return value
    }
}



