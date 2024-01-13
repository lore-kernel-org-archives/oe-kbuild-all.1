Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DC33C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hM2HOp11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705128878; x=1736664878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTjdvoDJD0GK99I0c9v9sxKoQ0IRoGPXqCt0K4N6XYA=;
  b=hM2HOp11FJxsRwToYKNUhZ282DwguO9qFtuu6AKRLtzos3lOIW5CbfXe
   6MmEokTh1kQE546zXh+st8ZBJDafGg7zLKZv1zrYkY/n9UyyBAR+FbSlH
   ojeJPVVwjaRtQTcm5G4CmlpHnGypReOurkma/z9BoC9dktLluygi2utdz
   93afWqOe/I+v8LMV1GvU1s3Vx/fCb5b8ojG9ddy9Bfo7GR+H4b60H1YSo
   71p/x06kFFMfLQ5kmvdy1OAqo4Bx3NrxITfiFbi9WcdDYC1J633hwU544
   vDfX6xG4wv9ZROFEhLLB56mm3jbfK+e8ef4EUbNvI1f1W9hs8i4jfUqsI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20832563"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="20832563"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853485111"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="853485111"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2024 22:54:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXub-000AC0-1x;
	Sat, 13 Jan 2024 06:54:33 +0000
Date: Sat, 13 Jan 2024 14:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3948/17888]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of
 function 'pgprot_cached_ns'; did you mean 'pgprot_cached'?
Message-ID: <202401131430.IHykRduR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Diana,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 971ff81a0eb3555a05d7c7a361d472546eb6a2c3 [3948/17888] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: powerpc64-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131430.IHykRduR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131430.IHykRduR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131430.IHykRduR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of function 'pgprot_cached_ns'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^~~~~~~~~~~~~~~~
         |                                             pgprot_cached
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors


vim +375 drivers/vfio/fsl-mc/vfio_fsl_mc.c

   359	
   360	static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
   361					 struct vm_area_struct *vma)
   362	{
   363		u64 size = vma->vm_end - vma->vm_start;
   364		u64 pgoff, base;
   365	
   366		pgoff = vma->vm_pgoff &
   367			((1U << (VFIO_FSL_MC_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
   368		base = pgoff << PAGE_SHIFT;
   369	
   370		if (region.size < PAGE_SIZE || base + size > region.size)
   371			return -EINVAL;
   372	
   373		if (region.type & FSL_MC_REGION_CACHEABLE) {
   374			if (!(region.type & FSL_MC_REGION_SHAREABLE))
 > 375				vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
   376		} else
   377			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
   378	
   379		vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
   380	
   381		return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
   382				       size, vma->vm_page_prot);
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
