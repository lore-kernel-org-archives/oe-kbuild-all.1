Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3523B4E8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792241364; cv=none; b=e3AJ/4odF36jadVvTxO87IVg8hbcI9EWlzYVD7eh/SfTA/jNGQvVL/0fmizaAsQdQ8joCs4oREX7aBRlgmSxERxQ4HmoiKd6F+WGk/qX8Lz1nILuwrbCUWpg4LSGJKDeegznyZL41a7dCzEYPstopFLSObInlVgSJ7spLcQF7ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792241364; c=relaxed/simple;
	bh=1BVEHPW2qN0Y9LubD/FOqs3+HcOKqyT1/AFFANEo4eA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WDAniYfvC+2EsfnKMzNcSlSXWPE6aI22JACGc4VTRF7rT3dgdQLUyfdV3iuQG8TcKuVtBKtlWzJFYMmjTI35F92rWHE5u22CLBUhk/2HNOSXSB154BFjrO8V0lwc9iv84Fi/jHDuKvgkaxVl4jeki4+aeJpZ7DRJcU9pnsjNBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0urIuiS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0urIuiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792241363; x=1823777363;
  h=date:from:to:cc:subject:message-id;
  bh=1BVEHPW2qN0Y9LubD/FOqs3+HcOKqyT1/AFFANEo4eA=;
  b=k0urIuiSWDOQpg1ee3kbaYoUJgo1R8lXsQgUDK4YP8rI+mCdKvCuRwGB
   G1uEG98SPIga5FRAmqA+z0lWq6jdmfFl8Ci9UWqwSMNBUTprqNJZ5oDrc
   u7VBNLOOsdhX/d4lw9UuSdXZBS67bDLsb+wZ4jCYs/uAbLAp0I/BvFCwI
   q2hgwrGGftyqPj2xV7RflzS5nLuwvmtWD8ZJJdIOgsxr9/rFYHg1AEZqc
   Ih0DJeT8SLij3+JhHNl06cr76rNNZc1SBDk1MjotJ5MU1Cnw6FcJzviVC
   uKX+ieg0P5pcTZcmkIs/q9TnhE7iduIuveRCT5cGp0clqEEw68ODqAFBy
   w==;
X-CSE-ConnectionGUID: GnpodUEIShqhPf8/KzkZ3Q==
X-CSE-MsgGUID: kjYa/xl0QVSv1gB6JNgMaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1019266"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1019266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 05:49:21 -0700
X-CSE-ConnectionGUID: U7SbZHVzTme0VwcAg+KhvA==
X-CSE-MsgGUID: r8kT84FCSe2x5ajGB9hZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2567917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2026 05:49:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI3qf-00000000JMo-45Pk;
	Sat, 17 Oct 2026 12:49:17 +0000
Date: Sat, 17 Oct 2026 20:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 11/11]
 kernel/sched/fair.c:2950:13: warning: 'account_llc_dequeue' defined but not
 used
Message-ID: <202610172027.aNLFDjOO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   2ee4460ef69eb7f1a40741d26df51a3565558ea4
commit: 7edb343971a9922518150aa8d0f5856c170b2a35 [11/11] sched/cache: Track LLC-preferred tasks per runqueue
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261017/202610172027.aNLFDjOO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172027.aNLFDjOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172027.aNLFDjOO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:58:
   kernel/sched/sched.h:1914:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1914 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~
   kernel/sched/fair.c:11287:69: warning: 'struct lb_env' declared inside parameter list will not be visible outside of this definition or declaration
   11287 | static inline int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
         |                                                                     ^~~~~~
>> kernel/sched/fair.c:2950:13: warning: 'account_llc_dequeue' defined but not used [-Wunused-function]
    2950 | static void account_llc_dequeue(struct rq *rq, struct task_struct *p) {}
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:2948:13: warning: 'account_llc_enqueue' defined but not used [-Wunused-function]
    2948 | static void account_llc_enqueue(struct rq *rq, struct task_struct *p) {}
         |             ^~~~~~~~~~~~~~~~~~~


vim +/account_llc_dequeue +2950 kernel/sched/fair.c

  2947	
> 2948	static void account_llc_enqueue(struct rq *rq, struct task_struct *p) {}
  2949	
> 2950	static void account_llc_dequeue(struct rq *rq, struct task_struct *p) {}
  2951	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
