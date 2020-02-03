Content-Type: multipart/mixed; boundary="===============2594439416945126322=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [zen-kernel-zen-kernel:5.4/muqss 15/17] kernel/time/timer.c:1919:1: warning: unused label 'out_timeout'
Date: Mon, 03 Feb 2020 15:06:19 +0000
Message-ID: <CAKwvOd=m1fp8qLk8eZFn63PhJTd5mpP3Qi=u_oNVnOJkEUiP=Q@mail.gmail.com>
In-Reply-To: <202002030709.xW4dkIFZ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2594439416945126322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Jan, can you please take a look at the following report?  It looks
like the label should probably have the same preprocessor guards as
the goto.

On Mon, Feb 3, 2020 at 2:05 AM kbuild test robot <lkp@intel.com> wrote:
>
> CC: kbuild-all(a)lists.01.org
> TO: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
>
> tree:   https://github.com/zen-kernel/zen-kernel 5.4/muqss
> head:   3ca137b68d689fcb1c5cadad1416c7791d84d48e
> commit: 880a7229b3627f9933d30f847da350e1ff53ba2d [15/17] muqss: Make hrti=
meout patches depend on MuQSS
> config: arm64-defconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project ba8110161dfb=
096bbc63039afd87ff6417328f91)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 880a7229b3627f9933d30f847da350e1ff53ba2d
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/time/timer.c:1919:1: warning: unused label 'out_timeout' [-Wunu=
sed-label]
>    out_timeout:
>    ^~~~~~~~~~~~
>    1 warning generated.
>
> vim +/out_timeout +1919 kernel/time/timer.c
>
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1832
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1833  /**
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1834   * schedule_timeout - sleep until timeout
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1835   * @timeout: timeout value in jiffies
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1836   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1837   * Make the current task sleep until @timeout jiffies have
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1838   * elapsed. The routine will return immediately unless
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1839   * the current task state has been set (see set_current_state()=
).
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1840   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1841   * You can set the task state as follows -
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1842   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1843   * %TASK_UNINTERRUPTIBLE - at least @timeout jiffies are guaran=
teed to
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1844   * pass before the routine returns unless the current task is e=
xplicitly
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1845   * woken up, (e.g. by wake_up_process())".
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1846   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1847   * %TASK_INTERRUPTIBLE - the routine may return early if a sign=
al is
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1848   * delivered to the current task or the current task is explici=
tly woken
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1849   * up.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1850   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1851   * The current task state is guaranteed to be TASK_RUNNING when=
 this
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1852   * routine returns.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1853   *
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1854   * Specifying a @timeout value of %MAX_SCHEDULE_TIMEOUT will sc=
hedule
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1855   * the CPU away without a bound on the timeout. In this case th=
e return
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1856   * value will be %MAX_SCHEDULE_TIMEOUT.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1857   *
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1858   * Returns 0 when the timer has expired otherwise the remaining=
 time in
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1859   * jiffies will be returned.  In all cases the return value is =
guaranteed
> 4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson                2016-1=
0-21  1860   * to be non-negative.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1861   */
> 7ad5b3a505e68c kernel/timer.c      Harvey Harrison                 2008-0=
2-08  1862  signed long __sched schedule_timeout(signed long timeout)
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1863  {
> 58e1177b4cd10b kernel/time/timer.c Kees Cook                       2017-1=
0-04  1864     struct process_timer timer;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1865     unsigned long expire;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1866
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1867     switch (timeout)
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1868     {
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1869     case MAX_SCHEDULE_TIMEOUT:
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1870             /*
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1871              * These two special cases are useful to be comforta=
ble
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1872              * in the caller. Nothing more. We could take
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1873              * MAX_SCHEDULE_TIMEOUT from one of the negative val=
ue
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1874              * but I' d like to return a valid offset (>=3D0) to=
 allow
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1875              * the caller to do everything it want with the retv=
al.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1876              */
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1877             schedule();
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1878             goto out;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1879     default:
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1880             /*
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1881              * Another bit of PARANOID. Note that the retval wil=
l be
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1882              * 0 since no piece of kernel is supposed to do a ch=
eck
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1883              * for a negative retval of schedule_timeout() (sinc=
e it
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1884              * should never happens anyway). You just have the p=
rintk()
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1885              * that will tell you if something is gone wrong and=
 where.
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1886              */
> 5b149bcc230e46 kernel/timer.c      Andrew Morton                   2006-1=
2-22  1887             if (timeout < 0) {
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1888                     printk(KERN_ERR "schedule_timeout: wrong tim=
eout "
> 5b149bcc230e46 kernel/timer.c      Andrew Morton                   2006-1=
2-22  1889                             "value %lx\n", timeout);
> 5b149bcc230e46 kernel/timer.c      Andrew Morton                   2006-1=
2-22  1890                     dump_stack();
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1891                     current->state =3D TASK_RUNNING;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1892                     goto out;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1893             }
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1894     }
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1895
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1896     expire =3D timeout + jiffies;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1897
> 880a7229b3627f kernel/time/timer.c Jan Alexander Steffens (heftig  2018-0=
9-05  1898) #if defined(CONFIG_HIGH_RES_TIMERS) && defined(CONFIG_SCHED_MUQ=
SS)
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1899     if (timeout =3D=3D 1 && hrtimer_resolution < NSEC_PER_SEC / =
HZ) {
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1900             /*
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1901              * Special case 1 as being a request for the minimum=
 timeout
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1902              * and use highres timers to timeout after 1ms to wo=
rkaround
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1903              * the granularity of low Hz tick timers.
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1904              */
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1905             if (!schedule_min_hrtimeout())
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1906                     return 0;
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1907             goto out_timeout;
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1908     }
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05  1909  #endif
> 58e1177b4cd10b kernel/time/timer.c Kees Cook                       2017-1=
0-04  1910     timer.task =3D current;
> 58e1177b4cd10b kernel/time/timer.c Kees Cook                       2017-1=
0-04  1911     timer_setup_on_stack(&timer.timer, process_timeout, 0);
> b24591e2fcf852 kernel/time/timer.c David Howells                   2017-1=
1-09  1912     __mod_timer(&timer.timer, expire, 0);
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1913     schedule();
> 58e1177b4cd10b kernel/time/timer.c Kees Cook                       2017-1=
0-04  1914     del_singleshot_timer_sync(&timer.timer);
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1915
> c6f3a97f86a5c9 kernel/timer.c      Thomas Gleixner                 2008-0=
4-30  1916     /* Remove the timer from the object tracker */
> 58e1177b4cd10b kernel/time/timer.c Kees Cook                       2017-1=
0-04  1917     destroy_timer_on_stack(&timer.timer);
> 880a7229b3627f kernel/time/timer.c Jan Alexander Steffens (heftig  2018-0=
9-05  1918)
> be525d11c20156 kernel/time/timer.c Con Kolivas                     2016-1=
1-05 @1919  out_timeout:
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1920     timeout =3D expire - jiffies;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1921
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1922   out:
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1923     return timeout < 0 ? 0 : timeout;
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1924  }
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1925  EXPORT_SYMBOL(schedule_timeout);
> ^1da177e4c3f41 kernel/timer.c      Linus Torvalds                  2005-0=
4-16  1926
>
> :::::: The code at line 1919 was first introduced by commit
> :::::: be525d11c201565e2c8999efc3f78c745f5d6886 Special case calls of sch=
edule_timeout(1) to use the min hrtimeout of 1ms, working around low Hz res=
olutions.
>
> :::::: TO: Con Kolivas <kernel@kolivas.org>
> :::::: CC: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration



-- =

Thanks,
~Nick Desaulniers
--===============2594439416945126322==--

