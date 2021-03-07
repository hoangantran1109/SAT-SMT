method swap()
{
    var a0: int;
    var b0: int;

    var c := a0 + b0;
    var b1 := c - b0;
    var a1 := c - b1;

    assert a1 == b0 && b1 == a0;
}