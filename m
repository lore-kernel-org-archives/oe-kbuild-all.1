Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665521FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735329518; cv=none; b=ndBhzRFr8svqI0bhSnMhWjxQbNco3N9VZZixlNN2D4+XDNkfrNy8KcZ9EcAOLlgi86SWNTtEKZz5e0x8v2NZfj7C2599h7ROiKPfQJoy5gRP4Pxggl33PtsV9VPMNUY4uCHaXvgXeOJuhH+vF5OPsOK/j7VSv7YhJ9yLBeLewJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735329518; c=relaxed/simple;
	bh=zGEsDRZ7Y+YmZjwXn4CJ65g70NmU9n1MR3Su4uaNtoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rz9rY28kvadU75goEVdskylKtPR39+6/nmTEvajvzlnfRByM0Jm62O6L3t5qSe9JKtpx9Yp4fy9MiphcP0PALVHX1C45K4PAWnB5CVBDoUsFm4kHngT1eKKFuqjbqRr4eTU4GDLaTGrB1u+X2/1/u1e3Us9V5k7ozIP2cvkMfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUJWpVjl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUJWpVjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735329517; x=1766865517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGEsDRZ7Y+YmZjwXn4CJ65g70NmU9n1MR3Su4uaNtoU=;
  b=RUJWpVjlKHnGyOTreOyyF5IF7rSms/0wkISdjYnzx0dpD9i4H10l+GbX
   50XI4xii0lAqQmIyEgZ4wKxV6TXPbjsek4alN1TMcC1Jin0USJwzzZqVC
   HmWTU3sjzoeumRzSmQ6q+52vwSB4XW/Z8tGazueqIxiOv92pv/7Mhjuuy
   M/enThSoy2IQWdbkst0pFkv9xaEK1xtARnSt1RVaHzOVgJ3DT9w9NCGNY
   YkpKrdXg3IJrVeV5ceaPjIfaWfqD/jz6FmKybk6uzZukeQ1GB8ifusa16
   XbqlkHI4NQPQDgnWwq7gH2Ty+ftgmQWrYMF4BmBmxq/GzYehyWNVC9qjo
   Q==;
X-CSE-ConnectionGUID: O2JAAWWTSzG1IiR6FPTcfg==
X-CSE-MsgGUID: AyLdkofGQqCG5zifk8tbog==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35608184"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35608184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 11:58:36 -0800
X-CSE-ConnectionGUID: 32UFEl97R/Wm5yWhZ9ypxw==
X-CSE-MsgGUID: FzmKn1qKSkSy/x2gctaTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100733920"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2024 11:58:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRGTg-0003Ya-2b;
	Fri, 27 Dec 2024 19:58:32 +0000
Date: Sat, 28 Dec 2024 03:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] mm/clear_freelist_page.c:141:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202412280329.gvMxH5vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 426b9efea56f9b065151d165caab2ebd32906505 [2600/2600] mm: Add sysctl to clear free list pages
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280329.gvMxH5vy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280329.gvMxH5vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280329.gvMxH5vy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/clear_freelist_page.c:141:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/clear_freelist_page.c:141:50: sparse:     expected void *
   mm/clear_freelist_page.c:141:50: sparse:     got void [noderef] __user *buffer
>> mm/clear_freelist_page.c:155:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/clear_freelist_page.c:155:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/clear_freelist_page.c:155:36: sparse:     got int ( * )( ... )

vim +141 mm/clear_freelist_page.c

   133	
   134	static int sysctl_clear_freelist_handler(struct ctl_table *table, int write,
   135			void __user *buffer, size_t *lenp, loff_t *ppos)
   136	{
   137		int ret;
   138		int val;
   139	
   140		table->data = &val;
 > 141		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   142	
   143		if (!ret && write)
   144			clear_freelist_pages();
   145	
   146		return ret;
   147	}
   148	
   149	static struct ctl_table clear_freelist_table[] = {
   150		{
   151			.procname   = "clear_freelist_pages",
   152			.data       = NULL,
   153			.maxlen     = sizeof(int),
   154			.mode       = 0200,
 > 155			.proc_handler   = &sysctl_clear_freelist_handler,
   156			.extra1     = SYSCTL_ONE,
   157			.extra2     = SYSCTL_ONE,
   158		},
   159		{ }
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
