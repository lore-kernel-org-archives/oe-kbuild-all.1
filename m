Content-Type: multipart/mixed; boundary="===============6878079352040657740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] softirq/s390: Use the generic local_softirq_pending()
Date: Fri, 28 May 2021 07:11:53 +0800
Message-ID: <202105280753.baeTS9PX-lkp@intel.com>
In-Reply-To: <1621859957-4880-1-git-send-email-yejunedeng@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6878079352040657740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yejune,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on s390/features]
[also build test WARNING on v5.13-rc3 next-20210527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yejune-Deng/softirq-s390-U=
se-the-generic-local_softirq_pending/20210524-204051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git feat=
ures
config: s390-randconfig-s031-20210527 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/f1a79ef6db72f0ee7455c9b29=
85eba179516b7fd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yejune-Deng/softirq-s390-Use-the-g=
eneric-local_softirq_pending/20210524-204051
        git checkout f1a79ef6db72f0ee7455c9b2985eba179516b7fd
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> kernel/softirq.c:379:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:379:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:379:13: sparse:     got unsigned int *
>> kernel/softirq.c:379:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:379:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:379:13: sparse:     got unsigned int *
>> kernel/softirq.c:379:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:379:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:379:13: sparse:     got unsigned int *
>> kernel/softirq.c:379:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:379:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:379:13: sparse:     got unsigned int *
>> kernel/softirq.c:379:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:379:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:379:13: sparse:     got unsigned int *
   kernel/softirq.c:457:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:457:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:457:19: sparse:     got unsigned int *
   kernel/softirq.c:457:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:457:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:457:19: sparse:     got unsigned int *
   kernel/softirq.c:457:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:457:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:457:19: sparse:     got unsigned int *
   kernel/softirq.c:457:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:457:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:457:19: sparse:     got unsigned int *
   kernel/softirq.c:457:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:457:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:457:19: sparse:     got unsigned int *
   kernel/softirq.c:533:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:533:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:533:19: sparse:     got unsigned int *
   kernel/softirq.c:533:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:533:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:533:19: sparse:     got unsigned int *
   kernel/softirq.c:533:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:533:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:533:19: sparse:     got unsigned int *
   kernel/softirq.c:533:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:533:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:533:19: sparse:     got unsigned int *
   kernel/softirq.c:533:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:533:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:533:19: sparse:     got unsigned int *
   kernel/softirq.c:541:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:541:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:541:9: sparse:     got unsigned int *
   kernel/softirq.c:541:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:541:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:541:9: sparse:     got unsigned int *
   kernel/softirq.c:541:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:541:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:541:9: sparse:     got unsigned int *
   kernel/softirq.c:541:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:541:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:541:9: sparse:     got unsigned int *
   kernel/softirq.c:541:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:541:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:541:9: sparse:     got unsigned int *
   kernel/softirq.c:577:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:577:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:577:19: sparse:     got unsigned int *
   kernel/softirq.c:577:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:577:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:577:19: sparse:     got unsigned int *
   kernel/softirq.c:577:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:577:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:577:19: sparse:     got unsigned int *
   kernel/softirq.c:577:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:577:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:577:19: sparse:     got unsigned int *
   kernel/softirq.c:577:19: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:577:19: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:577:19: sparse:     got unsigned int *
   kernel/softirq.c:700:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:700:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:700:9: sparse:     got unsigned int *
   kernel/softirq.c:700:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:700:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:700:9: sparse:     got unsigned int *
   kernel/softirq.c:700:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:700:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:700:9: sparse:     got unsigned int *
   kernel/softirq.c:700:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:700:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:700:9: sparse:     got unsigned int *
   kernel/softirq.c:700:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   kernel/softirq.c:700:9: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   kernel/softirq.c:700:9: sparse:     got unsigned int *
   kernel/softirq.c:910:16: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:910:16: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:910:16: sparse:     got unsigned int *
   kernel/softirq.c:910:16: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:910:16: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:910:16: sparse:     got unsigned int *
   kernel/softirq.c:910:16: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:910:16: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:910:16: sparse:     got unsigned int *
   kernel/softirq.c:910:16: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:910:16: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:910:16: sparse:     got unsigned int *
   kernel/softirq.c:910:16: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:910:16: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:910:16: sparse:     got unsigned int *
   kernel/softirq.c:916:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:916:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:916:13: sparse:     got unsigned int *
   kernel/softirq.c:916:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:916:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
   kernel/softirq.c:916:13: sparse:     got unsigned int *
   kernel/softirq.c:916:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void const [noderef] __percpu *__=
vpp_verify @@     got unsigned int * @@
   kernel/softirq.c:916:13: sparse:     expected void const [noderef] __per=
cpu *__vpp_verify
--
>> kernel/smp.c:453:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void const [noderef] __percpu *__vpp_=
verify @@     got unsigned int * @@
   kernel/smp.c:453:13: sparse:     expected void const [noderef] __percpu =
*__vpp_verify
   kernel/smp.c:453:13: sparse:     got unsigned int *
>> kernel/smp.c:453:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void const [noderef] __percpu *__vpp_=
verify @@     got unsigned int * @@
   kernel/smp.c:453:13: sparse:     expected void const [noderef] __percpu =
*__vpp_verify
   kernel/smp.c:453:13: sparse:     got unsigned int *
>> kernel/smp.c:453:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void const [noderef] __percpu *__vpp_=
verify @@     got unsigned int * @@
   kernel/smp.c:453:13: sparse:     expected void const [noderef] __percpu =
*__vpp_verify
   kernel/smp.c:453:13: sparse:     got unsigned int *
>> kernel/smp.c:453:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void const [noderef] __percpu *__vpp_=
verify @@     got unsigned int * @@
   kernel/smp.c:453:13: sparse:     expected void const [noderef] __percpu =
*__vpp_verify
   kernel/smp.c:453:13: sparse:     got unsigned int *
>> kernel/smp.c:453:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void const [noderef] __percpu *__vpp_=
verify @@     got unsigned int * @@
   kernel/smp.c:453:13: sparse:     expected void const [noderef] __percpu =
*__vpp_verify
   kernel/smp.c:453:13: sparse:     got unsigned int *
--
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected unsigned int [usertype] val @@     got =
restricted __wsum @@
   net/core/dev.c:3308:23: sparse:     expected unsigned int [usertype] val
   net/core/dev.c:3308:23: sparse:     got restricted __wsum
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3308:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3308:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3308:23: sparse:     got unsigned int
   net/core/dev.c:3308:23: sparse: sparse: cast from restricted __wsum
>> net/core/dev.c:4910:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   net/core/dev.c:4910:13: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   net/core/dev.c:4910:13: sparse:     got unsigned int *
>> net/core/dev.c:4910:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   net/core/dev.c:4910:13: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   net/core/dev.c:4910:13: sparse:     got unsigned int *
>> net/core/dev.c:4910:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   net/core/dev.c:4910:13: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   net/core/dev.c:4910:13: sparse:     got unsigned int *
>> net/core/dev.c:4910:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   net/core/dev.c:4910:13: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   net/core/dev.c:4910:13: sparse:     got unsigned int *
>> net/core/dev.c:4910:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void const [noderef] __percpu *__v=
pp_verify @@     got unsigned int * @@
   net/core/dev.c:4910:13: sparse:     expected void const [noderef] __perc=
pu *__vpp_verify
   net/core/dev.c:4910:13: sparse:     got unsigned int *
   net/core/dev.c:3807:26: sparse: sparse: context imbalance in '__dev_queu=
e_xmit' - different lock contexts for basic block
   net/core/dev.c:4990:44: sparse: sparse: context imbalance in 'net_tx_act=
ion' - unexpected unlock

vim +379 kernel/softirq.c

de30a2b355ea853 Ingo Molnar         2006-07-03  360  =

0bd3a173d711857 Peter Zijlstra      2013-11-19  361  void __local_bh_enable=
_ip(unsigned long ip, unsigned int cnt)
de30a2b355ea853 Ingo Molnar         2006-07-03  362  {
f71b74bca637fca Frederic Weisbecker 2017-11-06  363  	WARN_ON_ONCE(in_irq()=
);
f71b74bca637fca Frederic Weisbecker 2017-11-06  364  	lockdep_assert_irqs_e=
nabled();
3c829c367a1a525 Tim Chen            2006-07-30  365  #ifdef CONFIG_TRACE_IR=
QFLAGS
0f476b6d91a1395 Johannes Berg       2008-06-18  366  	local_irq_disable();
3c829c367a1a525 Tim Chen            2006-07-30  367  #endif
de30a2b355ea853 Ingo Molnar         2006-07-03  368  	/*
de30a2b355ea853 Ingo Molnar         2006-07-03  369  	 * Are softirqs going=
 to be turned on now:
de30a2b355ea853 Ingo Molnar         2006-07-03  370  	 */
75e1056f5c57050 Venkatesh Pallipadi 2010-10-04  371  	if (softirq_count() =
=3D=3D SOFTIRQ_DISABLE_OFFSET)
0d38453c85b426e Peter Zijlstra      2020-03-20  372  		lockdep_softirqs_on(=
ip);
de30a2b355ea853 Ingo Molnar         2006-07-03  373  	/*
de30a2b355ea853 Ingo Molnar         2006-07-03  374  	 * Keep preemption di=
sabled until we are done with
de30a2b355ea853 Ingo Molnar         2006-07-03  375  	 * softirq processing:
de30a2b355ea853 Ingo Molnar         2006-07-03  376  	 */
91ea62d58bd6618 Peter Zijlstra      2020-12-18  377  	__preempt_count_sub(c=
nt - 1);
de30a2b355ea853 Ingo Molnar         2006-07-03  378  =

0bed698a334766e Frederic Weisbecker 2013-09-05 @379  	if (unlikely(!in_inte=
rrupt() && local_softirq_pending())) {
0bed698a334766e Frederic Weisbecker 2013-09-05  380  		/*
0bed698a334766e Frederic Weisbecker 2013-09-05  381  		 * Run softirq if an=
y pending. And do it in its own stack
0bed698a334766e Frederic Weisbecker 2013-09-05  382  		 * as we may be call=
ing this deep in a task call stack already.
0bed698a334766e Frederic Weisbecker 2013-09-05  383  		 */
de30a2b355ea853 Ingo Molnar         2006-07-03  384  		do_softirq();
0bed698a334766e Frederic Weisbecker 2013-09-05  385  	}
de30a2b355ea853 Ingo Molnar         2006-07-03  386  =

bdb43806589096a Peter Zijlstra      2013-09-10  387  	preempt_count_dec();
3c829c367a1a525 Tim Chen            2006-07-30  388  #ifdef CONFIG_TRACE_IR=
QFLAGS
0f476b6d91a1395 Johannes Berg       2008-06-18  389  	local_irq_enable();
3c829c367a1a525 Tim Chen            2006-07-30  390  #endif
de30a2b355ea853 Ingo Molnar         2006-07-03  391  	preempt_check_resched=
();
de30a2b355ea853 Ingo Molnar         2006-07-03  392  }
0bd3a173d711857 Peter Zijlstra      2013-11-19  393  EXPORT_SYMBOL(__local_=
bh_enable_ip);
de30a2b355ea853 Ingo Molnar         2006-07-03  394  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6878079352040657740==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
IVWzkyckzrFfVIE2cAoABH45ePXhAQA=
--===============6878079352040657740==--

