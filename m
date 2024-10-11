Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888BB19408C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658822; cv=none; b=ZgIwAHXNm0LQI9btvjp4U3ahDthknsU2eknofTB8XobfqB1LY4EvCr5zzkUyzlq/gPhEFSF2hXLzH9uNWq1sgsdBNxBZYZMlQq/rFD5hfWUUnFGfRFh00nieaotN2w1bXyBspot+yusZnFxIIcdc8znl++T/m/PGND/yIHVIZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658822; c=relaxed/simple;
	bh=2pGlcMBpN2PYYqsdhycVhqXxGPwo6bEAs64sut57wdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJvvKuNI5mAB5KAVVJL/9b7vj2hlBOgkLLjvWIpxmkJtO+Z82spE/bE2I7DtfcfhGAavLCOecBfGs/fmRmTThm6zvIKwsqLoqd3JnkRLP7J8gdnY8Usil25msQZ+JJ5PrEFm6oS2RoTbSdb207mloxGj8JDH8GRUQi1f3wi6lkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGIiLM8O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGIiLM8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728658821; x=1760194821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pGlcMBpN2PYYqsdhycVhqXxGPwo6bEAs64sut57wdI=;
  b=PGIiLM8Ofb3PhaoPYw+n+b3r43uRloUJppyQjNIp0NowPdzdf/qR16hx
   KYB7GHihXcSEDWGzVjl28jcPJe7518f+x9GiFAV+otkNNdS+Kddi7d9gV
   XspbnryJ5AArsIorG/EkNcufx7MucaCld0A/NmSh6KZVbMBs+y/PvmW3+
   ru91xsafoS/JDdeT61fzGNclWBwCqoq8XKT/i92D5zy/1dwRkZFkaZXto
   dLbvtIHr2LDnQAMgO47WG4mqZ9H39KzX+PoncI2GaWq5DmnndiCZPLCyL
   wCIuKPwpEwIm2eNUJ0A6GaOIBn/O5+2RVsVYbbSFpXSpEeNK1pPO+Df6y
   w==;
X-CSE-ConnectionGUID: 9F3ALixfTZGCfRsn5dK8kw==
X-CSE-MsgGUID: LimMmKCLRsaeA7pb+4lY/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28169025"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="28169025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 08:00:20 -0700
X-CSE-ConnectionGUID: Iy9d+cxGTzyVsI2JgI3rMg==
X-CSE-MsgGUID: HbfoJfbpQLCiD63OenQfqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81552386"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 08:00:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szH7o-000CPR-2u;
	Fri, 11 Oct 2024 15:00:16 +0000
Date: Fri, 11 Oct 2024 22:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: "steve.jeong" <jkhpro1003@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 137/204] drivers/char/aml-gpiomem.c:128:29:
 error: implicit declaration of function 'phys_mem_access_prot'; did you mean
 'phys_mem_access_prot_allowed'?
Message-ID: <202410112236.fXVW2pwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   2402b85f3675cd92c0ba7cb5f051596e07bd3971
commit: 0a01b3c15e7c03cfbd687185d96a66d0cca87069 [137/204] ODROID-N2/C4: char: Add /dev/gpiomem device for rootless user GPIO access.
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241011/202410112236.fXVW2pwo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410112236.fXVW2pwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410112236.fXVW2pwo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/aml-gpiomem.c: In function 'aml_gpiomem_mmap':
>> drivers/char/aml-gpiomem.c:128:29: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     128 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             phys_mem_access_prot_allowed
>> drivers/char/aml-gpiomem.c:128:29: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors


vim +128 drivers/char/aml-gpiomem.c

   111	
   112	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   113	{
   114		int gpio_area = 0;
   115		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   116		unsigned long end   = start + vma->vm_end - vma->vm_start;
   117	
   118		while (gpio_area < inst->gpio_area_count) {
   119			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   120			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   121				goto found;
   122			gpio_area++;
   123		}
   124	
   125		return -EACCES;
   126	
   127	found:
 > 128		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   129				vma->vm_end - vma->vm_start,
   130				vma->vm_page_prot);
   131	
   132		vma->vm_ops = &aml_gpiomem_vm_ops;
   133	
   134		if (remap_pfn_range(vma, vma->vm_start,
   135					vma->vm_pgoff,
   136					vma->vm_end - vma->vm_start,
   137					vma->vm_page_prot)) {
   138			return -EAGAIN;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
