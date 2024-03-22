Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E187FBB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711142622; cv=none; b=FAxsxn3YV6orvSoDZIVT7kP9IHudo9X13K8/K29t29XwmFuDr5tSfN2vSsK6MmjF1lfXDT/9ITECR8aSngRB2cA5fjp6HqyUwuC5/PVvl9LyYf8MSNv7a9E2Ui1fo+1Hg62ivJ+AnmfJF3nDxVlOzW35zXnE2sLe6MXX1rm8EVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711142622; c=relaxed/simple;
	bh=HZYjlzy7jLStogdrofzamiIYeEsGa5Pqck9EnSSxnGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifN4Od2WKwBOdEl0H0Tn7XX4DqBs/w85lHwoR8lgDQs3cwIpByjIDuSRSxpjVXG2r+fF8FzYz48OaVnUCLK/EOIo5HvWAtAV+bsbKwH+ALKo1LQe66dmWxh0Tok6QUphjUngViWHXSm7nM+MJr2kmPhyb2DfSq8Yok7mDHI+Wh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSlQxwVy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSlQxwVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711142620; x=1742678620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZYjlzy7jLStogdrofzamiIYeEsGa5Pqck9EnSSxnGU=;
  b=XSlQxwVyLXcnfyoo7sxIVwam+v5LJ65loSnmqqarie0G1SCnn9e0OSTq
   shj9GWnLGqIQrgZMvEPf4osoL4BUAZiU/se2Z1RqjU3Swpd+iLvt8UtjU
   Trrw1fkQros4+nBopiff+xUJcyfCKr2qkQUuTuuQqgufALOEDjt/AKRq6
   ol+NRXDF0MHMwy01PV+b0tPDEHNV4x49PtRfU96LkRMzbbmnloDHJvQ3+
   72BnteBWgf88hrUoZQKSa/DXAA7JelhaB8DQBDFokRJWjeluGIy0w6Oa3
   X5frAT2gcftooDuOVv+UZJDZx8xuLENojaqGKPLZtukKw5JFNV8/p+VN1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="28687643"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="28687643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 14:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="15045243"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Mar 2024 14:23:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnmMQ-000Kcp-2Y;
	Fri, 22 Mar 2024 21:23:34 +0000
Date: Sat, 23 Mar 2024 05:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9348/9434]
 include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving
 pointer to integer cast
