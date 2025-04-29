Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF11B532F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889584; cv=none; b=hnbGQGvmIV0qkuhsU6u34aR2tZ3OGvobUYom5aM3TqmSLO8Sz874mIs0eVY5KQHf0MN3yncz9zZnqwDVHahmgt5q+GIe9lCV1WZ/ObAn0kYJ3yVQn8HPSfrj22ybaoCIiH1BqQoRQMU4GEfKrcfAaj+L6o5w/3s4HzcejZODBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889584; c=relaxed/simple;
	bh=9udolYjaAg901h7ns2/uHKLdLDD8kG26B5Um079YqyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CE5F5aKIchzn8U/YhyPZoEqKG+Na/s/9U0zqDw+UrVZjQ04tY0PpHN+3WdZIC4j3VrYSbMQttXMsggY2Xe2gThhRRt8NOB5ZVo2ZaSHruiycMZXnITNSCyfrrzldi+aI0/Lky//rrTwDcXu0ZhgZmKvKOQP8tc7GSPweA2Q/7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1+Z00bb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1+Z00bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889583; x=1777425583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9udolYjaAg901h7ns2/uHKLdLDD8kG26B5Um079YqyA=;
  b=d1+Z00bbLQlUMg++rmgG5yfZqzIMzfw2jFNgHwisZ8/XCoeOdAbDo5cN
   IGh+JWJKDR5StzqwYB+vZyN5fZLP45inumubUXl8G9YE+p2GfmXHoxw5l
   noqMS8S90QztIb76PmKAbnzDhCBXe3KLCZCgGFvg8CIt06TpTxBdOz59P
   x1UXwMJhlpabfw9eUvbS+l2OlSRKS3GB/yuc5Rb5BOxcPLMD2YuQrpj4S
   CdNbP7Mnw7DdI4OOLzBPNSlboZ3dd1HVlKOUIZRGs9ryu7I/BPC69nRio
   0ndv8QhQEMztWbDndkIwj934O39m7peqttImpv4zlzV1itMrzO/c9VFZK
   g==;
X-CSE-ConnectionGUID: 963Q1bOlTz24J5fFaNF7lA==
X-CSE-MsgGUID: Q6W5ZwTDSW2OPsa7XZrOyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154558"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:36 -0700
X-CSE-ConnectionGUID: 1oe0sX7eQpub2helt0Zzyg==
X-CSE-MsgGUID: G3oEujXJRESapJtKep2Gfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561627"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Fx-36;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 08:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/ktask.h:123:35: warning: cast between incompatible function
 types from 'int (*)(long unsigned int,  long unsigned int,  struct
 deferred_args *)' to 'int (*)(void *, void *, void *)'
Message-ID: <202504290808.iYcj1P8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   230c2b30f879859ac3e9d3cc46407a9dbb103160
commit: eb761d6521c32c006a4987260394a61c6684fb35 [1597/1597] mm: parallelize deferred struct page initialization within each node
config: arm64-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290808.iYcj1P8f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290808.iYcj1P8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290808.iYcj1P8f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:69:
   mm/page_alloc.c: In function 'deferred_init_memmap':
>> include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1645:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
    1645 |                 DEFINE_KTASK_CTL(ctl, deferred_init_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~
>> include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1661:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
    1661 |                 DEFINE_KTASK_CTL(ctl, deferred_free_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~


vim +123 include/linux/ktask.h

c48676ef6b6f9c Daniel Jordan 2019-08-14  120  
c48676ef6b6f9c Daniel Jordan 2019-08-14  121  #define KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size)	     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  122  	{								     \
c48676ef6b6f9c Daniel Jordan 2019-08-14 @123  		.kc_thread_func = (ktask_thread_func)(thread_func),	     \
69cc5b58cc50d2 Daniel Jordan 2019-08-14  124  		.kc_undo_func = NULL,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  125  		.kc_func_arg = (func_arg),				     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  126  		.kc_min_chunk_size = (min_chunk_size),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  127  		.kc_iter_func = (ktask_iter_range),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  128  		.kc_max_threads = 0,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  129  	}
c48676ef6b6f9c Daniel Jordan 2019-08-14  130  

:::::: The code at line 123 was first introduced by commit
:::::: c48676ef6b6f9cb8497d6264ae9ff71b87630337 ktask: multithread CPU-intensive kernel work

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
