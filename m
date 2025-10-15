Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF6B663
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760550111; cv=none; b=Jat4OoFURYFsoYVJOmIf71rBi4hdJYZaV5QwE2Rl8lTOFGt3pqcLd+YTiGAvl5eLlxwAP1ZiH2CPaQIqoM6o8UnJGPbJkjZ6EnRyRx4TYifmwAeK1KBYZSjlmdQrYPi0f1tewgvkxYzIexvNIqyb6ln1zgWQKtYyU9wb3scppNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760550111; c=relaxed/simple;
	bh=yM8F/jecSSx+NH2neCCe5VRQnE2IdWH/WE7j5XN/38s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9GH5YgTY9YgjEsAExxDUEzHOCu6CS8atfwZ6n79u7DwPibaYJqNBKSXKcyTnxoTzvQM+cV9ZL55AaaTM2b3AVl99StTFyofwhZ9c4cevK1+k4PNRywXoJDMO/3Hjj7OFc1j9vKxEI/vGTWHamzXrgG/FJdAzvKJhDqABVIE4Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYVZyddW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYVZyddW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760550109; x=1792086109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yM8F/jecSSx+NH2neCCe5VRQnE2IdWH/WE7j5XN/38s=;
  b=aYVZyddWi/ICmn8ZCPwsgYMbaPk5PPLSoOOwO6SUpQhngJw06nZnowvi
   v61oABmtk4nC5qZ80Ic5lgaubVjo6F7ZDXLoHGQy/LSjN7dGQk/c0X7LY
   a7zKUf3OuhscIaf2Ib11cVNC7GX8mpmrCBvr5q8kc81s9K9TUUqLVF00k
   4ABMbc9zLw+HpkEjOzhMkxMgR3v6sfyPuoUGGMJKa5V5PjVYKaMDNjPEN
   Qco0xKvveQOzBXfW0rhSxHxkwAEFF6URRpj9ajcvNQngGtL7Ac/a6xTKK
   MLpvnocZvJ6Vl/8mLpAQc4AkK3yLjFATz7FiLFX5GGqchp1AhNwe63AGV
   g==;
X-CSE-ConnectionGUID: 7wT9PzIMSzGR2Egg6Xp1HQ==
X-CSE-MsgGUID: DYSf77iPQdeIGuJaAzV27w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62440869"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62440869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 10:41:48 -0700
X-CSE-ConnectionGUID: o+OikTawQg+ulTFADPAPHA==
X-CSE-MsgGUID: /W9Lm1H6R2mQ8W8JXWXiAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="212847267"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2025 10:41:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v95VQ-00045J-2D;
	Wed, 15 Oct 2025 17:41:44 +0000
Date: Thu, 16 Oct 2025 01:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 6/6]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:225:13: error: incompatible pointer
 types passing 'struct rt_mutex *' to parameter of type 'struct mutex *'
Message-ID: <202510160137.J5A5PSGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   3e8fbfb1ecfbc83297628a0d93812ba7d5c979e0
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [6/6] arm64: Allow to enable PREEMPT_RT.
config: arm64-randconfig-r113-20251015 (https://download.01.org/0day-ci/archive/20251016/202510160137.J5A5PSGW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160137.J5A5PSGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160137.J5A5PSGW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:15:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:225:13: error: incompatible pointer types passing 'struct rt_mutex *' to parameter of type 'struct mutex *' [-Wincompatible-pointer-types]
     225 |         mutex_lock(&bo->base.resv->lock.base);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:161:44: note: expanded from macro 'mutex_lock'
     161 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   include/linux/mutex.h:152:45: note: passing argument to parameter 'lock' here
     152 | extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass);
         |                                             ^
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:231:15: error: incompatible pointer types passing 'struct rt_mutex *' to parameter of type 'struct mutex *' [-Wincompatible-pointer-types]
     231 |         mutex_unlock(&bo->base.resv->lock.base);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:192:40: note: passing argument to parameter 'lock' here
     192 | extern void mutex_unlock(struct mutex *lock);
         |                                        ^
   1 warning and 2 errors generated.


vim +225 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

995279d280d1ef Karolina Stolarek 2023-11-29  210  
995279d280d1ef Karolina Stolarek 2023-11-29  211  static void ttm_bo_reserve_interrupted(struct kunit *test)
995279d280d1ef Karolina Stolarek 2023-11-29  212  {
995279d280d1ef Karolina Stolarek 2023-11-29  213  	struct ttm_buffer_object *bo;
995279d280d1ef Karolina Stolarek 2023-11-29  214  	struct task_struct *task;
995279d280d1ef Karolina Stolarek 2023-11-29  215  	int err;
995279d280d1ef Karolina Stolarek 2023-11-29  216  
588c4c8d58c413 Karolina Stolarek 2024-06-12  217  	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  218  
995279d280d1ef Karolina Stolarek 2023-11-29  219  	task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
995279d280d1ef Karolina Stolarek 2023-11-29  220  
995279d280d1ef Karolina Stolarek 2023-11-29  221  	if (IS_ERR(task))
995279d280d1ef Karolina Stolarek 2023-11-29  222  		KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
995279d280d1ef Karolina Stolarek 2023-11-29  223  
995279d280d1ef Karolina Stolarek 2023-11-29  224  	/* Take a lock so the threaded reserve has to wait */
995279d280d1ef Karolina Stolarek 2023-11-29 @225  	mutex_lock(&bo->base.resv->lock.base);
995279d280d1ef Karolina Stolarek 2023-11-29  226  
995279d280d1ef Karolina Stolarek 2023-11-29  227  	wake_up_process(task);
995279d280d1ef Karolina Stolarek 2023-11-29  228  	msleep(20);
995279d280d1ef Karolina Stolarek 2023-11-29  229  	err = kthread_stop(task);
995279d280d1ef Karolina Stolarek 2023-11-29  230  
995279d280d1ef Karolina Stolarek 2023-11-29  231  	mutex_unlock(&bo->base.resv->lock.base);
995279d280d1ef Karolina Stolarek 2023-11-29  232  
995279d280d1ef Karolina Stolarek 2023-11-29  233  	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
995279d280d1ef Karolina Stolarek 2023-11-29  234  }
995279d280d1ef Karolina Stolarek 2023-11-29  235  #endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
995279d280d1ef Karolina Stolarek 2023-11-29  236  

:::::: The code at line 225 was first introduced by commit
:::::: 995279d280d1ef5cc349b6eafee4dccd720c99bf drm/ttm/tests: Add tests for ttm_bo functions

:::::: TO: Karolina Stolarek <karolina.stolarek@intel.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
