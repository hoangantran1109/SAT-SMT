method tax()
{
    var income: int;
    var percentage: int;

    if income < 1000 {
        percentage := 10;
    } else if income < 2000 {
        percentage := 25;
    } else {
        percentage := income / 10;
    }

    var tax := income / percentage;
    var payout := income - tax;

    assert payout < income;
}