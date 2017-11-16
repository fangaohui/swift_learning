int main()
{
    void (^blk)(void) = ^{ };
    blk();
    return 0;
}