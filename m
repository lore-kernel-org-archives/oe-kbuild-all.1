Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166FB23C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+HI72cY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698376568; x=1729912568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9pVdtxCGOe5U8P1sVAjWCFzbAy62OFpKVtFQU4Bodc=;
  b=O+HI72cYhQuvEG1/ACpLsbBLt4xdBfMFBHRBEn54XYMpF97IfLeNuEn2
   sy/u7roGJ68gB1CbgQwp15P8ijPvw/M+7PD6rV/7pEGO0s7Wv3r7D+Jxj
   HofUzQNTzFdiM64YIjNG+umsDEYnQY5UcpJDEXJ4L5x77f76jTGh9XvMy
   uwuwUUdDFPg4nukhW3Ry1XRNF3voY1kZ3KliMQ3Sh1GDiIuK9RFLsGjaO
   prgIBMwsXr6zHrFcRJ45Mp+AgiqZ/UG/6Pvc5YLV9NNtOiT438G2ABesD
   I6p4chl5oPErfTY5Fv32mRKUelQo3dUV3jcJScHQ6jL7zYYlOx6VYl4Aj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454161901"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="454161901"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 20:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="752970924"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="752970924"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 20:16:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwDKJ-000AOJ-0t;
	Fri, 27 Oct 2023 03:15:59 +0000
Date: Fri, 27 Oct 2023 11:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3948/15770]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when
 assigning to type 'pgprot_t' from type 'int'
Message-ID: <202310271149.cADHAFwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 971ff81a0eb3555a05d7c7a361d472546eb6a2c3 [3948/15770] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231027/202310271149.cADHAFwY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271149.cADHAFwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271149.cADHAFwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of function 'pgprot_cached_ns'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
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
