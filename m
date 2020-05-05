Content-Type: multipart/mixed; boundary="===============3632488436284305947=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-review:UPDATE-20200505-172341/Dan-Murphy/Multicolor-Framework-v24/20200505-031426 2/16] drivers/leds/Kconfig:33:error: recursive dependency detected!
Date: Wed, 06 May 2020 00:23:17 +0800
Message-ID: <202005060012.H1YlPV8B%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3632488436284305947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20200505-172341/Dan=
-Murphy/Multicolor-Framework-v24/20200505-031426
head:   07525245ce56f96b2e79c6af8d52b43884a15aba
commit: af506b3329146f90d62e8860a3c6b620c3268646 [2/16] leds: multicolor: I=
ntroduce a multicolor class definition
config: x86_64-rhel
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout af506b3329146f90d62e8860a3c6b620c3268646
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


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
--===============3632488436284305947==--

