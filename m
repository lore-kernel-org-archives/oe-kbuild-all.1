Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FC8F5D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693480248; x=1725016248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Yw+SxFSfvCez7ipWBSoL5zwq0bjxQQhvcEt9x7nnP0=;
  b=mT6FmxkUL76Vo/Du4XTW19fUZZS+Rel6NiRQdy+EUuJ67Xork83DGx2i
   93TI3fW/LjLbU3tRgsjUaY0iIW2ceZpYqdo9fSJB7F5CtwE7LuiNWtVrW
   yYPFUukFu3LBftKqWn9iCyKDcxfZJp51xAWRaxKmQTx5igfAYRfFvwR4K
   3DlL61IxLmdSDfwHxDmWhq3ZnfINoNAtKL4LPcCpx19j/qTJoabxNQdXD
   LVEaartr8YDFOIX3xc7aqzgxRp6CB1GTdiH64XJdHOHpmsujt0ZwOLBwu
   kH9id1PIjgWVUDbECofP/nRMgaBMlDKmeiQbLbXAHd4RMPekBJytSpZsL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442266966"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="442266966"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 04:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809556355"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="809556355"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 04:10:46 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbfZU-00004P-0H;
	Thu, 31 Aug 2023 11:10:44 +0000
Date: Thu, 31 Aug 2023 19:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4345/24604]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:45: error: implicit declaration of
 function 'pgprot_cached_ns'; did you mean 'pgprot_cached'?
Message-ID: <202308311939.KqjIgsuq-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 053c79cd5d897b39d3659d46370e3b8917f92806 [4345/24604] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: powerpc-randconfig-r006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311939.KqjIgsuq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311939.KqjIgsuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311939.KqjIgsuq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:45: error: implicit declaration of function 'pgprot_cached_ns'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
     360 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^~~~~~~~~~~~~~~~
         |                                             pgprot_cached
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:45: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
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
