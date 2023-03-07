Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0036E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 03:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678158709; x=1709694709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6k/pwAFoldyX8cm/3104Ig72FGGJBx2DAWFbp5uAMII=;
  b=ByTQEGWxxsbjlJmod4+ecOHun0Wj3yoHNnYJQbNebGPQ/n5sAoQGV7Da
   LboCUHbsc3Eaoo7VmBBTyJxMYfTWC/EhtabprZA9X4mQb8FzpVHnMY4II
   kvz7NwRSwrfTBJNdmwZHLF3aglNaDaNs8bRLJQ2kyUXOMmmBfCWTCfx6F
   y6Pt5EHncw3b88j9YTtTFLrootWWY9cZ7MM1BPvKoYYP/x+eUEgYTslaQ
   1RPmaFEGgpb3pmBUgqp1Kq30xQtR/+ZeyQC962EPZMgqrhubprTmoUJGV
   +vXcxIMa6Cp2cDHxWOhyUcQTyrHETtipEgPbTwbpMlAaPwXrCJxoxHw2o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337270315"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337270315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 19:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626381994"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="626381994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Mar 2023 19:11:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZNjv-0000tz-1r;
	Tue, 07 Mar 2023 03:11:47 +0000
Date: Tue, 7 Mar 2023 11:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 10/10] drivers/iommu/Kconfig:14:error:
 recursive dependency detected!
Message-ID: <202303071149.SkgGQKOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   9fcc1915600b79b5739be58a23afea27e3abe212
commit: 9fcc1915600b79b5739be58a23afea27e3abe212 [10/10] fixup! drm/asahi: Add the Asahi driver for Apple AGX GPUs
config: x86_64-kexec (attached as .config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/9fcc1915600b79b5739be58a23afea27e3abe212
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/explicit-sync
        git checkout 9fcc1915600b79b5739be58a23afea27e3abe212
        # save the config file
        make W=1 ARCH=x86_64 olddefconfig
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071149.SkgGQKOV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
   drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_ASAHI
   drivers/gpu/drm/asahi/Kconfig:3:	symbol DRM_ASAHI depends on DRM_GEM_SHMEM_HELPER
   drivers/gpu/drm/Kconfig:223:	symbol DRM_GEM_SHMEM_HELPER is selected by DRM_V3D
   drivers/gpu/drm/v3d/Kconfig:2:	symbol DRM_V3D depends on COMMON_CLK
   drivers/clk/Kconfig:21:	symbol COMMON_CLK is selected by X86_INTEL_QUARK
   arch/x86/Kconfig:633:	symbol X86_INTEL_QUARK depends on X86_IO_APIC
   arch/x86/Kconfig:1113:	symbol X86_IO_APIC depends on X86_LOCAL_APIC
   arch/x86/Kconfig:1108:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
   arch/x86/Kconfig:1083:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
   drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
   drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +14 drivers/iommu/Kconfig

68255b628776dfa Joerg Roedel    2011-06-14 @14  menuconfig IOMMU_SUPPORT
68255b628776dfa Joerg Roedel    2011-06-14  15  	bool "IOMMU Hardware Support"
e5144c937585194 Arnd Bergmann   2015-01-28  16  	depends on MMU
68255b628776dfa Joerg Roedel    2011-06-14  17  	default y
a7f7f6248d9740d Masahiro Yamada 2020-06-14  18  	help
68255b628776dfa Joerg Roedel    2011-06-14  19  	  Say Y here if you want to compile device drivers for IO Memory
68255b628776dfa Joerg Roedel    2011-06-14  20  	  Management Units into the kernel. These devices usually allow to
68255b628776dfa Joerg Roedel    2011-06-14  21  	  remap DMA requests and/or remap interrupts from other devices on the
68255b628776dfa Joerg Roedel    2011-06-14  22  	  system.
68255b628776dfa Joerg Roedel    2011-06-14  23  

:::::: The code at line 14 was first introduced by commit
:::::: 68255b628776dfafa7f67ca3afd66bd4ba377307 iommu: Move iommu Kconfig entries to submenu

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
