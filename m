Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D34234973
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 04:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785558857; cv=none; b=oaQnlWeC15xoeFw2KljIE+dRmamytS7a0TycMadGHyWrHGSW6+Z+lmzSpaM82db5841wMPeIY3Ps8W1YJi1ajKmxn9VrYVG7NjIWK49YurSPaBLqMoOHO6/GXnT5G2GOrJb3g+R5xytuq0cW4j8aXzYiBcyx7EpxLtnWuDWA4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785558857; c=relaxed/simple;
	bh=EnlkgkcoITd+GA4yftDdRpmFALWfwwhHQrCyvqPeXZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s8OeIJFv4c+q8Gw7miUTwrYrtxvrRiFgtn/U0YSDMFl6JQ9wOk8eJ5aJSERF6EyJ9uwQ/GNfCBEoc6vkQjnoVWqj8akJ2aRAfp2ZyGqiBRAAr+RW2kDdgagnQ3d5l7zEEuKC3TvPUfSHah3p3erkx9eDcRFZt8BC6KJQUq60wdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqOmkfPs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqOmkfPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785558855; x=1817094855;
  h=date:from:to:cc:subject:message-id;
  bh=EnlkgkcoITd+GA4yftDdRpmFALWfwwhHQrCyvqPeXZI=;
  b=CqOmkfPsi8/2+upwXD/FEE7LMreyXyaBECMdXZqz3MU0uArJvWrtIWCF
   FUFbMH6M+TV7ivzTEm9ZR/Cu9OJlbyN0GnSlDaWuOhG1wUU+ywUoDUD6L
   /9lt/VDyOYwFOm1Suvcz/PsrB8dJ1OiDenbLA9SzDOUgpwSeE3JG4P8aS
   3CceM4acGd4FeOGXAt9vjqG+M6xplFR9w5Z9Ueo+2f/Z7dJ+q9gc6Iz1c
   pdGl737SlRBb55m/mv6eG4IGPDx9FJVvKoqCwwVYSdKI9HIM5JCvPiIiZ
   8rDVtyAusZQjWdIK3FFNNWCMRfE3BYk0CQnqIN4vhPTOPV3tE3u+TNPUJ
   g==;
X-CSE-ConnectionGUID: CZTjTWI6TFOKx7Jpp67W8w==
X-CSE-MsgGUID: z72urn2fRB+lRfDY52A0XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86040730"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86040730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 21:34:12 -0700
X-CSE-ConnectionGUID: VkTKpSxLTiyAmA5KR616AQ==
X-CSE-MsgGUID: SUGiviYQSySkE1SLyreX3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="265804872"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2026 21:34:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq1QG-000000002jr-12Ok;
	Sat, 01 Aug 2026 04:34:08 +0000
