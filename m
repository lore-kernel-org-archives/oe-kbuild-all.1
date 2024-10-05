Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2B914265F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728123132; cv=none; b=ZOkN+Rtw+6eXfcoStg60AvbZuBiSqLjOp901mPNo8uFdZfYszZEcH1EGqxk3lrkDuXd1UxWPudLWW4Of5LEEw0yhzz/ddLiep0aJZRjNB0RRyMyTTKuaafSnA6lSmfRhwGSESC4Rof/CZ5bnYuFOZHhCW4PYA1XYO9yLYGPA4EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728123132; c=relaxed/simple;
	bh=qUPRnykGJL/EybCP0DgP5+Gei/a+bQT+2nAlSTqZklY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lj5VaLH6FX5o3tQ8GUbJohHnbmvZYZqBVwmMpPuJd4Wo3aJDnqurKFFASFYqvZMbN4NPbKQOcjAjIz+VC5+plX7sj7u1iu0/oarsCl0eWoCAXs33avYPjx4Ffy/eBAo75DWSAAaHZMPDzRaOxkJ6zp2mwoAWmQvcdNkOWgtROpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4XomJfl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4XomJfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728123130; x=1759659130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUPRnykGJL/EybCP0DgP5+Gei/a+bQT+2nAlSTqZklY=;
  b=G4XomJflalv5agQomEurwAXwy8WLmgvwJPqGqrn8yMdOMPoZEVsYYje/
   w8K+jC2ZQ3BpqpQWVMugW3UNlu3N8j8nD0gboIYIldQK1j0WUSm+IBqzI
   UV7ebODnQadWeGFSnak3p2CuBiakCjqj5IARf0QJ8E97W25p4aTUTO29U
   93ADbfySRc3yK5l9cJudZa8w8ToTDnevEg4ULRewh8Sm/Bw1ASWItnJmT
   DAbVqd67SERjH/7jc8gMtpp+kH1CFyc3Falk0OpdH+YxwFTnst++3CW6G
   chNYMGwwBE90ye/yhIoT+ZPcUfhUJgqDKTPJmx0p6m6h5IA5NmEZTZYx2
   w==;
X-CSE-ConnectionGUID: OltONec4SqmbonC7kGaNwA==
X-CSE-MsgGUID: o+6gbMm8ToWz8nNqnQ9m+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26839751"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="26839751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 03:12:09 -0700
X-CSE-ConnectionGUID: h66LqRpKRK+2ZfTccqJ8GA==
X-CSE-MsgGUID: RqM7tD99TiykBMsg/FUB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="105801617"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2024 03:12:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx1lb-0002qM-0z;
	Sat, 05 Oct 2024 10:12:03 +0000
Date: Sat, 5 Oct 2024 18:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12000/12031] kernel/sysctl.c:614:54: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202410051837.9XzQcFvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 75ad2bae3d3bec7c6597f2688ea9211976867247 [12000/12031] rue/mm: pagecache limit per cgroup support
config: x86_64-randconfig-122-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051837.9XzQcFvd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051837.9XzQcFvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051837.9XzQcFvd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:614:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:614:54: sparse:     expected void *
   kernel/sysctl.c:614:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:626:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:626:54: sparse:     expected void *
   kernel/sysctl.c:626:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:644:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:644:54: sparse:     expected void *
   kernel/sysctl.c:644:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1000:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1000:47: sparse:     expected void *buffer
   kernel/sysctl.c:1000:47: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:987:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1160:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1160:45: sparse:     expected void *buffer
   kernel/sysctl.c:1160:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1912:15: sparse: sparse: symbol 'security_switch_min' was not declared. Should it be static?
   kernel/sysctl.c:1913:15: sparse: sparse: symbol 'security_switch_max' was not declared. Should it be static?
   kernel/sysctl.c:1921:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1921:52: sparse:     expected void *buffer
   kernel/sysctl.c:1921:52: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1915:5: sparse: sparse: symbol 'security_switch_handler' was not declared. Should it be static?
   kernel/sysctl.c:2042:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2042:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2042:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2051:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2051:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2051:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2060:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2060:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2060:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2069:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2069:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2069:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2078:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2078:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2078:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2087:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2087:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2087:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2096:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2096:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2096:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2105:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2105:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2105:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2264:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2264:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2264:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2735:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2735:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2735:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2859:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2859:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2859:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2868:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2868:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2868:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2884:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2884:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2884:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:353:66: sparse: sparse: self-comparison always evaluates to false
--
>> mm/vmscan.c:7483:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/vmscan.c:7483:53: sparse:     expected void *
   mm/vmscan.c:7483:53: sparse:     got void [noderef] __user *buffer
   mm/vmscan.c:7535:1: sparse: sparse: symbol 'pagecache_reclaim_wq' was not declared. Should it be static?
   mm/vmscan.c:7536:1: sparse: sparse: symbol 'kpagecache_limitd_wq' was not declared. Should it be static?
   mm/vmscan.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +614 kernel/sysctl.c

8f985ca9fe5f44 Kairui Song 2023-11-20  610  
8f985ca9fe5f44 Kairui Song 2023-11-20  611  static int pc_limit_proc_dointvec(struct ctl_table *table, int write,
8f985ca9fe5f44 Kairui Song 2023-11-20  612  				  void __user *buffer, size_t *lenp, loff_t *ppos)
8f985ca9fe5f44 Kairui Song 2023-11-20  613  {
8f985ca9fe5f44 Kairui Song 2023-11-20 @614  	int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
8f985ca9fe5f44 Kairui Song 2023-11-20  615  
8f985ca9fe5f44 Kairui Song 2023-11-20  616  	if (write && !ret)
8f985ca9fe5f44 Kairui Song 2023-11-20  617  		ret = setup_pagecache_limit();
8f985ca9fe5f44 Kairui Song 2023-11-20  618  
8f985ca9fe5f44 Kairui Song 2023-11-20  619  	return ret;
8f985ca9fe5f44 Kairui Song 2023-11-20  620  }
8f985ca9fe5f44 Kairui Song 2023-11-20  621  

:::::: The code at line 614 was first introduced by commit
:::::: 8f985ca9fe5f441dfaf6824bc08222f91f34a10c pagecachelimit: limit the pagecache ratio of totalram

:::::: TO: Kairui Song <kasong@tencent.com>
:::::: CC: Kairui Song <kasong@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
