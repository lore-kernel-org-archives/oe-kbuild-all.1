Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AB13048E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714579475; cv=none; b=o1NziEvj3wq5Nq1CVRfkQDI8vvphYjZBIADgef0KUXpDKgGUfydv64i7AlwRxaAp/WuoI6HxBoHQuEWRUTEQ9yE6y92DDJIKpHvbyncOW956NGsdzcpSySsgCLIqcRCR5/C1OhsHl3UqMiCgYzp/JPIhpoAPTflF7icmwFHRq7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714579475; c=relaxed/simple;
	bh=XjBiOxMypJLoYLbeS04xk1aLSGbLTwLkioBc1EfSPko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ub/S8NtXsoyYTqbyCEuNonAn1OLe/6w3WjiISiJd06e2rdZYL5DBnUg1aSf1Sz1glOYKoYjtQmZEVd/y+Joc5io/nyo7geTopjTFDg8Bek+VgcBsHLSdNPKKEor2s9n2N8HDXqojDTHSeZhQ/wfU+xJcw4etxO6T2dpLnShhR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8qu1o70; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8qu1o70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714579473; x=1746115473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjBiOxMypJLoYLbeS04xk1aLSGbLTwLkioBc1EfSPko=;
  b=e8qu1o70td4koxSzTnQSBozVNxgay7DV/XC9eKnQyFKJopfWP2aqORtO
   saRPy7fnPdVFGb4HfPasze9pQObyjsuMfCcu8sFttHYwrqA/ej7EAEF08
   GsKI2rPs8rqgdHY/sTEjShaWsdvJzsFAVZxopADdWZHuU5y8MYgeL62+q
   QWdPDhdNVUrAVYbllKggGWhLUohPL7UYLoYoduxYnP8/z8LOiYcjBm3FA
   Mnyx4TebijLLG5H55smEMv7vuBU6z9h8EKnMwkSuvPNKL14+iCWtAWgq/
   QE7q1zfrZEyLpJMqzG+mJxYeATLN7C9QHYJkW+MOUyjNpr6DxpZIRVp/o
   g==;
X-CSE-ConnectionGUID: 6kXJYJsgSkSEnEGiF1wy/Q==
X-CSE-MsgGUID: GiGZXTi4Sf2NMJdPRfW57g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10185358"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10185358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 09:03:50 -0700
X-CSE-ConnectionGUID: AEOxcvcuT9KkblYtJdXwkQ==
X-CSE-MsgGUID: FPwOV7AiQFKYXRxoZuy/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="26778845"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 May 2024 09:03:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2CQs-0009hq-1P;
	Wed, 01 May 2024 16:03:46 +0000
Date: Thu, 2 May 2024 00:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3832/11730]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:22: error: assigning to 'pgprot_t'
 from incompatible type 'int'
Message-ID: <202405012345.et2KoX0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: 156e54bbc99018164252576ccb464eaf23a84266 [3832/11730] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240501/202405012345.et2KoX0m-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012345.et2KoX0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012345.et2KoX0m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/fsl-mc/vfio_fsl_mc.c:8:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:24: error: call to undeclared function 'pgprot_cached_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:24: note: did you mean 'pgprot_cached'?
   arch/powerpc/include/asm/book3s/64/pgtable.h:809:24: note: 'pgprot_cached' declared here
     809 | static inline pgprot_t pgprot_cached(pgprot_t prot)
         |                        ^
   arch/powerpc/include/asm/book3s/64/pgtable.h:808:23: note: expanded from macro 'pgprot_cached'
     808 | #define pgprot_cached pgprot_cached
         |                       ^
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:22: error: assigning to 'pgprot_t' from incompatible type 'int'
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.


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
