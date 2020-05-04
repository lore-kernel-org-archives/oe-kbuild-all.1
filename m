Content-Type: multipart/mixed; boundary="===============1376102907789773958=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v24 02/16] leds: multicolor: Introduce a multicolor class definition
Date: Tue, 05 May 2020 05:18:28 +0800
Message-ID: <202005050509.ulcDbkZ2%lkp@intel.com>
In-Reply-To: <20200503123215.6449-3-dmurphy@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1376102907789773958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-linux-leds/for-next]
[also build test ERROR on robh/for-next linus/master j.anaszewski-leds/for-=
next v5.7-rc4 next-20200504]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Fram=
ework-v24/20200505-031241
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
config: parisc-allnoconfig
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dparisc  allnoconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/Kconfig:33:error: recursive dependency detected!
>> drivers/leds/Kconfig:33: symbol LEDS_CLASS_MULTI_COLOR depends on LEDS_C=
LASS_MULTI_COLOR
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +33 drivers/leds/Kconfig

    16	=

    17	config LEDS_CLASS
    18		tristate "LED Class Support"
    19		help
    20		  This option enables the LED sysfs class in /sys/class/leds.  You'=
ll
    21		  need this to do anything useful with LEDs.  If unsure, say N.
    22	=

    23	config LEDS_CLASS_FLASH
    24		tristate "LED Flash Class Support"
    25		depends on LEDS_CLASS
    26		help
    27		  This option enables the flash LED sysfs class in /sys/class/leds.
    28		  It wraps LED Class and adds flash LEDs specific sysfs attributes
    29		  and kernel internal API to it. You'll need this to provide support
    30		  for the flash related features of a LED device. It can be built
    31		  as a module.
    32	=

  > 33	config LEDS_CLASS_MULTI_COLOR
    34		tristate "LED MultiColor LED Class Support"
    35		depends on LEDS_CLASS
    36		depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
    37		help
    38		  This option enables the multicolor LED sysfs class in /sys/class/=
leds.
    39		  It wraps LED class and adds multicolor LED specific sysfs attribu=
tes
    40		  and kernel internal API to it. You'll need this to provide support
    41		  for multicolor LEDs that are grouped together. This class is not
    42		  intended for single color LEDs. It can be built as a module.
    43	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1376102907789773958==--

