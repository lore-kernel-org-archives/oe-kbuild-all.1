Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2D145A03
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095571; cv=none; b=a5QLikjNZmsBy4AxqT9H2eYB7QGIAvHk469HmsiqKa+12qw55tPqMqbwcUbR8Jnb+f9mJP9sV+LKKoSmNdVgW15CC0iy6jHW5ZLeVY0MsrlKTStfLOPWDLoJR/ROU5mFAE7Y60J2ODHzrN3hon70/FHakXc11LkGzvPAjUMPWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095571; c=relaxed/simple;
	bh=gRitjbmVm3zxJ73BqHCnKbh7Gx022mNPPh3pwHtH7WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQ5i9EF+ekLt2jNhO7rR7Bw7u2gRDGDuECkWYenPwRaRz2OHWx5xhRVtf91e+hRCfUYeq9K48p8XL2Xq8ws7KbQ6dhKm2gt3deoXIrBKtPkfz0xJX/hHxhgfo8hk78w9JvoCo22r4xd1VscfwB6bsIfjKGX19wa4oajWQZWCu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V77qCMOm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V77qCMOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746095569; x=1777631569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRitjbmVm3zxJ73BqHCnKbh7Gx022mNPPh3pwHtH7WY=;
  b=V77qCMOm+razSNvI6yFY1CWGs1SOcchDK8fNkG7NXDwm18F97jiG8H48
   +rgTo+kW3jjp9/We5x4olwfvrrzFXqKat1Y1mOLJT0tCAYAqLFoPGGCnw
   5xq+0JRArt7k72HinVTDAdo3B2MvAUpYJa11v7PKW0h93P6PhMtGtNz1j
   8q54O/NlloRJjbcRgl3HPtIcdSqLDGh1NPdjXeCHUpH7fpw8qc/16TzVk
   7RxRddVaofsltjybmrXXxqIzBwQtLswfqTYsJUQL8YMmWfpqKRiDevz/2
   t11BJ0CxlL2FBAZU2ajbWzB1JDhoBVq35BtiLG25ip/VsEiDCTVqHOYgE
   w==;
X-CSE-ConnectionGUID: ZFhW7pCUQI+U61hpReIuuA==
X-CSE-MsgGUID: gqbsOzgNQbC2I5MFhNqifA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47778896"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47778896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 03:32:48 -0700
X-CSE-ConnectionGUID: OoPeC8xcSJmoNU5btFmeig==
X-CSE-MsgGUID: WJKXk+gATyKTRVpLeZIZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139170575"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2025 03:32:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uARDg-00046X-2O;
	Thu, 01 May 2025 10:32:44 +0000
Date: Thu, 1 May 2025 18:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt_all 42/68] iommu.c:undefined reference to
 `pt_iommu_amdv1_hw_info'
Message-ID: <202505011806.0PSLmezb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   e09ae4f9b47677554bf952d7c55a9e2c6ade90f8
commit: 200961c0f4c2c56b952cd6e69e15e4db608a2bc2 [42/68] iommu/amd: Use the generic iommu page table
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250501/202505011806.0PSLmezb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011806.0PSLmezb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011806.0PSLmezb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:60:37: warning: 'amd_dirty_ops' defined but not used [-Wunused-const-variable=]
      60 | static const struct iommu_dirty_ops amd_dirty_ops;
         |                                     ^~~~~~~~~~~~~
--
   ld: vmlinux.o: in function `set_dte_entry':
>> iommu.c:(.text+0x6b24f9): undefined reference to `pt_iommu_amdv1_hw_info'
   ld: vmlinux.o: in function `init_gcr3_table':
>> iommu.c:(.text+0x6b4695): undefined reference to `pt_iommu_x86_64_hw_info'
   ld: vmlinux.o: in function `amd_iommu_domain_alloc_paging_v1':
>> iommu.c:(.text+0x6b4f0a): undefined reference to `pt_iommu_amdv1_init'
   ld: vmlinux.o: in function `amd_iommu_domain_alloc_paging_v2.constprop.0':
>> iommu.c:(.text+0x6b500c): undefined reference to `pt_iommu_x86_64_init'
   ld: vmlinux.o: in function `K_table':
>> crc32c-3way.o:(.rodata+0x97ff0): undefined reference to `pt_iommu_x86_64_map_pages'
>> ld: crc32c-3way.o:(.rodata+0x97ff8): undefined reference to `pt_iommu_x86_64_unmap_pages'
>> ld: crc32c-3way.o:(.rodata+0x98020): undefined reference to `pt_iommu_x86_64_iova_to_phys'
>> ld: crc32c-3way.o:(.rodata+0x98048): undefined reference to `pt_iommu_amdv1_read_and_clear_dirty'
>> ld: crc32c-3way.o:(.rodata+0x98070): undefined reference to `pt_iommu_amdv1_map_pages'
>> ld: crc32c-3way.o:(.rodata+0x98078): undefined reference to `pt_iommu_amdv1_unmap_pages'
>> ld: crc32c-3way.o:(.rodata+0x980a0): undefined reference to `pt_iommu_amdv1_iova_to_phys'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86_64
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
