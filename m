Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD717C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674176073; x=1705712073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/zbRD53yDqnZsMZcO1tcyBSMbjnVvrauhHDRsZVQnY=;
  b=oBHc0y+Shz+TkiYuT+QHi73fLADqnVVvEm+MpS4ucqrBUp5T4o8mm/F8
   MeB2uKJgxDFQihekNhaHfaDTqC09br3/Ug7MqfR51vB8GlQnTXtsOa8d1
   SbvEOH8Xbq5Pm3xteEcG9OGMTopdaBBtHt5yM2osB2vXijAgqyeBbohsj
   76VVmAo2SgtC0GLub443qoUNUBzNWkcmAjZ8u4+yuXf/lduOEd2dxJWJ8
   XcoPa0FOL6xcuZAeMhm8VHRoM73MDbj8KiiNLrap2BVs0a6sN9LM0OTTM
   TmBjr1/NQU2Ibx0RF1UakeFV7Kl+EGBAxH0qBB0m6kI3plOHDeSAryfAj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326756573"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="326756573"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 16:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660426273"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="660426273"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2023 16:54:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIffq-000220-2Q;
	Fri, 20 Jan 2023 00:54:30 +0000
Date: Fri, 20 Jan 2023 08:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: [djiang:cxl-emulate-hdm 1/9] arch/x86/pci/mmconfig-shared.c:451:
 undefined reference to `efi'
Message-ID: <202301200823.art1eu2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bjorn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-emulate-hdm
head:   6c7fe26eb2f67816411bb41a976a6c50056aa574
commit: b2b6d47f1b29b36472a90db110c9d2d421f04627 [1/9] x86/pci: Treat EfiMemoryMappedIO as reservation of ECAM space
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230120/202301200823.art1eu2t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=b2b6d47f1b29b36472a90db110c9d2d421f04627
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-emulate-hdm
        git checkout b2b6d47f1b29b36472a90db110c9d2d421f04627
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: arch/x86/pci/mmconfig-shared.o: in function `is_efi_reserved':
>> arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
>> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
>> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'


vim +451 arch/x86/pci/mmconfig-shared.c

   445	
   446	static bool is_efi_reserved(u64 start, u64 end, enum e820_type not_used)
   447	{
   448		efi_memory_desc_t *md;
   449		u64 size, mmio_start, mmio_end;
   450	
 > 451		for_each_efi_memory_desc(md) {
   452			if (md->type == EFI_MEMORY_MAPPED_IO) {
   453				size = md->num_pages << EFI_PAGE_SHIFT;
   454				mmio_start = md->phys_addr;
   455				mmio_end = mmio_start + size - 1;
   456	
   457				if (mmio_start <= start && end <= mmio_end)
   458					return true;
   459			}
   460		}
   461	
   462		return false;
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
