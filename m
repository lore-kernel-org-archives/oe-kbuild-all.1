Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92161D8E1A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635659; cv=none; b=IbaLhU/rfns9fpwQtSm4TT11YweEnx33G6xIrgN+mnZU25KkkHcTC/ObfDsnviqe3bBojOXz2uPE8gDGfd7bQ19V6viGWElp/td0noSbOwvNU32CBNlMOTMRSmebMVCt+8n5g7AS0EVA3ZwwXQnKStaRhPReja7rU2YWJK6+irg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635659; c=relaxed/simple;
	bh=B6Df6fmruiTzJsG3zhRQzwAW5q01Q3z+xAR40DwpsrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XU9oAkSyjia/8CTxNj9mEb25Sz8ewgqJBat3qfbBm0fkmIf0zP5eAojUYK/Jh4YeLQKV8sOIpgsBtNA9cwsU/mFKmF05sczxhpF5zra6PqFdC7TSD8lTfXHkC/zgauEKYKMOKFwK++eXHHoVLsPkcgIhReXYQte7jGC5i4dQtgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC3TXOza; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC3TXOza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747635655; x=1779171655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6Df6fmruiTzJsG3zhRQzwAW5q01Q3z+xAR40DwpsrQ=;
  b=SC3TXOzafod+aoLjUE2GUr0jnQAfeihWCWZDrvMg5R5SdDGXi16/TjOQ
   e6oIM5s6lruuJjxzLnvhR0LOPC0b83ioxRQA23/Thio0eEwu0Y944VII4
   Nt0vZVzC+3pfdBdv+4TCp+I6RrvFH6aiDsDF0flS3yTMAejkzq9bEFSoo
   6gIgUziMGqLHlJnc4SrZFrU6nAyWT6FM7B00n6Sc1ZNdKrEeZgUzZ2LZr
   ZfEc4QKWVVAC7OUBqHulBHBUQ2XSJkdIWpFFrqi6Xe+eG/RHqvrRugv8X
   HYwnLtrD31eDRfURzjWAUiNFcMWue3ZDAbXiyfyS7uEiPpFlm/JAMSyXZ
   w==;
X-CSE-ConnectionGUID: GwFmcvTjQ0iKrTXjLLAYLA==
X-CSE-MsgGUID: Iu0KT6bBSHe5PKQCYqdouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49421641"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49421641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:20:53 -0700
X-CSE-ConnectionGUID: yIwJvlT+RjSWawMxOImIug==
X-CSE-MsgGUID: apvFrXWSRHSWZOlA0/yaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139690516"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 23:20:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGtrl-000LCT-2B;
	Mon, 19 May 2025 06:20:49 +0000
Date: Mon, 19 May 2025 14:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2248/2248]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c:256:21: warning: unused variable
 'ring_index'
Message-ID: <202505191456.gDWxN0oB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2fbde46db56e8457b2be7c09997f5da4757823c3
commit: 24045785bc7c2f64eaecaf8fdbeb88edda892cc3 [2248/2248] drm/amdgpu: Fix pcie order dislocation
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505191456.gDWxN0oB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191456.gDWxN0oB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191456.gDWxN0oB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c: In function 'amdgpu_ih_handle_fix_work':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c:256:21: warning: unused variable 'ring_index' [-Wunused-variable]
     256 |                 u32 ring_index = adev->irq.ih.rptr >> 2;
         |                     ^~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c:244:13: warning: variable 'restart_fg' set but not used [-Wunused-but-set-variable]
     244 |         int restart_fg = 0;
         |             ^~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c:240:32: warning: unused variable 'entry' [-Wunused-variable]
     240 |         struct amdgpu_iv_entry entry;
         |                                ^~~~~


vim +/ring_index +256 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c

   234	
   235	static void amdgpu_ih_handle_fix_work(struct work_struct *work)
   236	{
   237		struct amdgpu_device *adev =
   238			container_of(work, struct amdgpu_device, irq.ih.fix_work);
   239		struct amdgpu_ih_ring *ih = &adev->irq.ih;
 > 240		struct amdgpu_iv_entry entry;
   241	
   242		u32 wptr;
   243		u32 old_rptr;
 > 244		int restart_fg = 0;
   245	
   246	restart:
   247	
   248		wptr = amdgpu_ih_get_wptr(adev, ih);
   249		/* Order reading of wptr vs. reading of IH ring data */
   250		rmb();
   251	
   252		old_rptr = ih->rptr;
   253		amdgpu_ih_fix_loongarch_pcie_order_start(&adev->irq.ih, old_rptr, wptr, true);
   254	
   255		while (adev->irq.ih.rptr != wptr) {
 > 256			u32 ring_index = adev->irq.ih.rptr >> 2;
   257	
   258			amdgpu_irq_dispatch(adev, ih);
   259			ih->rptr &= ih->ptr_mask;
   260		}
   261	
   262		amdgpu_ih_fix_loongarch_pcie_order_end(&adev->irq.ih, old_rptr, adev->irq.ih.rptr);
   263	
   264		amdgpu_ih_set_rptr(adev, ih);
   265		/* memory barrier for setting rptr */
   266		mb();
   267	
   268		if (ih->rptr != amdgpu_ih_get_wptr(adev, ih)) {
   269			restart_fg = 1;
   270			goto restart;
   271		}
   272	
   273		atomic_set(&adev->irq.cs_lock, 0);
   274	}
   275	#endif
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
