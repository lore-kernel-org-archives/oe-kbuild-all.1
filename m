Content-Type: multipart/mixed; boundary="===============1450873147271127963=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [frank-w-bpi-r2-4.14:5.9-hdmisnd 40/58] drivers/misc/mediatek/connectivity/Kconfig:268: syntax error
Date: Sun, 04 Oct 2020 03:16:25 +0800
Message-ID: <202010040323.rDZMnVSy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1450873147271127963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 5.9-hdmisnd
head:   a811c6eb48da84b9897d5c477347f0132cc93077
commit: 3efc6d733b0475c3623d52d23dbd2ebe0fcd5eb5 [40/58] mt6625l: include w=
ifi-folder
config: x86_64-randconfig-a001-20201003
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bcd055=
99d0e53977a963799d6ee4f6e0bc21331b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/frank-w/BPI-R2-4.14/commit/3efc6d733b0475c3623=
d52d23dbd2ebe0fcd5eb5
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 5.9-hdmisnd
        git checkout 3efc6d733b0475c3623d52d23dbd2ebe0fcd5eb5
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64  randconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the frank-w-bpi-r2-4.14/5.9-hdmisnd HEAD a811c6eb48da84b9897d5c477347=
f0132cc93077 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

>> drivers/misc/mediatek/connectivity/Kconfig:268: syntax error
   drivers/misc/mediatek/connectivity/Kconfig:267: unknown statement "---he=
lp---"
   drivers/misc/mediatek/connectivity/Kconfig:268:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:268: unknown statement "Say"
   drivers/misc/mediatek/connectivity/Kconfig:275: syntax error
   drivers/misc/mediatek/connectivity/Kconfig:274: unknown statement "---he=