Message-ID: <202403230521.dGnQNpKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6763b81216d54c695fac83f157bbbf93ac93233d
commit: 51c3760d93e2a3f2e64a65c5875c000180205a23 [9348/9434] ANDROID: vendor_hook: add hooks to protect locking-tsk in cpu scheduler
config: i386-randconfig-061-20240322 (https://download.01.org/0day-ci/archive/20240323/202403230521.dGnQNpKc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230521.dGnQNpKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230521.dGnQNpKc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/defrag.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, fs/btrfs/ctree.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/defrag.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, fs/btrfs/ctree.h):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/btrfs/transaction.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/transaction.c: note: in included file (through include/linux/fs.h):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   fs/btrfs/transaction.c: note: in included file (through arch/x86/include/generated/asm/unaligned.h, fs/btrfs/ctree.h):
   include/asm-generic/unaligned.h:37:16: sparse: sparse: self-comparison always evaluates to true
   fs/btrfs/transaction.c: note: in included file (through include/linux/fs.h):
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/btrfs/ioctl.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/ioctl.c:424:6: sparse: sparse: context imbalance in 'btrfs_exclop_start_try_lock' - wrong count at exit
   fs/btrfs/ioctl.c:437:6: sparse: sparse: context imbalance in 'btrfs_exclop_start_unlock' - unexpected unlock
   fs/btrfs/ioctl.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/btrfs/volumes.c:398:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rcu_string *str @@     got struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:398:31: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:398:31: sparse:     got struct rcu_string [noderef] __rcu *name
   fs/btrfs/volumes.c:626:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *device_path @@     got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:626:43: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:626:43: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:891:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *cs @@     got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:891:50: sparse:     expected char const *cs
   fs/btrfs/volumes.c:891:50: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:964:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rcu_string *str @@     got struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:964:39: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:964:39: sparse:     got struct rcu_string [noderef] __rcu *name
   fs/btrfs/volumes.c:1014:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const *dev_path @@     got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:1014:34: sparse:     expected char const *dev_path
   fs/btrfs/volumes.c:1014:34: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2221:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected char const *device_path @@     got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2221:49: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2221:49: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2336:41: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected char const *device_path @@     got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2336:41: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2336:41: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/sched/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/volumes.c: note: in included file (through include/linux/fs.h, include/linux/namei.h):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/btrfs/inode.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/inode.c: note: in included file (through include/linux/string.h, arch/x86/include/asm/page_32.h, arch/x86/include/asm/page.h, ...):
   include/linux/err.h:41:17: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/inode.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/btrfs/block-group.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, fs/btrfs/ctree.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/btrfs/block-group.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, fs/btrfs/ctree.h):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/locking/percpu-rwsem.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> kernel/locking/percpu-rwsem.c:267:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/percpu-rwsem.c:298:59: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/locking/locktorture.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/locking/locktorture.c:447:12: sparse: sparse: context imbalance in 'torture_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:466:13: sparse: sparse: context imbalance in 'torture_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:524:12: sparse: sparse: context imbalance in 'torture_ww_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/ww_mutex.h:191:9: sparse: sparse: context imbalance in 'torture_ww_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:619:12: sparse: sparse: context imbalance in 'torture_rtmutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:645:13: sparse: sparse: context imbalance in 'torture_rtmutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:685:12: sparse: sparse: context imbalance in 'torture_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:704:13: sparse: sparse: context imbalance in 'torture_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c:710:12: sparse: sparse: context imbalance in 'torture_rwsem_down_read' - wrong count at exit
   kernel/locking/locktorture.c:731:13: sparse: sparse: context imbalance in 'torture_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c:761:12: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:768:13: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, include/linux/mman.h, ...):
>> include/linux/percpu-rwsem.h:70:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:70:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_read' - wrong count at exit
   include/linux/percpu-rwsem.h:128:60: sparse: sparse: non size-preserving pointer to integer cast
   include/linux/percpu-rwsem.h:128:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_read' - wrong count at exit
--
   kernel/locking/mutex.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> kernel/locking/mutex.c:564:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:634:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:753:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:634:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:753:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:634:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:753:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/mutex.c:1116:67: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/locking/rwsem.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> kernel/locking/rwsem.c:1049:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1119:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1144:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1225:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1397:59: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1422:60: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1332:75: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:252:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:264:67: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rwsem.c:1397:59: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/locking/rtmutex_api.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/locking/rtmutex_api.c: note: in included file:
   kernel/locking/rtmutex.c:1615:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
>> kernel/locking/rtmutex_api.c:35:69: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/locking/rtmutex_api.c:35:69: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/locking/rtmutex_api.c:35:69: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/locking/rtmutex_api.c:35:69: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rtmutex_api.c:129:69: sparse: sparse: non size-preserving pointer to integer cast
   kernel/locking/rtmutex_api.c:144:61: sparse: sparse: non size-preserving pointer to integer cast

vim +70 include/linux/percpu-rwsem.h

    49	
    50	static inline void percpu_down_read(struct percpu_rw_semaphore *sem)
    51	{
    52		might_sleep();
    53	
    54		rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);
    55	
    56		preempt_disable();
    57		/*
    58		 * We are in an RCU-sched read-side critical section, so the writer
    59		 * cannot both change sem->state from readers_fast and start checking
    60		 * counters while we are here. So if we see !sem->state, we know that
    61		 * the writer won't be checking until we're past the preempt_enable()
    62		 * and that once the synchronize_rcu() is done, the writer will see
    63		 * anything we did within this RCU-sched read-size critical section.
    64		 */
    65		if (likely(rcu_sync_is_idle(&sem->rss)))
    66			this_cpu_inc(*sem->read_count);
    67		else
    68			__percpu_down_read(sem, false); /* Unconditional memory barrier */
    69	
  > 70		_trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
    71		/*
    72		 * The preempt_enable() prevents the compiler from
    73		 * bleeding the critical section out.
    74		 */
    75		preempt_enable();
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
