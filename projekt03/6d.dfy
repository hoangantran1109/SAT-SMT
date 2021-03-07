method palindrom(a: array<int>, n: int)
  requires forall k: int ::
    0 <= k < n ==> a[k] == a[n-k-1];
{
    var i: int;

    assume n == 5;
    assume 0 <= i && i < n;
    assert a[0] == a[4] && a[1] == a[3];
}