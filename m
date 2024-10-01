Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26026224EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727748832; cv=none; b=Qc5JVqkMwCWRGBDd1sr0uhv/tJcVvFtnKxvk653X3AA2tuMhgY8LCfmTgsysa8jNKTn2f+a6OMt6oZF74Wof6UTO+VxQ5UQv1igLeyyXHPeCyEiq2dxxhPxlYjUWXUUF/GQvcjxytWwjjWxhyfTrwFQbLNqwwsDYvhRTlYrro90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727748832; c=relaxed/simple;
	bh=LQKuAjCt7vf92HfS0qUB6dz6LioTbdSQbR5tz2scZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhSjUKRJ1oTwBYF4j4n2rBzn8YaJPCAUWC2HmXFBrMlgv2bxMHvk7nDQOZ3qQ08Idjc/1uEyT2B2kv5/7F+Zt7pNp9TK6e2cMUDpHi1nuMqcljmA9XVu7sgfZLcyFyaXPjiXmdq1cnu2UR7cMLmOWzyjVoEGzjqBztHdHM/uQyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IX+W5bZO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IX+W5bZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727748831; x=1759284831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQKuAjCt7vf92HfS0qUB6dz6LioTbdSQbR5tz2scZY8=;
  b=IX+W5bZOi0orFVTEvpnPHa3ju5LisypS9p9sj/Z+0+SK6jHsRrW4JDUb
   4CeoP1f2r6SD7LZo7Tk3Y7VmrAn8fW5RR2m/e6/e8liR1oEcyzb+KdGdi
   Ou9zdRHFWFHcbIC9Gvowt93bnAXfSD7ZUjLmobnIhs9RdRaobe/riXRPc
   RntbuWpFJLX7N0KaBwGBEf+K4thfo7Xu6vPr60ROAMWB0IWnTnP+Yr6fL
   /nfppTV/kroXdAw0KGku8DLVFH7FHVmWDhxPAZjeNue57n3ANxaM27a56
   QH09ky/Ytmz+kBm+z85IVSY3Y3pxB83EuQtK9jx/SFECUynIHDJ4GJrl3
   A==;
X-CSE-ConnectionGUID: ByculddUSfqgJgta/FttHg==
X-CSE-MsgGUID: qmOYj1iNSiG3BndcUr6qqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26370507"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26370507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:13:49 -0700
X-CSE-ConnectionGUID: EocndhNxSEi4rp1jpqVBxw==
X-CSE-MsgGUID: iANyXvxgRfKX1/vzy3ynRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="110981088"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 19:13:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSOX-000Q97-1k;
	Tue, 01 Oct 2024 02:13:45 +0000
Date: Tue, 1 Oct 2024 10:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 7/8] mm/execmem.c:144:23: warning: variable
 'lower_size' set but not used
Message-ID: <202410011051.WAbCUVop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 21ce3be90ca4d26a895b08de0d68fab4143f97d7 [7/8] execmem: add support for cache of large ROX pages
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410011051.WAbCUVop-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011051.WAbCUVop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011051.WAbCUVop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/execmem.c:144:23: warning: variable 'lower_size' set but not used [-Wunused-but-set-variable]
     144 |         unsigned long lower, lower_size = 0;
         |                              ^
>> mm/execmem.c:145:23: warning: variable 'upper_size' set but not used [-Wunused-but-set-variable]
     145 |         unsigned long upper, upper_size = 0;
         |                              ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/lower_size +144 mm/execmem.c

   137	
   138	static int execmem_cache_add(void *ptr, size_t size)
   139	{
   140		struct maple_tree *free_areas = &execmem_cache.free_areas;
   141		struct mutex *mutex = &execmem_cache.mutex;
   142		unsigned long addr = (unsigned long)ptr;
   143		MA_STATE(mas, free_areas, addr - 1, addr + 1);
 > 144		unsigned long lower, lower_size = 0;
 > 145		unsigned long upper, upper_size = 0;
   146		void *area = NULL;
   147		int err;
   148	
   149		lower = addr;
   150		upper = addr + size - 1;
   151	
   152		mutex_lock(mutex);
   153		area = mas_walk(&mas);
   154		if (area && mas.last == addr - 1) {
   155			lower = mas.index;
   156			lower_size = mas_range_len(&mas);
   157		}
   158	
   159		area = mas_next(&mas, ULONG_MAX);
   160		if (area && mas.index == addr + size) {
   161			upper = mas.last;
   162			upper_size = mas_range_len(&mas);
   163		}
   164	
   165		mas_set_range(&mas, lower, upper);
   166		err = mas_store_gfp(&mas, (void *)lower, GFP_KERNEL);
   167		mutex_unlock(mutex);
   168		if (err)
   169			return -ENOMEM;
   170	
   171		return 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
