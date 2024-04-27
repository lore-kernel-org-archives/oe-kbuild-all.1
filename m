Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE678146D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714256820; cv=none; b=R7xRi2uFTe1N8TI7fkUYXrSWx1bQLOL1I5kEXkuzLOmP+ahN1RHVqmPxD+uG7eIHVGx641DChbKfUk+yzQls199eT/Qe1nwRm4cl85wrmNWFKKKpSPtZCf8XN/J+rntsBHcUFBTUR0TeAdAyj5T5XD6gXgJ7cF1ur76FsU3dC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714256820; c=relaxed/simple;
	bh=4AHqCm82b0hcQbkbreV3V9bEogzGdtuiwot0eFAiqv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JC8WRbMoWBqG4oH7cpCVivNpQ3x/jetZ0b9QqL2bNO/YaJYgBugK50i86kyYTp4RoMABNavH0mXbArRD0a8YoFMq0fZm2izEhB3HBwIBhCuPOxe6ccxSdYzqM2iIDcVPkukB4eMSh9vMTsmkwvS1bTu9QmrwMtKs5fxIIvU9eF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHxQ1VtL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHxQ1VtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714256817; x=1745792817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4AHqCm82b0hcQbkbreV3V9bEogzGdtuiwot0eFAiqv4=;
  b=eHxQ1VtL8Lx6vLR3lf9RXPQiI///rqJLnhijqlNOkdCAnZrrkMJqq8XB
   VFlgW8jRmcHyLlkW8R8PonjUrX1LhHprHjj324afCagFUKaBsyVCBqM3y
   fQ0Obq702bsFqI+U5ec0LIAGUXDtAU1AYdxFjCVB2hCTxi3d0FhZwboFc
   +gv1rWa3CqbiOvGqN/5ZFb5zgJ8pCoYtvW8MEWGMt9sNuTTolKv4+v3w/
   vzzslqghpQnyVUIKv7YCs7dZ6mahT9K1rO2NDcMc8rzFwLRSYfFPOXLv/
   oBadRctI1SvSrRgjPZqjBtTUS0v/WEx05ZK+wOTYhQR3xkjhryi1l+zHR
   A==;
X-CSE-ConnectionGUID: MgHFu2sNQ/qA7aQwmo5MsQ==
X-CSE-MsgGUID: v0vIJHWiT2G2QswWMIdMRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10125188"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10125188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 15:26:57 -0700
X-CSE-ConnectionGUID: 7HN/74LhTcWy7hLiLdmMwA==
X-CSE-MsgGUID: Dkz2/6tjR3WH7xOrR0dpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25622223"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2024 15:26:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0qVS-0005ZS-02;
	Sat, 27 Apr 2024 22:26:54 +0000
Date: Sun, 28 Apr 2024 06:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3832/11728]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when
 assigning to type 'pgprot_t' {aka 'struct pgprot'} from type 'int'
Message-ID: <202404280605.XStxDLHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 156e54bbc99018164252576ccb464eaf23a84266 [3832/11728] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: x86_64-buildonly-randconfig-001-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280605.XStxDLHa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280605.XStxDLHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280605.XStxDLHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of function 'pgprot_cached_ns' [-Werror=implicit-function-declaration]
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^~~~~~~~~~~~~~~~
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct pgprot'} from type 'int'
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
