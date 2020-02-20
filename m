Content-Type: multipart/mixed; boundary="===============8501653409736436666=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [drm-intel:topic/core-for-CI 18/21] init/Kconfig:77: symbol BROKEN is selected by DRM_I915_DEBUG
Date: Thu, 20 Feb 2020 09:09:34 +0800
Message-ID: <202002200910.2hKiML2U%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8501653409736436666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   2a97892fdbae277a104d6ba0b90f8a47cbe53681
commit: 0db409f2a5a4ec41dba541c21d6fa294c8a4dfd4 [18/21] Revert "drm/i915: =
Don't select BROKEN"
config: powerpc-ksi8560_defconfig
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 0db409f2a5a4ec41dba541c21d6fa294c8a4dfd4
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc  85xx/ksi8560_defconf=
ig
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency=
 detected!
>> arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends=
 on BROKEN_ON_SMP
>> init/Kconfig:80: symbol BROKEN_ON_SMP depends on BROKEN
>> init/Kconfig:77: symbol BROKEN is selected by DRM_I915_DEBUG
>> drivers/gpu/drm/i915/Kconfig.debug:19: symbol DRM_I915_DEBUG depends on =
DRM_I915
>> drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
>> drivers/gpu/drm/Kconfig:8: symbol DRM depends on AGP
>> drivers/char/agp/Kconfig:2: symbol AGP depends on PCI
>> drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
>> drivers/pci/Kconfig:7: symbol HAVE_PCI is selected by FORCE_PCI
>> drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
>> arch/powerpc/platforms/embedded6xx/Kconfig:51: symbol MVME5100 depends o=
n EMBEDDED6xx
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +77 init/Kconfig

^1da177e4c3f41 Linus Torvalds 2005-04-16  76  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @77  config BROKEN
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  	bool
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @80  config BROKEN_ON_SMP
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  	bool
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  	depends on BROKEN || !SMP
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  	default y
^1da177e4c3f41 Linus Torvalds 2005-04-16  84  =


:::::: The code at line 77 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8501653409736436666==--

