Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60722318
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732098035; cv=none; b=Gb644Cwmix8AwNESJUSnqAMib5bs5ubKFm5IxxZsE11pilcV6jCHIFX+LykMBIbJd4o0U+vX7hDN4PuUQbYLWjvRyX+TaL0S9vceaEimCEN0tIGOzVVwjVuwqDkI8cgAoEHfoZUrYCKD8THKkvTwxzIbXNLK1atk2i2ZZ6xQBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732098035; c=relaxed/simple;
	bh=MiwzCuTPqKVvYAGPEirb4IsQpPiLtNFXv9aZvtx1H7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGUmtD4e77NbCTb4GmRNVtJDuc33e3TOM6NsJwc9/JZrGK0Iay80WV+H6IzN7ulzlA8t9IBJ+UzQAyKVynuGfSwzS/WQUk9Mh8sV6K5qyEYIdUiTYdZZPncsb9rn39Ag7C44gpXDE9oa0jXQkYyNkz6taP8Ol/9hg9R9UpBQB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrSvQXmO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrSvQXmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732098033; x=1763634033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MiwzCuTPqKVvYAGPEirb4IsQpPiLtNFXv9aZvtx1H7Q=;
  b=hrSvQXmOm8bk5LxopMTnj7X2ZkWihY4aCwRBpv7Ef2qIik01pNIeXwzg
   vPDkZ2HQZv4LX9XthTkqXVNht10jLIJplYlKTfC3izYUZgf6J/g4JClde
   rt9zNGdt6OIvNIwIoGnMaQtfXjqzKPl+Nbf3nuIg2+6JnSmsZkIkGXyUs
   V3m1O84dA1PhBBnmZ/Jwt/uWb2JNpHHwKmbwcytIQbSQ73eQJHl2JWWZh
   519dhxzPECFZjaDxm97WOv5yqL1I11PNolm/HcUHOtLxV7RZ03bfx/1k3
   ebdzD0/WvSRr6aS0w9r4Xe3gSsJ0pfN/xkidX2+PZO2LzxsrZgb1ELYu7
   Q==;
X-CSE-ConnectionGUID: ShIhrhsJS+CoG9aYfOxz+A==
X-CSE-MsgGUID: Uui3cFwHT+GmQYBEoe/x8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43546955"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43546955"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:20:32 -0800
X-CSE-ConnectionGUID: fx2pux/GQqWhAhX2Wapsbw==
X-CSE-MsgGUID: MoI8sPyuSWKiX4qEjbeg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89851713"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2024 02:20:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDhoz-0000lF-0t;
	Wed, 20 Nov 2024 10:20:29 +0000
Date: Wed, 20 Nov 2024 18:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2451/2451] kernel/sched/topology.c:1749:2:
 error: implicit declaration of function 'register_sysctl_init'
Message-ID: <202411201827.IfsNluS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf0212daf6239e1b0e65e6dd7ee9fdec378c5dd4
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [2451/2451] sched: Add cluster scheduler level for x86
config: x86_64-buildonly-randconfig-003-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201827.IfsNluS9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201827.IfsNluS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201827.IfsNluS9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:1838:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1838 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:718:6: warning: variable 'numa_distance' set but not used [-Wunused-but-set-variable]
     718 |         int numa_distance = 0;
         |             ^
>> kernel/sched/topology.c:1749:2: error: implicit declaration of function 'register_sysctl_init' [-Werror,-Wimplicit-function-declaration]
    1749 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^
   7 warnings and 1 error generated.


vim +/register_sysctl_init +1749 kernel/sched/topology.c

8ce3e706b31409 Tim Chen 2021-12-03  1746  
8ce3e706b31409 Tim Chen 2021-12-03  1747  static int __init sched_cluster_sysctl_init(void)
8ce3e706b31409 Tim Chen 2021-12-03  1748  {
8ce3e706b31409 Tim Chen 2021-12-03 @1749  	register_sysctl_init("kernel", sched_cluster_sysctls);
8ce3e706b31409 Tim Chen 2021-12-03  1750  	return 0;
8ce3e706b31409 Tim Chen 2021-12-03  1751  }
8ce3e706b31409 Tim Chen 2021-12-03  1752  late_initcall(sched_cluster_sysctl_init);
9e68cc2bf535a2 Tim Chen 2021-12-03  1753  

:::::: The code at line 1749 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
