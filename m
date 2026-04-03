Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093C37BE8E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205600; cv=none; b=nx+cRTwaHgXOQP082OSlTQahuvaDVkZM6GgZYE9E9LVvARCcVf9bIlXqSBUqB4kEPGRA96y+sEW1N8IkdvkEMpfuFZq2i0g28PYkpBAz4tBdByXiD7ycg3yF3fJ22/4GqBshJuC3JkYqtopUmFLJ3oO5t7nixCmjPKm45mZT3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205600; c=relaxed/simple;
	bh=w/CQ0e9eHrLv0LrjlS7WB3SbEVi5RHGxs1n24X+xrtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VBMRg6lkZu2YOsx+DUngFjrrx3HxxXI7XXfHq+vI840RwkE3VYKK4b0z3zAd4v3UcC6mhq+HVGUP3XMSdoB898Yv6CqM4GWQkl9mhTixfk1fUIgIVS+EnKeQ7WYnVvDDfN9/NYYng9H+0YFwn7dWFWnE6a0u5OsaZiD9AWojtx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyAGnJtY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyAGnJtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205599; x=1806741599;
  h=date:from:to:cc:subject:message-id;
  bh=w/CQ0e9eHrLv0LrjlS7WB3SbEVi5RHGxs1n24X+xrtQ=;
  b=gyAGnJtYi+dqGE2vg0evkkyJbR/PgVDtNxgidSU9A3CtTAC7MjGA731Y
   w6RQH0/8cw+pbUiTRBiQh6iAWJkCotwdOetlcBP+T0U55vHZkzbGurZ+o
   sPe/HpbLjyffnOMSv3qzBMkanFMtO7TUsD5FbTTV0mcSGQgiXeXgmc9ZC
   CVt2D0D3z+V+u7yZKbzWDZ3BzzvotDHB1Qla518UAu/ONNkF90CIgb+EG
   aVCo0hz1y5mscQVhopcE7WKPVkgWdQxEJ7mDeuF1Y68RwiXsFmcbn/L5t
   6WViLj6wg7oCokZA4CdYouFrUbSdgt+lh5TicAknqqEOcEcW39d9jRm8x
   A==;
X-CSE-ConnectionGUID: QvrSkd4nStuav8MAiN8ZUA==
X-CSE-MsgGUID: VRxwlQA6Riax34VD1Wat+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156541"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156541"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:58 -0700
X-CSE-ConnectionGUID: iFtBA6G3Tj2WJR0eHQs2lA==
X-CSE-MsgGUID: 2LpY8MOvSjGZlwu+ap0QMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="220570287"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011d-3c2W;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 03 Apr 2026 16:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 45/96]
 drivers/gpu/drm/drm_gem_shmem_helper.c:595:13: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202604021004.Rcoy8SeK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   c1607d2e734438927b2e2174f2af3912dbdb7e8b
commit: bb81f5851d11d8a6895dcbe1420102b8f86ad8a4 [45/96] drm: Check the dma_resv_lock() return value
config: powerpc-randconfig-r123-20260402 (https://download.01.org/0day-ci/archive/20260402/202604021004.Rcoy8SeK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021004.Rcoy8SeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021004.Rcoy8SeK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_gem_shmem_helper.c:595:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   drivers/gpu/drm/drm_gem_shmem_helper.c:595:13: sparse:     expected restricted vm_fault_t [usertype] ret
   drivers/gpu/drm/drm_gem_shmem_helper.c:595:13: sparse:     got int

vim +595 drivers/gpu/drm/drm_gem_shmem_helper.c

   577	
   578	static vm_fault_t drm_gem_shmem_any_fault(struct vm_fault *vmf, unsigned int order)
   579	{
   580		struct vm_area_struct *vma = vmf->vma;
   581		struct drm_gem_object *obj = vma->vm_private_data;
   582		struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
   583		loff_t num_pages = obj->size >> PAGE_SHIFT;
   584		vm_fault_t ret;
   585		struct page **pages = shmem->pages;
   586		pgoff_t page_offset;
   587		unsigned long pfn;
   588	
   589		if (order && order != PMD_ORDER)
   590			return VM_FAULT_FALLBACK;
   591	
   592		/* Offset to faulty address in the VMA. */
   593		page_offset = vmf->pgoff - vma->vm_pgoff;
   594	
 > 595		ret = dma_resv_lock(shmem->base.resv, NULL);
   596		if (ret)
   597			return ret;
   598	
   599		if (page_offset >= num_pages ||
   600		    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
   601		    shmem->madv < 0) {
   602			ret = VM_FAULT_SIGBUS;
   603			goto out;
   604		}
   605	
   606		pfn = page_to_pfn(pages[page_offset]);
   607		ret = try_insert_pfn(vmf, order, pfn);
   608	
   609	 out:
   610		dma_resv_unlock(shmem->base.resv);
   611	
   612		return ret;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
