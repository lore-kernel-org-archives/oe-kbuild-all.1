Content-Type: multipart/mixed; boundary="===============7676682492730440604=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [drm-drm-intel:topic/core-for-CI 18/19] arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency detected!
Date: Sat, 15 Feb 2020 21:20:18 +0800
Message-ID: <202002152113.0AuUlDoZ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7676682492730440604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm/drm-intel topic/core-for-CI
head:   2208da3a71d7913f187f195ddfa9be48133aa751
commit: b31a3373cca21172327d1124cefa70e19a861f76 [18/19] Revert "drm/i915: =
Don't select BROKEN"
config: powerpc-skiroot_defconfig
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b31a3373cca21172327d1124cefa70e19a861f76
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc  skiroot_defconfig
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency=
 detected!
>> arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends=
 on BROKEN_ON_SMP
>> init/Kconfig:80: symbol BROKEN_ON_SMP depends on BROKEN
   init/Kconfig:77: symbol BROKEN is selected by DRM_I915_DEBUG
   drivers/gpu/drm/i915/Kconfig.debug:19: symbol DRM_I915_DEBUG depends on =
DRM_I915
   drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
   drivers/gpu/drm/Kconfig:8: symbol DRM depends on AGP
   drivers/char/agp/Kconfig:2: symbol AGP depends on PCI
   drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
   drivers/pci/Kconfig:7: symbol HAVE_PCI is selected by FORCE_PCI
>> drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
>> arch/powerpc/platforms/embedded6xx/Kconfig:51: symbol MVME5100 depends o=
n EMBEDDED6xx
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +2 arch/powerpc/platforms/embedded6xx/Kconfig

a35e370cfd2ddf Arnd Bergmann         2007-08-30  @2  config EMBEDDED6xx
a35e370cfd2ddf Arnd Bergmann         2007-08-30   3  	bool "Embedded 6xx/7x=
x/7xxx-based boards"
be34fff07c3755 Christophe Leroy      2018-11-17   4  	depends on PPC_BOOK3S=
_32 && BROKEN_ON_SMP
14cf11af6cf608 Paul Mackerras        2005-09-26   5  =

04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   6  config LINKSTATION
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   7  	bool "Linkstation / K=
urobox(HG) from Buffalo"
a35e370cfd2ddf Arnd Bergmann         2007-08-30   8  	depends on EMBEDDED6xx
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   9  	select MPIC
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  10  	select FSL_SOC
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  11  	select PPC_UDBG_16550=
 if SERIAL_8250
44d7631bdb1621 Segher Boessenkool    2007-02-22  12  	select DEFAULT_UIMAGE
3490cba56f7f8a Jon Loeliger          2008-01-23  13  	select MPC10X_BRIDGE
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  14  	help
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  15  	  Select LINKSTATION =
if configuring for one of PPC- (MPC8241)
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  16  	  based NAS systems f=
rom Buffalo Technology. So far only
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  17  	  KuroboxHG has been =
tested. In the future classical Kurobox,
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  18  	  Linkstation-I HD-HL=
AN and HD-HGLAN versions, and PPC-based
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  19  	  Terastation systems=
 should be supported too.
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  20  =

3490cba56f7f8a Jon Loeliger          2008-01-23  21  config STORCENTER
3490cba56f7f8a Jon Loeliger          2008-01-23  22  	bool "IOMEGA StorCent=
er"
3490cba56f7f8a Jon Loeliger          2008-01-23  23  	depends on EMBEDDED6xx
3490cba56f7f8a Jon Loeliger          2008-01-23  24  	select MPIC
3490cba56f7f8a Jon Loeliger          2008-01-23  25  	select FSL_SOC
3490cba56f7f8a Jon Loeliger          2008-01-23  26  	select PPC_UDBG_16550=
 if SERIAL_8250
3490cba56f7f8a Jon Loeliger          2008-01-23  27  	select MPC10X_BRIDGE
3490cba56f7f8a Jon Loeliger          2008-01-23  28  	help
3490cba56f7f8a Jon Loeliger          2008-01-23  29  	  Select STORCENTER i=
f configuring for the iomega StorCenter
3490cba56f7f8a Jon Loeliger          2008-01-23  30  	  with an 8241 CPU in=
 it.
3490cba56f7f8a Jon Loeliger          2008-01-23  31  =

c5d56332fd6c2f Zang Roy-r61911       2006-06-13  32  config MPC7448HPC2
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  33  	bool "Freescale MPC74=
48HPC2(Taiga)"
a35e370cfd2ddf Arnd Bergmann         2007-08-30  34  	depends on EMBEDDED6xx
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  35  	select TSI108_BRIDGE
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  36  	select DEFAULT_UIMAGE
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  37  	select PPC_UDBG_16550
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  38  	help
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  39  	  Select MPC7448HPC2 =
if configuring for Freescale MPC7448HPC2 (Taiga)
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  40  	  platform
cb9e4d10c448a3 Josh Boyer            2007-05-08  41  =

cb9e4d10c448a3 Josh Boyer            2007-05-08  42  config PPC_HOLLY
cb9e4d10c448a3 Josh Boyer            2007-05-08  43  	bool "PPC750GX/CL wit=
h TSI10x bridge (Hickory/Holly)"
a35e370cfd2ddf Arnd Bergmann         2007-08-30  44  	depends on EMBEDDED6xx
cb9e4d10c448a3 Josh Boyer            2007-05-08  45  	select TSI108_BRIDGE
cb9e4d10c448a3 Josh Boyer            2007-05-08  46  	select PPC_UDBG_16550
cb9e4d10c448a3 Josh Boyer            2007-05-08  47  	help
cb9e4d10c448a3 Josh Boyer            2007-05-08  48  	  Select PPC_HOLLY if=
 configuring for an IBM 750GX/CL Eval
cb9e4d10c448a3 Josh Boyer            2007-05-08  49  	  Board with TSI108/9=
 bridge (Hickory/Holly)
fd4ba7e2b7ce9a Dale Farnsworth       2007-05-12  50  =

be2019816e4dcd Stephen Chivers       2014-01-09 @51  config MVME5100
be2019816e4dcd Stephen Chivers       2014-01-09  52  	bool "Motorola/Emerso=
n MVME5100"
be2019816e4dcd Stephen Chivers       2014-01-09  53  	depends on EMBEDDED6xx
be2019816e4dcd Stephen Chivers       2014-01-09  54  	select MPIC
eb01d42a77785f Christoph Hellwig     2018-11-15  55  	select FORCE_PCI
be2019816e4dcd Stephen Chivers       2014-01-09  56  	select PPC_INDIRECT_P=
CI
be2019816e4dcd Stephen Chivers       2014-01-09  57  	select PPC_I8259
be2019816e4dcd Stephen Chivers       2014-01-09  58  	select PPC_NATIVE
13ae40370f62cd Stephen Chivers       2014-04-20  59  	select PPC_UDBG_16550
be2019816e4dcd Stephen Chivers       2014-01-09  60  	help
be2019816e4dcd Stephen Chivers       2014-01-09  61  	  This option enables=
 support for the Motorola (now Emerson) MVME5100
be2019816e4dcd Stephen Chivers       2014-01-09  62  	  board.
be2019816e4dcd Stephen Chivers       2014-01-09  63  =


:::::: The code at line 2 was first introduced by commit
:::::: a35e370cfd2ddfb5d2f0ceae376ffeda273b357c [POWERPC] Move embedded6xx =
into multiplatform

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Paul Mackerras <paulus@samba.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7676682492730440604==--

