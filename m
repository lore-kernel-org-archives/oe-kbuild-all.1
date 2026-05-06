Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7435893
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048271; cv=none; b=sGnJQcUcjvrx2C5b1cpYOSXpB0MqOSYhaEGMO0TazG6LzYnU0FPD2S8lYsTl/IaIt61DCqPHFcpad05lrGCDzPErJKDJIe1NbAcpvT3YKBn32h9PWfs+0ZatIatWFC8O39alvJfFtOP2WPvlTCPq9Cov5Cg0fsRVSEDLIhGfPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048271; c=relaxed/simple;
	bh=KLQE4udYAns+JGh6d+CdbhxE6v81AvoyJIgNx6MlvUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uE4m+HBro0dtuRaflXECdS0yxLQYDqp6MlvcFgOZQ5HWpovdN8p4nfTJjN6UvOuFUHYFdVfyVTAh9BrCfugUCVbas4Rjcg3smc3hLM4FOOUy+BoML5s53AxdvGivGhGv7zkPWC9tOGiH7IP1XoXO/oJGQZLLMUZZ0J/j32dD1So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVfqksr1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVfqksr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778048269; x=1809584269;
  h=date:from:to:cc:subject:message-id;
  bh=KLQE4udYAns+JGh6d+CdbhxE6v81AvoyJIgNx6MlvUk=;
  b=VVfqksr1VHBIQVUczMrpR7p9/+9PnF7HkkMckVCvdH8P3UJ69Z139VPc
   Eml7cZZk9qZIsDLJL3X2lQ07i7QmpfQgPUvQsKM0qbWMBBdZOEa1XXbJv
   2crmlQ7Vy3Lekkah17row6qdviYLtm3AdnLEgDNK2lV3HZdf/I9cq6EKW
   CxnBZ7K6P9QuMldPuSEQsc+i7+WGvBusnyKz2Ey5dpN5JNlECNoB5yDb8
   kxQ5FnzD7X7HbN3UFKCdlsvyGG42BuvG8Sz3dyk6I7KU34Sg9nChprTtC
   S/pcZtInr5IlnbdTl+o5hJrAjmF/Y9SbJ1tuR64O8pWGJ5mDJBT4GjxXX
   w==;
X-CSE-ConnectionGUID: xf02620eS8GEymVRvu4rBg==
X-CSE-MsgGUID: dZiILljIRa+O7ES7URPgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90318194"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90318194"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:17:48 -0700
X-CSE-ConnectionGUID: UbFG1brxTqGTUarP9Oq7Jw==
X-CSE-MsgGUID: d7ukTnBZSaWdiWz2DMxkXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259404318"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2026 23:17:47 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKVZp-000000000l7-1ZLI;
	Wed, 06 May 2026 06:17:45 +0000
Date: Wed, 06 May 2026 14:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:fanotify-bpf 1/3]
 fs/notify/fanotify/fanotify.c:1062:63: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202605061408.WGETFhTu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git fanotify-bpf
head:   d2202d928a9b4a190058b1bc4731b72477a10c8e
commit: 85c87cab4c9c2ffa4a9d2b00525a75576f50c550 [1/3] fanotify: Introduce fanotify filter
config: nios2-randconfig-r133-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061408.WGETFhTu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061408.WGETFhTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061408.WGETFhTu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/notify/fanotify/fanotify.c:1062:63: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fanotify_filter_hook *filter_hook @@     got struct fanotify_filter_hook [noderef] __rcu *filter_hook @@
   fs/notify/fanotify/fanotify.c:1062:63: sparse:     expected struct fanotify_filter_hook *filter_hook
   fs/notify/fanotify/fanotify.c:1062:63: sparse:     got struct fanotify_filter_hook [noderef] __rcu *filter_hook

vim +1062 fs/notify/fanotify/fanotify.c

  1048	
  1049	static void fanotify_free_group_priv(struct fsnotify_group *group)
  1050	{
  1051		put_user_ns(group->user_ns);
  1052		kfree(group->fanotify_data.merge_hash);
  1053		if (group->fanotify_data.ucounts)
  1054			dec_ucount(group->fanotify_data.ucounts,
  1055				   UCOUNT_FANOTIFY_GROUPS);
  1056	
  1057		if (mempool_initialized(&group->fanotify_data.error_events_pool))
  1058			mempool_exit(&group->fanotify_data.error_events_pool);
  1059	
  1060	#ifdef CONFIG_FANOTIFY_FILTER
  1061		if (group->fanotify_data.filter_hook)
> 1062			fanotify_filter_hook_free(group->fanotify_data.filter_hook);
  1063	#endif
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