Date: Sat, 01 Aug 2026 12:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 9139/11507]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202608011221.LpiYHmLJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1d8cfeb69daa863a70134b8ed6df8055c418a5b0 [9139/11507] drm/amdgpu: Pack nested ucode_info struct
config: loongarch-randconfig-r112-20260731 (https://download.01.org/0day-ci/archive/20260801/202608011221.LpiYHmLJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011221.LpiYHmLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011221.LpiYHmLJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *[addressable] kaddr @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse:     got void *[addressable] kaddr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1550:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *const [noderef] __user *__p @@     got unsigned long long [noderef] [usertype] __user ** @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse:     expected unsigned long long [noderef] [usertype] __user *const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse:     got unsigned long long [noderef] [usertype] __user **
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: sparse: Using plain integer as NULL pointer

vim +2393 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

c2d2588c702364f Jonathan Kim 2022-04-08  2362  
c2d2588c702364f Jonathan Kim 2022-04-08  2363  static void send_exception_work_handler(struct work_struct *work)
c2d2588c702364f Jonathan Kim 2022-04-08  2364  {
c2d2588c702364f Jonathan Kim 2022-04-08  2365  	struct send_exception_work_handler_workarea *workarea;
c2d2588c702364f Jonathan Kim 2022-04-08  2366  	struct kfd_process *p;
c2d2588c702364f Jonathan Kim 2022-04-08  2367  	struct queue *q;
c2d2588c702364f Jonathan Kim 2022-04-08  2368  	struct mm_struct *mm;
c2d2588c702364f Jonathan Kim 2022-04-08  2369  	struct kfd_context_save_area_header __user *csa_header;
c2d2588c702364f Jonathan Kim 2022-04-08  2370  	uint64_t __user *err_payload_ptr;
c2d2588c702364f Jonathan Kim 2022-04-08  2371  	uint64_t cur_err;
c2d2588c702364f Jonathan Kim 2022-04-08  2372  	uint32_t ev_id;
c2d2588c702364f Jonathan Kim 2022-04-08  2373  
c2d2588c702364f Jonathan Kim 2022-04-08  2374  	workarea = container_of(work,
c2d2588c702364f Jonathan Kim 2022-04-08  2375  				struct send_exception_work_handler_workarea,
c2d2588c702364f Jonathan Kim 2022-04-08  2376  				work);
c2d2588c702364f Jonathan Kim 2022-04-08  2377  	p = workarea->p;
c2d2588c702364f Jonathan Kim 2022-04-08  2378  
c2d2588c702364f Jonathan Kim 2022-04-08  2379  	mm = get_task_mm(p->lead_thread);
c2d2588c702364f Jonathan Kim 2022-04-08  2380  
c2d2588c702364f Jonathan Kim 2022-04-08  2381  	if (!mm)
c2d2588c702364f Jonathan Kim 2022-04-08  2382  		return;
c2d2588c702364f Jonathan Kim 2022-04-08  2383  
c2d2588c702364f Jonathan Kim 2022-04-08  2384  	kthread_use_mm(mm);
c2d2588c702364f Jonathan Kim 2022-04-08  2385  
c2d2588c702364f Jonathan Kim 2022-04-08  2386  	q = pqm_get_user_queue(&p->pqm, workarea->queue_id);
c2d2588c702364f Jonathan Kim 2022-04-08  2387  
c2d2588c702364f Jonathan Kim 2022-04-08  2388  	if (!q)
c2d2588c702364f Jonathan Kim 2022-04-08  2389  		goto out;
c2d2588c702364f Jonathan Kim 2022-04-08  2390  
c2d2588c702364f Jonathan Kim 2022-04-08  2391  	csa_header = (void __user *)q->properties.ctx_save_restore_area_address;
c2d2588c702364f Jonathan Kim 2022-04-08  2392  
c2d2588c702364f Jonathan Kim 2022-04-08 @2393  	get_user(err_payload_ptr, (uint64_t __user **)&csa_header->err_payload_addr);
c2d2588c702364f Jonathan Kim 2022-04-08  2394  	get_user(cur_err, err_payload_ptr);
c2d2588c702364f Jonathan Kim 2022-04-08  2395  	cur_err |= workarea->error_reason;
c2d2588c702364f Jonathan Kim 2022-04-08  2396  	put_user(cur_err, err_payload_ptr);
c2d2588c702364f Jonathan Kim 2022-04-08  2397  	get_user(ev_id, &csa_header->err_event_id);
c2d2588c702364f Jonathan Kim 2022-04-08  2398  
c2d2588c702364f Jonathan Kim 2022-04-08  2399  	kfd_set_event(p, ev_id);
c2d2588c702364f Jonathan Kim 2022-04-08  2400  
c2d2588c702364f Jonathan Kim 2022-04-08  2401  out:
c2d2588c702364f Jonathan Kim 2022-04-08  2402  	kthread_unuse_mm(mm);
c2d2588c702364f Jonathan Kim 2022-04-08  2403  	mmput(mm);
c2d2588c702364f Jonathan Kim 2022-04-08  2404  }
c2d2588c702364f Jonathan Kim 2022-04-08  2405  

:::::: The code at line 2393 was first introduced by commit
:::::: c2d2588c702364ff53916ddd97e2b26fd4f4a317 drm/amdkfd: add send exception operation

:::::: TO: Jonathan Kim <jonathan.kim@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
