Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217077082D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173290; cv=none; b=Fj99KgJFHyyecOF4tv7L6xcxMyF+HDORaZSmh+iXgPtv6sy9AaZwlWLwMhjqGeCK0/0hZ39NU+f3gs9X/cUo/ZwPyFSjw4oLuQLbhuE90YFsn1FQCZQz4cEN3AnhkSuwZawLmf4mH2ld7SG6bjOhhn+D3iJZXLItfOHKoXB0vhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173290; c=relaxed/simple;
	bh=A+tSRYdcSrQwa+tJGBYrQ9F/iqm+CGpSDKpJKstYnos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuxizhYCTjNIlXFgwx68m5mUwEa5EUMreMbETCA32gI2U+PpGpUuI2oqYryPaKZLOSbdp40cQG4f9cV4oys9QOv1KsMrxyIxMw88B93VMQJzCZdBHsNtda6eZW6BvLD21d7YD6gfDV+GRlgUR+oZBZc6QCLDeJAads1UibzT1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLls9UXR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLls9UXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770173288; x=1801709288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+tSRYdcSrQwa+tJGBYrQ9F/iqm+CGpSDKpJKstYnos=;
  b=dLls9UXR6JxrHVdb+ZmOv7umgNYivLd0KQjlH8Qqa6R0cDmYkhfDjlKi
   +eIVWBxA9x9ak4RwzFRaMw7XMFfVwbTrbM4OFfema5p30oOd2sDYE1snK
   IF2W+jGd7hHAZiH+DWxDnt9yijjvqbf9E0k9oxaeEnDmF2PFSstkpGFuU
   vsJTYAJXMVsc+J68rg08e2pkSOvMlcW5S1mPU0+445LlwavKFEAMoClGo
   uIE8fLEYQNGDU1AGXThErlUJPRqWRpnxpfzFQBv9IgGDTp+J4HU9WsMxf
   3b1PfSoMgCmkywt8Cs3Ik8xLW2Ml/DgLGY/Eugm1g03mER2M62EEOJjuA
   Q==;
X-CSE-ConnectionGUID: 6EfdZ7rjQKuWsdsnwQAu5g==
X-CSE-MsgGUID: 9JSyZfUlSrG2Gb+aQ83I8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71254374"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71254374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 18:48:08 -0800
X-CSE-ConnectionGUID: qx9OJY3dSPmjDUZWqUTS+Q==
X-CSE-MsgGUID: CvbhJeo4QVikG3bw+MkIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210122647"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2026 18:48:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnSvv-00000000hOy-46Aa;
	Wed, 04 Feb 2026 02:48:00 +0000
Date: Wed, 4 Feb 2026 10:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>, alexandre.belloni@bootlin.com,
	arnd@arndb.de, fustini@kernel.org, Jonathan.Cameron@huawei.com,
	krzk@kernel.org, linus.walleij@linaro.org, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, fanghao11@huawei.com,
	linuxarm@huawei.com, liuyonglong@huawei.com,
	prime.zeng@hisilicon.com, wangzhou1@hisilicon.com,
	xuwei5@hisilicon.com, wangyushan12@huawei.com
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202602041006.7Hb46Sl8-lkp@intel.com>
References: <20260203161843.649417-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203161843.649417-2-wangyushan12@huawei.com>

Hi Yushan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc8]
[cannot apply to soc/for-next next-20260203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20260204-004656
base:   linus/master
patch link:    https://lore.kernel.org/r/20260203161843.649417-2-wangyushan12%40huawei.com
patch subject: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: loongarch-randconfig-r131-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041006.7Hb46Sl8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041006.7Hb46Sl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041006.7Hb46Sl8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_soc_l3c.c:251:7: error: call to undeclared function 'alloc_contig_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
         |              ^
>> drivers/soc/hisilicon/hisi_soc_l3c.c:251:5: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     251 |         pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                                 cpu_to_node(smp_processor_id()), NULL);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/alloc_contig_pages +251 drivers/soc/hisilicon/hisi_soc_l3c.c

   237	
   238	static int hisi_l3c_mmap(struct file *file, struct vm_area_struct *vma)
   239	{
   240		unsigned long size = vma->vm_end - vma->vm_start;
   241		int order = get_order(size);
   242		unsigned long addr;
   243		struct page *pg;
   244		int ret;
   245	
   246		struct hisi_l3c_lock_region *clr __free(kfree) = kzalloc(sizeof(*clr), GFP_KERNEL);
   247		if (!clr)
   248			return -ENOMEM;
   249	
   250		/* Continuous physical memory is required for L3 cache lock. */
 > 251		pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
   252					cpu_to_node(smp_processor_id()), NULL);
   253		if (!pg)
   254			return -ENOMEM;
   255	
   256		addr = page_to_phys(pg);
   257		*clr = (struct hisi_l3c_lock_region) {
   258			.addr = addr,
   259			.size = size,
   260			.cpu = smp_processor_id(),
   261			/* vma should not be moved, store here for validation */
   262			.vm_start = vma->vm_start,
   263			.vm_end = vma->vm_end,
   264		};
   265	
   266		vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
   267		vma->vm_ops = &hisi_l3c_vm_ops;
   268		vma->vm_private_data = clr;
   269	
   270		hisi_l3c_vm_ops.open(vma);
   271		if (clr->status) {
   272			ret = clr->status;
   273			goto out_page;
   274		}
   275	
   276		ret = remap_pfn_range(vma, vma->vm_start, PFN_DOWN(addr), size,
   277				      vma->vm_page_prot);
   278		if (ret)
   279			goto out_page;
   280	
   281		/* Save clr from being freed when lock succeeds. */
   282		vma->vm_private_data = no_free_ptr(clr);
   283	
   284		return 0;
   285	
   286	out_page:
   287		free_contig_range(PHYS_PFN(clr->addr), 1 << order);
   288		return ret;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
