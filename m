Content-Type: multipart/mixed; boundary="===============4643423306682144280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/watchdog/m54xx_wdt.c:104:37: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 07 Jan 2021 07:47:59 +0800
Message-ID: <202101070750.4Bg5b17j-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4643423306682144280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   4 months ago
config: m68k-randconfig-s032-20210107 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De5fc436f06eef54ef512ea55a9db8eb9f2e76959
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5fc436f06eef54ef512ea55a9db8eb9f2e76959
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/watchdog/m54xx_wdt.c:104:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got char const * @@
   drivers/watchdog/m54xx_wdt.c:104:37: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/m54xx_wdt.c:104:37: sparse:     got char const *
   drivers/watchdog/m54xx_wdt.c:104:37: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected void const [noderef] =
__user *__gu_ptr @@     got char const * @@
   drivers/watchdog/m54xx_wdt.c:104:37: sparse:     expected void const [no=
deref] __user *__gu_ptr
   drivers/watchdog/m54xx_wdt.c:104:37: sparse:     got char const *
   drivers/watchdog/m54xx_wdt.c:129:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void [noderef] __user =
*to @@     got struct watchdog_info * @@
   drivers/watchdog/m54xx_wdt.c:129:37: sparse:     expected void [noderef]=
 __user *to
   drivers/watchdog/m54xx_wdt.c:129:37: sparse:     got struct watchdog_inf=
o *
>> drivers/watchdog/m54xx_wdt.c:134:23: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:134:23: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/m54xx_wdt.c:134:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:134:23: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected void const [noderef] =
__user *__pu_ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:134:23: sparse:     expected void const [no=
deref] __user *__pu_ptr
   drivers/watchdog/m54xx_wdt.c:134:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:138:23: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:138:23: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/m54xx_wdt.c:138:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:138:23: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected void const [noderef] =
__user *__pu_ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:138:23: sparse:     expected void const [no=
deref] __user *__pu_ptr
   drivers/watchdog/m54xx_wdt.c:138:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:147:23: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:147:23: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/m54xx_wdt.c:147:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:147:23: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected void const [noderef] =
__user *__gu_ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:147:23: sparse:     expected void const [no=
deref] __user *__gu_ptr
   drivers/watchdog/m54xx_wdt.c:147:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:161:23: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:161:23: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/m54xx_wdt.c:161:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:161:23: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected void const [noderef] =
__user *__pu_ptr @@     got int * @@
   drivers/watchdog/m54xx_wdt.c:161:23: sparse:     expected void const [no=
deref] __user *__pu_ptr
   drivers/watchdog/m54xx_wdt.c:161:23: sparse:     got int *
   drivers/watchdog/m54xx_wdt.c:185:27: sparse: sparse: incorrect type in i=
nitializer (incompatible argument 2 (different address spaces)) @@     expe=
cted int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/m54xx_wdt.c:185:27: sparse:     expected int ( *write )=
( ... )
   drivers/watchdog/m54xx_wdt.c:185:27: sparse:     got int ( * )( ... )

vim +104 drivers/watchdog/m54xx_wdt.c

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   91  =

9b9c63ff1f3b09a drivers/watchdog/m548x_wdt.c Philippe De Muyter  2011-01-22=
   92  static ssize_t m54xx_wdt_write(struct file *file, const char *data,
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   93  						size_t len, loff_t *ppos)
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   94  {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   95  	if (len) {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   96  		if (!nowayout) {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   97  			size_t i;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   98  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
   99  			clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  100  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  101  			for (i =3D 0; i !=3D len; i++) {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  102  				char c;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  103  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
 @104  				if (get_user(c, data + i))
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  105  					return -EFAULT;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  106  				if (c =3D=3D 'V')
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  107  					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  108  			}
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  109  		}
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  110  		wdt_keepalive();
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  111  	}
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  112  	return len;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  113  }
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  114  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  115  static const struct watchdog_info ident =3D {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  116  	.options	=3D WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT |
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  117  				WDIOF_KEEPALIVEPING,
9b9c63ff1f3b09a drivers/watchdog/m548x_wdt.c Philippe De Muyter  2011-01-22=
  118  	.identity	=3D "Coldfire M54xx Watchdog",
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  119  };
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  120  =

9b9c63ff1f3b09a drivers/watchdog/m548x_wdt.c Philippe De Muyter  2011-01-22=
  121  static long m54xx_wdt_ioctl(struct file *file, unsigned int cmd,
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  122  							 unsigned long arg)
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  123  {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  124  	int ret =3D -ENOTTY;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  125  	int time;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  126  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  127  	switch (cmd) {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  128  	case WDIOC_GETSUPPORT:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  129  		ret =3D copy_to_user((struct watchdog_info *)arg, &ident,
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  130  				   sizeof(ident)) ? -EFAULT : 0;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  131  		break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  132  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  133  	case WDIOC_GETSTATUS:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
 @134  		ret =3D put_user(0, (int *)arg);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  135  		break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  136  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  137  	case WDIOC_GETBOOTSTATUS:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  138  		ret =3D put_user(0, (int *)arg);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  139  		break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  140  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  141  	case WDIOC_KEEPALIVE:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  142  		wdt_keepalive();
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  143  		ret =3D 0;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  144  		break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  145  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  146  	case WDIOC_SETTIMEOUT:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  147  		ret =3D get_user(time, (int *)arg);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  148  		if (ret)
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  149  			break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  150  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  151  		if (time <=3D 0 || time > 30) {
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  152  			ret =3D -EINVAL;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  153  			break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  154  		}
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  155  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  156  		heartbeat =3D time;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  157  		wdt_enable();
bd490f8222510de drivers/watchdog/m54xx_wdt.c Gustavo A. R. Silva 2020-07-07=
  158  		fallthrough;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  159  =

88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  160  	case WDIOC_GETTIMEOUT:
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  161  		ret =3D put_user(heartbeat, (int *)arg);
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  162  		break;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  163  	}
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  164  	return ret;
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  165  }
88cce427626070f drivers/watchdog/m548x_wdt.c Philippe De Muyter  2010-11-03=
  166  =


:::::: The code at line 104 was first introduced by commit
:::::: 88cce427626070f7d7eb33994e3ff7b4db3292c5 watchdog: Add MCF548x watch=
dog driver.

:::::: TO: Philippe De Muyter <phdm@macqel.be>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4643423306682144280==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4643423306682144280==--

