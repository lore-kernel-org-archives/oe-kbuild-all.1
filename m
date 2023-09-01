Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000AA2CA6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693567898; x=1725103898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zcsf24kKS0zcpGL020vhisUfkbo3mG2C/Vk29h3Djv4=;
  b=cUp3r6WBxO+cxxKzu8tJL7XjylXiY6P2fKcc+ERgkV2E7cU5/ZgS91sF
   Xl8moD2zcQUIO6E/90QhVo18JdCa0HU8eTSPXvTHSkTDTySbrtTjeDtHT
   8oOHzI6Byoe5CeE0w9EJqcW7m+cdnxMRGj9HkYh9WhPGD2xnWXBVhhfSr
   66jAqmoQxeZefTFEo7rwSQJsk/nFuz/3xHoCw2HBmubLsUOXfPb9H1ahv
   12x+ZLqYkPMA6CJ7Jg4TcV1pfP+KOUHlHVsiLcdyz6N+rPIZ5A7/jGQDU
   JtAFZqtijGWEbsjmVeG90BhPzjwjtKqmiD4Yf9onHJl0rCL5FssiL95Nj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356513982"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="356513982"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689738294"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="689738294"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 04:31:36 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc2NC-0001F0-1U;
	Fri, 01 Sep 2023 11:31:34 +0000
Date: Fri, 1 Sep 2023 19:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4345/24603]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:22: error: incompatible types when
 assigning to type 'pgprot_t {aka struct pgprot}' from type 'int'
Message-ID: <202309011903.aDagWciI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 053c79cd5d897b39d3659d46370e3b8917f92806 [4345/24603] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011903.aDagWciI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011903.aDagWciI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011903.aDagWciI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:24: error: implicit declaration of function 'pgprot_cached_ns'; did you mean 'pgprot_noncached'? [-Werror=implicit-function-declaration]
       vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
                           ^~~~~~~~~~~~~~~~
                           pgprot_noncached
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:22: error: incompatible types when assigning to type 'pgprot_t {aka struct pgprot}' from type 'int'
       vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
                         ^
   cc1: some warnings being treated as errors


vim +360 drivers/vfio/fsl-mc/vfio_fsl_mc.c

   344	
   345	static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
   346					 struct vm_area_struct *vma)
   347	{
   348		u64 size = vma->vm_end - vma->vm_start;
   349		u64 pgoff, base;
   350	
   351		pgoff = vma->vm_pgoff &
   352			((1U << (VFIO_FSL_MC_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
   353		base = pgoff << PAGE_SHIFT;
   354	
   355		if (region.size < PAGE_SIZE || base + size > region.size)
   356			return -EINVAL;
   357	
   358		if (region.type & FSL_MC_REGION_CACHEABLE) {
   359			if (!(region.type & FSL_MC_REGION_SHAREABLE))
 > 360				vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
   361		} else
   362			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
   363	
   364		vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
   365	
   366		return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
   367				       size, vma->vm_page_prot);
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
