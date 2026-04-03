Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A437CD4F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205601; cv=none; b=s3RYfwOcmO2I1qnan291d46b9afbjFNoPJOS2kbeKSgQjDbsoXSCgyMDuEMwFpZ7XGuf7dJtyxylrdHkxoA4VigS85b23WeNVKYRasQrLc0zAxOEt9so+YQgfwIrNhOa3g6b7pzjG6FYpP34NdNuVeP4tQ8EsQFU8TBvfSi8+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205601; c=relaxed/simple;
	bh=2lfx4e6+n9pW7Mz9M5oDU8by7im2gA8mAZ/ralHPmjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4FXSY1xWzgMG4XnxIzNXWtdPF+/TfPyfFf/TZceWAr8XNVB+LH0ZvBnE+hSbPRtoZt8PIhb+4kwtZoUg4l+cDfIXXZGEGLusbp5MqqgXwCI8GHS1LqxfJckBVGe1PcJNH3ET4xsJSvbFIStOU/+3e+x9dDrCQvu6MvRnSBfXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQfBxJRw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQfBxJRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205601; x=1806741601;
  h=date:from:to:cc:subject:message-id;
  bh=2lfx4e6+n9pW7Mz9M5oDU8by7im2gA8mAZ/ralHPmjM=;
  b=IQfBxJRwDNYZKXwRm+G9wTTzchmGZIr2PrL+UTAa6xyL3wSwLzPzwLN9
   CT1EWnDu5aw2h0s9rXj5SqMmw/68V02vIcu6TCfLIRBGINESxtUCuGll9
   H9dThaevZ7GKj6K3NTwoiCk445PS6nTz3OlHVnVvXQYZs2iSqeMzzQ0i8
   c+Tr0w8FklUPUrPjJZdJKNOctOCKXgdwFH/hNcSv47K9ehVybCUkuT19o
   YUY9zUX1xrXVho6uBJ0HWkWj1elPpObpxmAmJJliGgjTJZHNheoP3QOma
   reSC+47/hF/zKMVoQ3j/cNinHFodZzCrok277PoFPqdOd2IW0L++XdWK1
   w==;
X-CSE-ConnectionGUID: Ljk1jzmdS8iwh0frWHkf/Q==
X-CSE-MsgGUID: HKWBraB8SBS/K49te13l2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156543"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:59 -0700
X-CSE-ConnectionGUID: 7xSVQ1xKTsOCzSHaJ2dbOg==
X-CSE-MsgGUID: behxHEQZR9O+1fa6ey6Ogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="220570289"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011f-45mY;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 03 Apr 2026 16:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 66/96]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:226:2: warning: ignoring return value
 of function declared with 'warn_unused_result' attribute
Message-ID: <202604021008.pZUVrNWi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   c1607d2e734438927b2e2174f2af3912dbdb7e8b
commit: 353c89dd0d5bd9032fa724ebb838e742a076223f [66/96] dma-resv: Make checking the dma_resv_lock() return value mandatory
config: hexagon-randconfig-r133-20260402 (https://download.01.org/0day-ci/archive/20260402/202604021008.pZUVrNWi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021008.pZUVrNWi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021008.pZUVrNWi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:226:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           dma_resv_lock(bo->base.resv, NULL);
           ^~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +226 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

995279d280d1ef Karolina Stolarek 2023-11-29  211  
995279d280d1ef Karolina Stolarek 2023-11-29  212  static void ttm_bo_reserve_interrupted(struct kunit *test)
995279d280d1ef Karolina Stolarek 2023-11-29  213  {
995279d280d1ef Karolina Stolarek 2023-11-29  214  	struct ttm_buffer_object *bo;
995279d280d1ef Karolina Stolarek 2023-11-29  215  	struct task_struct *task;
995279d280d1ef Karolina Stolarek 2023-11-29  216  	int err;
995279d280d1ef Karolina Stolarek 2023-11-29  217  
588c4c8d58c413 Karolina Stolarek 2024-06-12  218  	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  219  
995279d280d1ef Karolina Stolarek 2023-11-29  220  	task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
995279d280d1ef Karolina Stolarek 2023-11-29  221  
995279d280d1ef Karolina Stolarek 2023-11-29  222  	if (IS_ERR(task))
995279d280d1ef Karolina Stolarek 2023-11-29  223  		KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
995279d280d1ef Karolina Stolarek 2023-11-29  224  
995279d280d1ef Karolina Stolarek 2023-11-29  225  	/* Take a lock so the threaded reserve has to wait */
a58d487fb1a525 Maarten Lankhorst 2026-03-04 @226  	dma_resv_lock(bo->base.resv, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  227  
995279d280d1ef Karolina Stolarek 2023-11-29  228  	wake_up_process(task);
995279d280d1ef Karolina Stolarek 2023-11-29  229  	msleep(20);
995279d280d1ef Karolina Stolarek 2023-11-29  230  	err = kthread_stop(task);
995279d280d1ef Karolina Stolarek 2023-11-29  231  
a58d487fb1a525 Maarten Lankhorst 2026-03-04  232  	dma_resv_unlock(bo->base.resv);
995279d280d1ef Karolina Stolarek 2023-11-29  233  
995279d280d1ef Karolina Stolarek 2023-11-29  234  	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
995279d280d1ef Karolina Stolarek 2023-11-29  235  }
995279d280d1ef Karolina Stolarek 2023-11-29  236  #endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
995279d280d1ef Karolina Stolarek 2023-11-29  237  

:::::: The code at line 226 was first introduced by commit
:::::: a58d487fb1a52579d3c37544ea371da78ed70c45 drm/ttm/tests: Fix build failure on PREEMPT_RT

:::::: TO: Maarten Lankhorst <dev@lankhorst.se>
:::::: CC: Maarten Lankhorst <dev@lankhorst.se>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
