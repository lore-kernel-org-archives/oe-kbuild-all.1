Content-Type: multipart/mixed; boundary="===============4463338227606500552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 1/6] ptp: add ptp virtual clock driver framework
Date: Fri, 07 May 2021 19:26:33 +0800
Message-ID: <202105071901.AkYZrUSI-lkp@intel.com>
In-Reply-To: <20210507085756.20427-2-yangbo.lu@nxp.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4463338227606500552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yangbo,

I love your patch! Yet something to improve:

[auto build test ERROR on 9d31d2338950293ec19d9b095fbaa9030899dcb4]

url:    https://github.com/0day-ci/linux/commits/Yangbo-Lu/ptp-support-virt=
ual-clocks-for-multiple-domains/20210507-164927
base:   9d31d2338950293ec19d9b095fbaa9030899dcb4
config: nds32-randconfig-r012-20210507 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1f46e22fa0f24ac9acde10ca8=
97266e0bac0f367
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yangbo-Lu/ptp-support-virtual-cloc=
ks-for-multiple-domains/20210507-164927
        git checkout 1f46e22fa0f24ac9acde10ca897266e0bac0f367
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_private.h:16,
                    from drivers/ptp/ptp_clock.c:20:
>> include/linux/ptp_clock_kernel.h:71:22: error: field 'cc' has incomplete=
 type
      71 |  struct cyclecounter cc;
         |                      ^~
   In file included from drivers/ptp/ptp_clock.c:20:
>> drivers/ptp/ptp_private.h:59:22: error: field 'cc' has incomplete type
      59 |  struct cyclecounter cc;
         |                      ^~
>> drivers/ptp/ptp_private.h:60:21: error: field 'tc' has incomplete type
      60 |  struct timecounter tc;
         |                     ^~
--
   In file included from drivers/ptp/ptp_private.h:16,
                    from drivers/ptp/ptp_vclock.c:8:
>> include/linux/ptp_clock_kernel.h:71:22: error: field 'cc' has incomplete=
 type
      71 |  struct cyclecounter cc;
         |                      ^~
   In file included from drivers/ptp/ptp_vclock.c:8:
>> drivers/ptp/ptp_private.h:59:22: error: field 'cc' has incomplete type
      59 |  struct cyclecounter cc;
         |                      ^~
>> drivers/ptp/ptp_private.h:60:21: error: field 'tc' has incomplete type
      60 |  struct timecounter tc;
         |                     ^~
   drivers/ptp/ptp_vclock.c: In function 'ptp_vclock_adjfine':
>> drivers/ptp/ptp_vclock.c:20:2: error: implicit declaration of function '=
timecounter_read'; did you mean 'refcount_read'? [-Werror=3Dimplicit-functi=
on-declaration]
      20 |  timecounter_read(&vclock->tc);
         |  ^~~~~~~~~~~~~~~~
         |  refcount_read
   drivers/ptp/ptp_vclock.c: In function 'ptp_vclock_adjtime':
>> drivers/ptp/ptp_vclock.c:33:2: error: implicit declaration of function '=
timecounter_adjtime' [-Werror=3Dimplicit-function-declaration]
      33 |  timecounter_adjtime(&vclock->tc, delta);
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_vclock.c: In function 'ptp_vclock_settime':
>> drivers/ptp/ptp_vclock.c:62:2: error: implicit declaration of function '=
timecounter_init'; did you mean 'timerqueue_init'? [-Werror=3Dimplicit-func=
tion-declaration]
      62 |  timecounter_init(&vclock->tc, &vclock->cc, ns);
         |  ^~~~~~~~~~~~~~~~
         |  timerqueue_init
   drivers/ptp/ptp_vclock.c: In function 'ptp_clock_find_domain_tstamp':
>> drivers/ptp/ptp_vclock.c:103:23: error: implicit declaration of function=
 'timecounter_cyc2time' [-Werror=3Dimplicit-function-declaration]
     103 |   domain_ts->tstamp =3D timecounter_cyc2time(&vclock->tc, domain=
_ts->tstamp);
         |                       ^~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/ptp/ptp_vclock.c: In function 'ptp_get_pclock_info':
>> include/linux/kernel.h:709:32: error: dereferencing pointer to incomplet=
e type 'const struct cyclecounter'
     709 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                ^~~~~~
   include/linux/compiler_types.h:308:9: note: in definition of macro '__co=
mpiletime_assert'
     308 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:328:2: note: in expansion of macro '_comp=
iletime_assert'
     328 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:709:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     709 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:709:20: note: in expansion of macro '__same_type'
     709 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   drivers/ptp/ptp_private.h:51:25: note: in expansion of macro 'container_=
of'
      51 | #define cc_to_vclock(d) container_of((d), struct ptp_vclock, cc)
         |                         ^~~~~~~~~~~~
   drivers/ptp/ptp_vclock.c:126:30: note: in expansion of macro 'cc_to_vclo=
ck'
     126 |  struct ptp_vclock *vclock =3D cc_to_vclock(cc);
         |                              ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/spi/spi.h:17,
                    from drivers/iio/accel/adxl372.c:14:
>> include/linux/ptp_clock_kernel.h:71:22: error: field 'cc' has incomplete=
 type
      71 |  struct cyclecounter cc;
         |                      ^~


vim +/cc +71 include/linux/ptp_clock_kernel.h

    50	=

    51	/**
    52	 * struct ptp_vclock_cc - ptp virtual clock cycle counter info
    53	 *
    54	 * @cc:               cyclecounter structure
    55	 * @refresh_interval: time interval to refresh time counter, to avoi=
d 64-bit
    56	 *                    overflow during delta conversion. For example,=
 with
    57	 *                    cc.mult value 2^28,  there are 36 bits left of=
 cycle
    58	 *                    counter. With 1 ns counter resolution, the ove=
rflow time
    59	 *                    is 2^36 ns which is 68.7 s. The refresh_interv=
al may be
    60	 *                    (60 * HZ) less than 68.7 s.
    61	 * @mult_num:         parameter for cc.mult adjustment calculation, =
see below
    62	 * @mult_dem:         parameter for cc.mult adjustment calculation, =
see below
    63	 *
    64	 * scaled_ppm to adjustment(mult_adj) of cc.mult
    65	 *
    66	 * mult_adj =3D mult * (ppb / 10^9)
    67	 *          =3D mult * (scaled_ppm * 1000 / 2^16) / 10^9
    68	 *          =3D scaled_ppm * mult_num / mult_dem
    69	 */
    70	struct ptp_vclock_cc {
  > 71		struct cyclecounter cc;
    72		unsigned long refresh_interval;
    73		u32 mult_num;
    74		u32 mult_dem;
    75	};
    76	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4463338227606500552==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
WTmC1zGMAQA=
--===============4463338227606500552==--