lp---"
   drivers/misc/mediatek/connectivity/Kconfig:275: unknown statement "MTK"
   drivers/misc/mediatek/connectivity/Kconfig:276:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:276: unknown statement "To"
   drivers/misc/mediatek/connectivity/Kconfig:277:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:277: unknown statement "Set"
   drivers/misc/mediatek/connectivity/Kconfig:278:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:278: unknown statement "Set"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1
   make[1]: *** [Makefile:606: oldconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/misc/mediatek/connectivity/Kconfig:268: syntax error
   drivers/misc/mediatek/connectivity/Kconfig:267: unknown statement "---he=
lp---"
   drivers/misc/mediatek/connectivity/Kconfig:268:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:268: unknown statement "Say"
   drivers/misc/mediatek/connectivity/Kconfig:275: syntax error
   drivers/misc/mediatek/connectivity/Kconfig:274: unknown statement "---he=
lp---"
   drivers/misc/mediatek/connectivity/Kconfig:275: unknown statement "MTK"
   drivers/misc/mediatek/connectivity/Kconfig:276:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:276: unknown statement "To"
   drivers/misc/mediatek/connectivity/Kconfig:277:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:277: unknown statement "Set"
   drivers/misc/mediatek/connectivity/Kconfig:278:warning: ignoring unsuppo=
rted character '.'
   drivers/misc/mediatek/connectivity/Kconfig:278: unknown statement "Set"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1
   make[1]: *** [Makefile:606: olddefconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

vim +268 drivers/misc/mediatek/connectivity/Kconfig

2c660696dc60461 Frank Wunderlich 2020-08-17  176  =

2c660696dc60461 Frank Wunderlich 2020-08-17  177  config MTK_COMBO_COMM_UART
2c660696dc60461 Frank Wunderlich 2020-08-17  178  	depends on MTK_COMBO_COMM
2c660696dc60461 Frank Wunderlich 2020-08-17  179  	tristate "Common interfa=
ce UART"
2c660696dc60461 Frank Wunderlich 2020-08-17  180  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  181  	  Use UART for common pa=
rt interface type
2c660696dc60461 Frank Wunderlich 2020-08-17  182  =

2c660696dc60461 Frank Wunderlich 2020-08-17  183  config MTK_COMBO_COMM_SDIO
2c660696dc60461 Frank Wunderlich 2020-08-17  184  	depends on MTK_COMBO_COMM
2c660696dc60461 Frank Wunderlich 2020-08-17  185  	tristate "Common interfa=
ce SDIO"
2c660696dc60461 Frank Wunderlich 2020-08-17  186  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  187  	  Use SDIO for common pa=
rt interface type
2c660696dc60461 Frank Wunderlich 2020-08-17  188  =

2c660696dc60461 Frank Wunderlich 2020-08-17  189  config MTK_COMBO_COMM_NPWR
2c660696dc60461 Frank Wunderlich 2020-08-17  190  	depends on MTK_COMBO_COMM
2c660696dc60461 Frank Wunderlich 2020-08-17  191  	bool "Enable NPWR suppor=
t"
2c660696dc60461 Frank Wunderlich 2020-08-17  192  	default n
2c660696dc60461 Frank Wunderlich 2020-08-17  193  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  194  	  Enable NPWR support of=
 new power on swquence
2c660696dc60461 Frank Wunderlich 2020-08-17  195  =

2c660696dc60461 Frank Wunderlich 2020-08-17  196  config MTK_COMBO_COMM_APO
2c660696dc60461 Frank Wunderlich 2020-08-17  197  	depends on MTK_COMBO_COMM
2c660696dc60461 Frank Wunderlich 2020-08-17  198  	bool "Enable always powe=
r on support"
2c660696dc60461 Frank Wunderlich 2020-08-17  199  	#default y
2c660696dc60461 Frank Wunderlich 2020-08-17  200  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  201  	  Enable chip will alway=
s power on
2c660696dc60461 Frank Wunderlich 2020-08-17  202  =

2c660696dc60461 Frank Wunderlich 2020-08-17  203  config MTK_COMBO_BT
2c660696dc60461 Frank Wunderlich 2020-08-17  204  	tristate "MediaTek Combo=
 Chip BT driver"
2c660696dc60461 Frank Wunderlich 2020-08-17  205  	depends on BT && MTK_COM=
BO
2c660696dc60461 Frank Wunderlich 2020-08-17  206  	select MTK_BTIF
2c660696dc60461 Frank Wunderlich 2020-08-17  207  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  208  	  MTK BT /dev/stpbt driv=
er for Bluedroid
2c660696dc60461 Frank Wunderlich 2020-08-17  209  =

2c660696dc60461 Frank Wunderlich 2020-08-17  210  config MTK_COMBO_BT_HCI
2c660696dc60461 Frank Wunderlich 2020-08-17  211  	tristate "MediaTek Combo=
 Chip BlueZ driver"
2c660696dc60461 Frank Wunderlich 2020-08-17  212  	depends on BT && MTK_COM=
BO
2c660696dc60461 Frank Wunderlich 2020-08-17  213  	select MTK_BTIF
2c660696dc60461 Frank Wunderlich 2020-08-17  214  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  215  	  MTK BT driver for BlueZ
2c660696dc60461 Frank Wunderlich 2020-08-17  216  =

2c660696dc60461 Frank Wunderlich 2020-08-17  217  config MTK_COMBO_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  218  	tristate "MediaTek combo=
 chip Wi-Fi support"
2c660696dc60461 Frank Wunderlich 2020-08-17  219  	depends on MTK_COMBO
2c660696dc60461 Frank Wunderlich 2020-08-17  220  	select MTK_BTIF
2c660696dc60461 Frank Wunderlich 2020-08-17  221  	select WIRELESS_EXT
2c660696dc60461 Frank Wunderlich 2020-08-17  222  	select WEXT_PRIV
2c660696dc60461 Frank Wunderlich 2020-08-17  223  =

2c660696dc60461 Frank Wunderlich 2020-08-17  224  config MTK_WAPI_SUPPORT
2c660696dc60461 Frank Wunderlich 2020-08-17  225  	bool "MTK_WAPI_SUPPORT"
2c660696dc60461 Frank Wunderlich 2020-08-17  226  	depends on MTK_COMBO_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  227  	#default y
2c660696dc60461 Frank Wunderlich 2020-08-17  228  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  229  	  if it is set to TRUE: =
Support WAPI (WLAN Authentication and
2c660696dc60461 Frank Wunderlich 2020-08-17  230  	  Privacy Infrastructure)
2c660696dc60461 Frank Wunderlich 2020-08-17  231  =

2c660696dc60461 Frank Wunderlich 2020-08-17  232  config MTK_PASSPOINT_R1_S=
UPPORT
2c660696dc60461 Frank Wunderlich 2020-08-17  233  	bool "MTK_PASSPOINT_R1_S=
UPPORT"
2c660696dc60461 Frank Wunderlich 2020-08-17  234  	depends on MTK_COMBO_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  235  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  236  	  Support Passpoint R1 (=
Hotspot 2.0 R1)
2c660696dc60461 Frank Wunderlich 2020-08-17  237  =

2c660696dc60461 Frank Wunderlich 2020-08-17  238  config MTK_PASSPOINT_R2_S=
UPPORT
2c660696dc60461 Frank Wunderlich 2020-08-17  239  	bool "MTK_PASSPOINT_R2_S=
UPPORT"
2c660696dc60461 Frank Wunderlich 2020-08-17  240  	depends on MTK_COMBO_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  241  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  242  	   Support Passpoint R2
2c660696dc60461 Frank Wunderlich 2020-08-17  243  =

2c660696dc60461 Frank Wunderlich 2020-08-17  244  config MTK_WIFI_MCC_SUPPO=
RT
2c660696dc60461 Frank Wunderlich 2020-08-17  245  	bool "MTK_WIFI_MCC_SUPPO=
RT"
2c660696dc60461 Frank Wunderlich 2020-08-17  246  	depends on MTK_COMBO_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  247  	#default y
2c660696dc60461 Frank Wunderlich 2020-08-17  248  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  249  	   if it is set to TRUE,=
 wlan will support Multi-Channel Concurrency,
2c660696dc60461 Frank Wunderlich 2020-08-17  250  	   otherwise, only suppo=
rt Single Channel Concurrency
2c660696dc60461 Frank Wunderlich 2020-08-17  251  =

2c660696dc60461 Frank Wunderlich 2020-08-17  252  config MTK_DHCPV6C_WIFI
2c660696dc60461 Frank Wunderlich 2020-08-17  253  	bool "MTK_DHCPV6C_WIFI"
2c660696dc60461 Frank Wunderlich 2020-08-17  254  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  255  	  no: disable this featu=
re
2c660696dc60461 Frank Wunderlich 2020-08-17  256  =

2c660696dc60461 Frank Wunderlich 2020-08-17  257  config MTK_CONN_LTE_IDC_S=
UPPORT
2c660696dc60461 Frank Wunderlich 2020-08-17  258  	bool "MediaTek CONN LTE =
IDC support"
2c660696dc60461 Frank Wunderlich 2020-08-17  259  	select MTK_CONN_MD
2c660696dc60461 Frank Wunderlich 2020-08-17  260  	#default y
2c660696dc60461 Frank Wunderlich 2020-08-17  261  	help
2c660696dc60461 Frank Wunderlich 2020-08-17  262  	  This option enables CO=
NN LTE IDC support
2c660696dc60461 Frank Wunderlich 2020-08-17  263  =

2c660696dc60461 Frank Wunderlich 2020-08-17  264  menuconfig GPS
2c660696dc60461 Frank Wunderlich 2020-08-17  265          tristate "GPS dri=
vers"
2c660696dc60461 Frank Wunderlich 2020-08-17  266          #default y
2c660696dc60461 Frank Wunderlich 2020-08-17  267          ---help---
2c660696dc60461 Frank Wunderlich 2020-08-17 @268            Say Y here for =
supporting GPS.
2c660696dc60461 Frank Wunderlich 2020-08-17  269  =


:::::: The code at line 268 was first introduced by commit
:::::: 2c660696dc60461c871c1901dcf540c81837a421 mt6625l: add wifi-folder fr=
om 5.8

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1450873147271127963==--

