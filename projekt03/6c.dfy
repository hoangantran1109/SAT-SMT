method initialized(a: array<int>, n: int)
    requires forall k: int ::
        0 < k < n ==> a[k] == 0;
{
    var i: int;
    assume 0 <= i && i < n;
    assert a[i] != 42;
}