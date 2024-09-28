Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818C18654
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727534543; cv=none; b=TbLWk6FMCqC0K6+H6ohazrAT1MwyYuYCf1qZ8b5VjSmGIkze9phi93+07gowpOvDeIO77qX5K3dqcLBBCpJ3G3Pve55e/nfwuE7715lg5JfUVCjKeNeV84sihBnheCFJJJx+eY8dXzQs3tEFv+kF1TJILQ1QEVamCe3zcI4exVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727534543; c=relaxed/simple;
	bh=E7LgTdi0BN6E0jcj9FInvsJWvUC8O8REhHPwsKVKcGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIRtOnciRBrUAjv7HVAlIHe43LrUzaEPV0a7LPEPX6MlLfTEmOraJdAp4as26cNQSw31S+6/FIwoQQAvDc9ntWBqGAwNII3f1An4H2GevDnM7LepWvTkaVrLtLAxD7eDGohcFSW4CEZ2Uj62KnjjaVW0E3mKv+NRIuTXAViU9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNlFlAUT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNlFlAUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727534541; x=1759070541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7LgTdi0BN6E0jcj9FInvsJWvUC8O8REhHPwsKVKcGg=;
  b=GNlFlAUTKvswKcKQy8/SHbYeEhJdmu3cgvCE+MNgFs6vgr2Z/DPjiiws
   q/OLbS2wGqUYJuIrIDenCf0LBTA7ZN1txGWju/gMx3xJkg7Z6feM8bkHx
   Y62uAnetDnPWP0E6go1wWNamoVWK9mekUUvF3yfpv2Wcmotn7ywUOd+2m
   HgqcUcsxhvYkJG4py4/AhlqoQCTt5KAWWYE9sGH7aR5wief+KRbvGkrGE
   YnovnK/sLN2WKhUHCXtNY8zt83v/cC8gT86B5vzEtvPcbzGuxtBzizMAB
   j00doEoquYZ0iZbNC1OnOv9a6GOn+AXDQt0mSrXaxWMj7t508GT07pAD0
   Q==;
X-CSE-ConnectionGUID: Z1qI34O/QBCi2gKAcjg9dA==
X-CSE-MsgGUID: wvodcrIPQ02o+pd5mfkRkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="49189668"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="49189668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:42:18 -0700
X-CSE-ConnectionGUID: hmlM1UgeTretimzUYofSzA==
X-CSE-MsgGUID: /dqDTAulRwmYe0i0e8IC8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72397075"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 07:42:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYeF-000NKx-0M;
	Sat, 28 Sep 2024 14:42:15 +0000
Date: Sat, 28 Sep 2024 22:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3832/16788]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when
 assigning to type 'pgprot_t' from type 'int'
Message-ID: <202409282218.vG8uS779-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 156e54bbc99018164252576ccb464eaf23a84266 [3832/16788] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: powerpc-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282218.vG8uS779-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282218.vG8uS779-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282218.vG8uS779-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of function 'pgprot_cached_ns'; did you mean 'pgprot_cached'? [-Wimplicit-function-declaration]
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^~~~~~~~~~~~~~~~
         |                                             pgprot_cached
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when assigning to type 'pgprot_t' from type 'int'


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
