Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE01BBBC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664518; cv=none; b=m9PKKbVUFmRYLyRj3jESdWoYq5PggboU79yNGyCc+f5Xmol5WfB/UeCDLCIm6i6KnmmdVXMabN2e/tP3bLFLTY57x63AJxUQawdJpPtS4vYSbC0j+sPE48bRJJ863YVuDUsCtT683toM6jEkMWy22MKIRjGDQGHrr7H0+AbNTMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664518; c=relaxed/simple;
	bh=qbVVTHm/1xF4KTtRNurqT/7QvXccTglXdVoUZYCnJs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIE0m5gpyHMBJ/+gm8hh3+HTUeeKqPx2A+sizcTZMygD81ZWjZdtmIsESLtV+U9hj3sjlPJ2m2l21UwUunMN6hrLW4JE5Q7xnjx8+YhFiDsRWrTys7JjafWs6aD4LuUqLNnSyrtUPc+p5Xn3U2PuLDeu8zcsrLbm9tlrNPOmqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFuh4uV3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFuh4uV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737664517; x=1769200517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbVVTHm/1xF4KTtRNurqT/7QvXccTglXdVoUZYCnJs4=;
  b=VFuh4uV3QA6YFj+6vxhxeBpq4V7w+H6BqXCWG6pF+839bmsoJHuM4AlT
   5LKT/qKr6lZLOAhcVszFaHbBQzWrwHCU0QUgEaRWvqDkDUxucVxXnC+eL
   Oga5NBDEAnpSGPE6SHJvIssSxZU0pOn+S+/ElFjEeP6oKxdAnnM/U/FME
   oZZr1oTCQj44s8TmI1yQRRy/4ymlQnAT+EtrEH/SgukgtOd4egprAeC2g
   uHzUrUF2afC8DhS8p0LoBdOvpxPDGd8VhVu8fzzuly9gXAN2tzU09WyW3
   eL9KTLrBqhz3aT32bAu6l2Auh2VFBZhtwtDXaHhgBMRb5XepfN8CzhH6n
   Q==;
X-CSE-ConnectionGUID: 5Dow3JPbTRaI+NjAhcuPZw==
X-CSE-MsgGUID: 3IARx/8oSp+7v8fxqGZ1QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38290455"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38290455"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:35:14 -0800
X-CSE-ConnectionGUID: MCGkn2UvRouuxNL1XbAKkQ==
X-CSE-MsgGUID: 2Q9e+mpQRo2h4/sjoSsW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="108116317"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 12:35:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3ux-000bed-0r;
	Thu, 23 Jan 2025 20:35:11 +0000
Date: Fri, 24 Jan 2025 04:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_rm_ops_pgsize 22/23]
 drivers/iommu/s390-iommu.c:804:10: error: 'const struct iommu_ops' has no
 member named 'pgsize_bitmap'
Message-ID: <202501240402.iNhofxjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_rm_ops_pgsize
head:   8e7229d631eab655526324f9d867904ee1351605
commit: 7e198028456d41f2aa10f07650728e74a09f427a [22/23] iommu: Remove ops->pgsize_bitmap
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250124/202501240402.iNhofxjq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240402.iNhofxjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240402.iNhofxjq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/s390-iommu.c:804:10: error: 'const struct iommu_ops' has no member named 'pgsize_bitmap'
     804 |         .pgsize_bitmap = SZ_4K,
         |          ^~~~~~~~~~~~~
   In file included from include/linux/mm.h:28,
                    from arch/s390/include/asm/pgalloc.h:18,
                    from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:181,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/iommu/s390-iommu.c:9:
>> include/linux/sizes.h:23:41: error: initialization of 'void (*)(struct device *, struct list_head *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      23 | #define SZ_4K                           0x00001000
         |                                         ^~~~~~~~~~
   drivers/iommu/s390-iommu.c:804:26: note: in expansion of macro 'SZ_4K'
     804 |         .pgsize_bitmap = SZ_4K,
         |                          ^~~~~
   include/linux/sizes.h:23:41: note: (near initialization for 's390_iommu_ops.get_resv_regions')
      23 | #define SZ_4K                           0x00001000
         |                                         ^~~~~~~~~~
   drivers/iommu/s390-iommu.c:804:26: note: in expansion of macro 'SZ_4K'
     804 |         .pgsize_bitmap = SZ_4K,
         |                          ^~~~~
   drivers/iommu/s390-iommu.c:805:29: warning: initialized field overwritten [-Woverride-init]
     805 |         .get_resv_regions = s390_iommu_get_resv_regions,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/s390-iommu.c:805:29: note: (near initialization for 's390_iommu_ops.get_resv_regions')


vim +804 drivers/iommu/s390-iommu.c

ecda483339a515 Matthew Rosato  2024-09-10  796  
cceb84519520c7 Arvind Yadav    2017-08-28  797  static const struct iommu_ops s390_iommu_ops = {
ecda483339a515 Matthew Rosato  2024-09-10  798  	.blocked_domain		= &blocking_domain,
ecda483339a515 Matthew Rosato  2024-09-10  799  	.release_domain		= &blocking_domain,
8128f23c436d0d Gerald Schaefer 2015-08-27  800  	.capable = s390_iommu_capable,
4efd98d41ea718 Jason Gunthorpe 2023-09-13  801  	.domain_alloc_paging = s390_domain_alloc_paging,
9a630a4b41a263 Lu Baolu        2022-02-16  802  	.probe_device = s390_iommu_probe_device,
9a630a4b41a263 Lu Baolu        2022-02-16  803  	.device_group = generic_device_group,
b4d8ae0e907b09 Niklas Schnelle 2022-10-25 @804  	.pgsize_bitmap = SZ_4K,

:::::: The code at line 804 was first introduced by commit
:::::: b4d8ae0e907b096583491101ddfc5143b7c08918 iommu/s390: Fix incorrect pgsize_bitmap

:::::: TO: Niklas Schnelle <schnelle@linux.ibm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
