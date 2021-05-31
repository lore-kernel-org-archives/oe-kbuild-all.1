Content-Type: multipart/mixed; boundary="===============3536866136712787525=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [asm-generic:clkdev 1/5] arch/mips/ar7/clock.c:428:28: error: array type has incomplete element type 'struct clkdev_table'
Date: Mon, 31 May 2021 21:29:46 +0800
Message-ID: <202105312142.h4zqTYQG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3536866136712787525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.gi=
t clkdev
head:   3c150d2578b204c2e18c7ac6d967b43a614befbe
commit: 991cb086b5cfcd6ad953a64c6ce384bbd8595ded [1/5] mips: ar7: convert t=
o clkdev_lookup
config: mips-ar7_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.=
git/commit/?id=3D991cb086b5cfcd6ad953a64c6ce384bbd8595ded
        git remote add asm-generic https://git.kernel.org/pub/scm/linux/ker=
nel/git/arnd/asm-generic.git
        git fetch --no-tags asm-generic clkdev
        git checkout 991cb086b5cfcd6ad953a64c6ce384bbd8595ded
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/mips/ar7/clock.c:428:28: error: array type has incomplete element t=
ype 'struct clkdev_table'
     428 | static struct clkdev_table clkdev_table[] =3D {
         |                            ^~~~~~~~~~~~
   In file included from arch/mips/ar7/clock.c:17:
>> include/linux/clkdev.h:28:3: error: field name not in record or union in=
itializer
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:28:3: note: (near initialization for 'clkdev_tabl=
e')
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: error: field name not in record or union in=
itializer
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: note: (near initialization for 'clkdev_tabl=
e')
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: error: field name not in record or union in=
itializer
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: note: (near initialization for 'clkdev_tabl=
e')
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:429:2: note: in expansion of macro 'CLKDEV_INIT'
     429 |  CLKDEV_INIT(NULL, "bus", &bus_clk),
         |  ^~~~~~~~~~~
>> include/linux/clkdev.h:28:3: error: field name not in record or union in=
itializer
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:28:3: note: (near initialization for 'clkdev_tabl=
e')
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: error: field name not in record or union in=
itializer
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: note: (near initialization for 'clkdev_tabl=
e')
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: error: field name not in record or union in=
itializer
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: note: (near initialization for 'clkdev_tabl=
e')
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:431:2: note: in expansion of macro 'CLKDEV_INIT'
     431 |  CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
>> include/linux/clkdev.h:28:3: error: field name not in record or union in=
itializer
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:28:3: note: (near initialization for 'clkdev_tabl=
e')
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: error: field name not in record or union in=
itializer
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: note: (near initialization for 'clkdev_tabl=
e')
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: error: field name not in record or union in=
itializer
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: note: (near initialization for 'clkdev_tabl=
e')
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:432:2: note: in expansion of macro 'CLKDEV_INIT'
     432 |  CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
         |  ^~~~~~~~~~~
>> include/linux/clkdev.h:28:3: error: field name not in record or union in=
itializer
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:28:3: note: (near initialization for 'clkdev_tabl=
e')
      28 |   .dev_id =3D d, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: error: field name not in record or union in=
itializer
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:29:3: note: (near initialization for 'clkdev_tabl=
e')
      29 |   .con_id =3D n, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: error: field name not in record or union in=
itializer
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
   include/linux/clkdev.h:30:3: note: (near initialization for 'clkdev_tabl=
e')
      30 |   .clk =3D c, \
         |   ^
   arch/mips/ar7/clock.c:433:2: note: in expansion of macro 'CLKDEV_INIT'
     433 |  CLKDEV_INIT(NULL, "cpu", &cpu_clk)
         |  ^~~~~~~~~~~
>> include/linux/clkdev.h:27:2: error: expected '}' before '{' token
      27 |  {   \
         |  ^
   arch/mips/ar7/clock.c:434:2: note: in expansion of macro 'CLKDEV_INIT'
     434 |  CLKDEV_INIT(NULL, "dsp", &dsp_clk),
         |  ^~~~~~~~~~~
   arch/mips/ar7/clock.c:428:45: note: to match this '{'
     428 | static struct clkdev_table clkdev_table[] =3D {
         |                                             ^
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:12,
                    from arch/mips/ar7/clock.c:8:
   arch/mips/ar7/clock.c: In function 'ar7_init_clocks':
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width no=
t an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e))=
; })))
         |                                                   ^
   include/linux/compiler.h:240:28: note: in expansion of macro 'BUILD_BUG_=
ON_ZERO'
     240 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(=
a)[0]))
         |                            ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:42:59: note: in expansion of macro '__must_be_arr=
ay'
      42 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must=
_be_array(arr))
         |                                                           ^~~~~~=
~~~~~~~~~
   arch/mips/ar7/clock.c:455:34: note: in expansion of macro 'ARRAY_SIZE'
     455 |  clkdev_add_table(&clkdev_table, ARRAY_SIZE(clkdev_table);
         |                                  ^~~~~~~~~~
>> arch/mips/ar7/clock.c:455:58: error: expected ')' before ';' token
     455 |  clkdev_add_table(&clkdev_table, ARRAY_SIZE(clkdev_table);
         |                                                          ^
>> arch/mips/ar7/clock.c:455:59: error: expected ';' before '}' token
     455 |  clkdev_add_table(&clkdev_table, ARRAY_SIZE(clkdev_table);
         |                                                           ^
         |                                                           ;
     456 | }
         | ~                                                          =

   At top level:
   arch/mips/ar7/clock.c:428:28: warning: 'clkdev_table' defined but not us=
ed [-Wunused-variable]
     428 | static struct clkdev_table clkdev_table[] =3D {
         |                            ^~~~~~~~~~~~


vim +428 arch/mips/ar7/clock.c

   427	=

 > 428	static struct clkdev_table clkdev_table[] =3D {
   429		CLKDEV_INIT(NULL, "bus", &bus_clk),
   430		/* cpmac and vbus share the same rate */
   431		CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
   432		CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
   433		CLKDEV_INIT(NULL, "cpu", &cpu_clk)
   434		CLKDEV_INIT(NULL, "dsp", &dsp_clk),
   435		CLKDEV_INIT(NULL, "vbus", &vbus_clk),
   436	};
   437	=

   438	void __init ar7_init_clocks(void)
   439	{
   440		switch (ar7_chip_id()) {
   441		case AR7_CHIP_7100:
   442		case AR7_CHIP_7200:
   443			tnetd7200_init_clocks();
   444			break;
   445		case AR7_CHIP_7300:
   446			dsp_clk.rate =3D tnetd7300_dsp_clock();
   447			tnetd7300_init_clocks();
   448			break;
   449		default:
   450			break;
   451		}
   452		/* adjust vbus clock rate */
   453		vbus_clk.rate =3D bus_clk.rate / 2;
   454	=

 > 455		clkdev_add_table(&clkdev_table, ARRAY_SIZE(clkdev_table);
   456	}
   457	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3536866136712787525==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
EqWMV6JMIkDYOPMf46NRD13rAAA=
--===============3536866136712787525==--

