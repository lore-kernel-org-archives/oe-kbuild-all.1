Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2F534D3BE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762127427; cv=none; b=mN4QoYy07PBNvVLN9NJpu010/F4l8fNeWElSZWq+9G6lrHAxcH+XfmBPAooNaAWZ9aVAF7FVRm69SxJLR5neIV9b4jZSzzjh3l4SvpqQlkuxIzC385UKwkZk5JCCl7ni1MJQc3xqhMF9jPcM46jLyqq29f3oFr32MSvJ2zho21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762127427; c=relaxed/simple;
	bh=GttTkmdbCZ5J7TUOaftMWvx66MrDZMk5fddJer1mQTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qE8rEgtbmJ5Y1riGW3JUUQK3Z/4iyyxkjoxm8v9cTx1qBTRxHOsCX1Vd3idSs7TXhN4272tKqblHX8p9rzjM6x7uEPcKXhuFbDNePtB7ZIJDwC4pb+SDThG/tmfLemlPnRSol3yXJu+Qiplu37tUoXNm3NAZkLAM+dTKavzCTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROkwGabf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROkwGabf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762127425; x=1793663425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GttTkmdbCZ5J7TUOaftMWvx66MrDZMk5fddJer1mQTQ=;
  b=ROkwGabfIFBeXapSS9ffMqmCXRHAuTTKjFcW6CbpuLJTJLmKypJNMkNm
   wIoWxTw3u85AK1HEDsiaGFXkyY+7w0Kol42feUqlUPzxPUZijBlTHRxmd
   QoXHSq849qWJBVzU3aMJxk6Samqy3mOVxf3PFJgb7v8K+d6wKm0Wnq6vh
   +cDG9FQBtOMGce6ZeXGgs9iJj4v102LYhHLdKO5FDN/dQ/bfV9cr4xZAz
   LhpKdRF0spxsLwHK3+enp2Tw+xjx90OYSA1SHhmUlRCx6LzbgqRkHTVrJ
   wwPGE/6ofZEbHIpi1+Rn/+cxznwHc5ma1V7SIdmlbG1Ok5NaVtyAaikLT
   Q==;
X-CSE-ConnectionGUID: 9xIo56HdSQmkNeZ6LkG0+w==
X-CSE-MsgGUID: hIE26ym8TM6/Dpw33sOVrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="81831096"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="81831096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 15:50:24 -0800
X-CSE-ConnectionGUID: hsBKMgEIQxO62rhhWJ/+yA==
X-CSE-MsgGUID: 6NIL292aQdqBa2zEyPUMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186678790"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2025 15:50:23 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFhq0-000Pez-3D;
	Sun, 02 Nov 2025 23:50:20 +0000
Date: Mon, 3 Nov 2025 07:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083] mm/memcontrol.c:4061:5: sparse:
 sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be
 static?
Message-ID: <202511030753.dgyTecoe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 44391f3171b05060096ff496f3507033f2460161 [3083/3083] memcg: Add sysctl memcg_qos_enable
config: x86_64-randconfig-123-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030753.dgyTecoe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030753.dgyTecoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030753.dgyTecoe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:4061:5: sparse: sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be static?
   mm/memcontrol.c:4223:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/memcontrol.c:4223:50: sparse:     expected void *
   mm/memcontrol.c:4223:50: sparse:     got void [noderef] __user *buffer
   mm/memcontrol.c:4245:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/memcontrol.c:4245:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/memcontrol.c:4245:35: sparse:     got int ( * )( ... )
   mm/memcontrol.c:4504:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4506:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4662:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4756:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6799:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6799:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6799:23: sparse:    struct task_struct *
   mm/memcontrol.c:7016:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:7016:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:7016:52: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2134:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2181:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c:6659:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6927:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/sysctl_memcg_oom_prio +4061 mm/memcontrol.c

  4057	
  4058	#ifdef CONFIG_MEMCG_OOM_PRIORITY
  4059	#define ENABLE_MEMCG_OOM_PROIRITY	1
  4060	#define DISABLE_MEMCG_OOM_PROIRITY	0
> 4061	int sysctl_memcg_oom_prio = DISABLE_MEMCG_OOM_PROIRITY;
  4062	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
