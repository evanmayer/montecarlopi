c     ################################################
c     Written as a part of J u a n  C o l l a r ' s
c     P H Y S  2 5 0 0 0 course,
c     Computational Physics.
c     updated 8 Jan 2017
c     Evan Mayer
c     ################################################

      program pifinder

c     finding the value of pi using
c     a circle circumscribed by a square, and hit-
c     and-miss methods (Von Neumann)

c     CPU timer from
c     https://gcc.gnu.org/onlinedocs/gfortran/CPU_005fTIME.html
c     file I/O is excluded, to time the actual operation.
      common IX
      real :: start, finish
      integer :: c, trials
      IX = 77777

      open(unit=1, file='pifinder.out', status='unknown')

c     the square of side s = 1. has area A = 1.
c     circle has radius r = s side of square, so area
c     A' = (pi * (s**2.) )/4.
c     => pi = 4. * (A'/A)

      write(1,100),"# Trials  ","Approx. of Pi"
  100 format (A, A13)
c     let trials be the number of calls to the PRNG.
c     pival holds the value of pi being calculated,
c     bin contains the number of points that fall inside the circle.
      call cpu_time(start)
      trials = 1000000
      pival = 0.
      bin = 0.
      do c=1,trials
         call randm(RN1)
         x = RN1 ! a random x value between 0 and 1
         ylim = sin(acos(x)) ! what yvalue would put this x val inside the circ
         call randm(RN1)
         y = RN1 ! a random x value between 0 and 1
         if (y .lt. ylim) bin = bin + 1.
      end do

      pival = 4.*(bin/trials) !representative of relative areas
      call cpu_time(finish)

      write(1,200), trials, pival
  200 format (I7, F13.8)
      write(1,300) "Time = ",finish-start," seconds."
  300 format (A, F6.3, A)

      stop
      end

C ************************************************
C     Subroutine provided by the instructor; based
C     on the infamous "RANDU" PRNG, but with 6539
C     instead of 65539, for more random output.
C ************************************************
      SUBROUTINE RANDM(RN1)
      COMMON IX
      IY=IX*6539
      IF(IY)5,6,6
 5     IY=IY+2147483647+1
 6      RN1=IY
      RN1=RN1*.4656613E-9
      IX=IY
      RETURN
      END
C *********************************************
