program testing
        implicit none
        integer :: m,n,i
        real (kind=4), dimension(4,4) :: x,y
        real (kind=4), dimension(4,4) :: su
        x=reshape((/2, 3, 4, 5, 3, 4, 5, 6, 7, 8, 9, 10 ,10, 11, 12, 13/),(/4, 4/))
        y=reshape((/2, 3, 4, 5, 3, 4, 5, 6, 7, 8, 9, 10 ,10, 11, 12, 13/),(/4, 4/))
        m=size(x, dim=1)
        n=size(x, dim=2)
        call func(x,y,m,n,su)
        do i=1,n
                print *,su(i,:)
        end do
end program testing

subroutine func(x,y,m,n,su)
        implicit none
        integer, intent(in) :: m,n
        real (kind=4), dimension(m,n), intent(in) :: x,y
        real (kind=4), dimension(m,n), intent(out) :: su
        su=matmul(x,y)
end subroutine func
