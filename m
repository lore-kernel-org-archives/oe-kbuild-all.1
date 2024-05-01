Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B645433A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714576231; cv=none; b=dMLRbUYftcBtIBfqE+UPhLwWr9NRTSd7ywCgZL39Rvgxg1AGaoqnJuNvgBx21CI66nV8gMbgf2cuW1m7lDIwsSJqySsEfLZUvhqn6n/tWp4auno7D+kRJh20xk7o9Si30psjR1DWVl+VGDQsc3WPwPGQOl4wxzfxgG9QwZmxtpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714576231; c=relaxed/simple;
	bh=PdY5K9I6gbT9q4zB0jXFLn2CPR73cCJf7S1uhkkZ9Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qs2z08sl6gha7CEHrkIuI0HEhLDzMJQrBemGwLeBdjOvbAWdXJXp0r7N44Jz7nRAPAceAp90CIekP3weMGMA8SVm6DDEppAM3rUbIqb4vBzU0F715GJkZmyQYzwbKEQIz7AO6i97NtoDWvqwmOL4HlvMNnyIV3QUG5fDjc+ThkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EE/0KQal; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EE/0KQal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714576228; x=1746112228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdY5K9I6gbT9q4zB0jXFLn2CPR73cCJf7S1uhkkZ9Rs=;
  b=EE/0KQalbjImwRcMcTIG3LHsmIMVRo/GX32qEsi85j7O7+Xccd/AQeTX
   1KCTjWp42v8K1LGUK24JZodBaVU4jaHhKw5DMTFTDjCEJraBzysR8R5RG
   jQekAcZcF5EzNSbBKYD0ySK16Yn+u1Hc9K8glKTH0TlWLQLphIMi/peVA
   vsqLlxfBtBJm7WL9BfPF0K0P7TcAXChC8Un+SJ8htWVSd7ZZz77YKG6vA
   pK9O9X+QyMxtE/NIAjOUITTlnP9DMVeyxZ4h4jdw7NB8r0mJ+0z5TAAfB
   uAfjQi9M7K1gNRzu3nxKJwONTxB00F8J1BQl0vyPnSZlXY+ZEYhpAJYL2
   A==;
X-CSE-ConnectionGUID: n9jt4YXzRM6q1qjHOrjdRQ==
X-CSE-MsgGUID: z2HwM2ELThub/CZkAZlADA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21459093"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="21459093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 08:10:28 -0700
X-CSE-ConnectionGUID: sQc+EMciSpu8n2BF8XJ2vA==
X-CSE-MsgGUID: ieFLUgoCTOKHrkSytLCflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="58000249"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2024 08:10:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2BbE-0009f4-2x;
	Wed, 01 May 2024 15:10:24 +0000
Date: Wed, 1 May 2024 23:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4345/29983]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:24: error: implicit declaration of
 function 'pgprot_cached_ns'
Message-ID: <202405012326.t1bDiFop-lkp@intel.com>
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
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: 053c79cd5d897b39d3659d46370e3b8917f92806 [4345/29983] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240501/202405012326.t1bDiFop-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012326.t1bDiFop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012326.t1bDiFop-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:24: error: implicit declaration of function 'pgprot_cached_ns' [-Werror,-Wimplicit-function-declaration]
     360 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:360:22: error: assigning to 'pgprot_t' (aka 'struct pgprot') from incompatible type 'int'
     360 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/pgprot_cached_ns +360 drivers/vfio/fsl-mc/vfio_fsl_mc.c

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
