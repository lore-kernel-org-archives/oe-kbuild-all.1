Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61851CC16B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730412599; cv=none; b=PND9zkwTUVPjks/X7Ypq+xrnjj6Tx0N+CZ1l3py3UftIe7qCicaE5R/K/n3+GssvwZcDhe7C7iQFkZBtVgzbnDpMRPDSMCZDhLdt/V8gVa+BDRJuduf5yGLV37GSYGAznG/1YKYQYRzJmcvaUxvO9ggcqYcEPRwdXGhA6GHmHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730412599; c=relaxed/simple;
	bh=Ejhx8ZdSkyvuizJUCeSuKUOg/Oq48DzsxiXB6qMt8RM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm59jH9Hpx+CWcB/Cqa0gg5VYDY7nJKb6gYRCBQor1YJD2odpVRNs4RIsywTGI6q8jAaKRQMB2Z0vkXX0JqVoUB0q4dH5PdhK1Lg8iG2AtjTj9AvVIwtlIKxbkg9plnzzbILO3xCwwp19J2LehlBcI225HhLBFLgEY9sjXGfOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV7idKHS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV7idKHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730412593; x=1761948593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ejhx8ZdSkyvuizJUCeSuKUOg/Oq48DzsxiXB6qMt8RM=;
  b=IV7idKHSoOB+6WYfxJ2IuAs4pWA2JWc7xlvCJwX7lueCQhRBJm/fVz/U
   rB7eF+QOfbZ2oAgvyJ6nSZ19sglsPAObuMIlZM+Wgp+7l2rfw6oHVZOCv
   I0oWN9MJPKK17VpulUUxjq+qSnyp902aPFbpDX5ORtQXJQBSYMxoMjSUb
   NMM2jjZuuPYXsyfVjzip0kiwa47yTZHqu2O+dfRG8ZxjtXl1UY3SvIewM
   Ht+ydmAhaiN5kBltdtH8X7Q0ykqWV+bsWf+jGh7l/AOAjvB9LKGFZSlEO
   pvGB7ocOPEWGWZlQwxfwOVU5rryEKFEtDIS2r0W+eRmzjd49YkqnXru68
   A==;
X-CSE-ConnectionGUID: zf9a3PAFS/SABfGfsowgnw==
X-CSE-MsgGUID: +UjvN/y4S6CXyMUF7G58RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47637922"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47637922"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 15:09:52 -0700
X-CSE-ConnectionGUID: iXoH/OcqSimuhvqBhQOpbg==
X-CSE-MsgGUID: 3E1Lg9B/Q9OzrRGZgEYJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87547775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2024 15:09:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6dMQ-000glv-16;
	Thu, 31 Oct 2024 22:09:46 +0000
Date: Fri, 1 Nov 2024 06:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12000/13046] kernel/sysctl.c:614:54: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202411010611.xhdJA4La-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 75ad2bae3d3bec7c6597f2688ea9211976867247 [12000/13046] rue/mm: pagecache limit per cgroup support
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010611.xhdJA4La-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010611.xhdJA4La-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010611.xhdJA4La-lkp@intel.com/

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
   kernel/sysctl.c:1973:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1973:52: sparse:     expected void *buffer
   kernel/sysctl.c:1973:52: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1961:5: sparse: sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be static?
   kernel/sysctl.c:1994:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1994:52: sparse:     expected void *buffer
   kernel/sysctl.c:1994:52: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1988:5: sparse: sparse: symbol 'memory_qos_sysctl_highest_reclaim_prio_handler' was not declared. Should it be static?
   kernel/sysctl.c:2012:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:2012:52: sparse:     expected void *buffer
   kernel/sysctl.c:2012:52: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:2004:5: sparse: sparse: symbol 'memory_qos_sysctl_prio_reclaim_ratio_handler' was not declared. Should it be static?
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
   kernel/sysctl.c:2917:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2917:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2917:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2924:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2924:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2924:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2933:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2933:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2933:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2942:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2942:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2942:35: sparse:     got int ( * )( ... )
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
