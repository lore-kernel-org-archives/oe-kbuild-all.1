Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393528643D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761937005; cv=none; b=d1sOxJRwyb+pXDWQ4v56N+MZHUsCnka4zFhVlBUKnyVaBQ9ZFnoAiP3hUbe2epuz0fz7UaKvrMzyw+7Lsj6QotzyIsqI+N49GUhX/50/w3/nnc1rSuqlzyqS0GKjQ6JYVcZAuKpvqjZ/D9EASaEJn+b2eMSPvZTADwUCAnEJseI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761937005; c=relaxed/simple;
	bh=GwHz1OrhjZEoJAM7dh4efceLgdtJzRM9J6IcMW4vAYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F229RrcNAZVHD3GZY9rjlrEMpCu/tKjnpIJjh9btq4GUaWVROhNhOq/ecIg7pKthVAr1bIW7FepLPWKJQXtaL1wJ0j3A/yc2VCoe3DJHDw1NoBcEnJna6sAH7eCjYyY/9qeCuJvB8dsx2LCQl/E+LZwnBtt5ul/5xxz0McWcaZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQwUg3Vm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQwUg3Vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761937003; x=1793473003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwHz1OrhjZEoJAM7dh4efceLgdtJzRM9J6IcMW4vAYU=;
  b=fQwUg3VmwtJSHafoAlbErPfUVEZt5tXzRxei884OJzUpgywMv4XEpCNw
   phSTJOYJpEKWUCl1GstiI5mU3Qw6nu2hKzhBDfk2Iif6pcGzO8iu44FmY
   clBuFoHI2/pAgR7tj5w9921HlhMmUQLPoFfWpqacaVEFHiaTBbweC0PKg
   +IiKOe8g3dJefwZZE/Ubnu4j/Q+BcAguwO//i7n5q2ONxeUV50KYHOcVP
   wbxNIuk7KzglVsFn8VwTRE4+LfqQOllIp08YiMRvUbISRlbllFt7zhogp
   pUO4tJ3DTVe4KRPU59XD8KI0AuMsrD1oxNFUbECQ+6chK4YGylNzSG5AV
   A==;
X-CSE-ConnectionGUID: ng73pfZYRXSgUNmnE4/6eg==
X-CSE-MsgGUID: s8oxrfwZQVmJqK87rGj4lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64135719"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="64135719"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 11:56:42 -0700
X-CSE-ConnectionGUID: GYLeYYBXQGe/0SP+DfiMAA==
X-CSE-MsgGUID: J5fNyajhSaOnbkRnLZjVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="191445096"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2025 11:56:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEuIg-000NZu-19;
	Fri, 31 Oct 2025 18:56:38 +0000
Date: Sat, 1 Nov 2025 02:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4486/5383] kernel/sched/ext.c:6509:18: sparse:
 sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be
 static?
Message-ID: <202511010200.BobYItig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: a3f5d48222532484c1e85ef27cc6893803e4cd17 [4486/5383] sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere
config: sparc64-randconfig-r113-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010200.BobYItig-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010200.BobYItig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010200.BobYItig-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:2489:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2489:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2550:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2550:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2550:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2569:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2569:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2569:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2691:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2691:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2691:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2770:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2770:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2770:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2823:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2823:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2823:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2851:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2851:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2851:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2864:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2864:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2864:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2994:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2994:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2994:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3010:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3010:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3010:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3078:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3078:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3078:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3107:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3107:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3107:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3120:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3120:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3120:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3169:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3169:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3169:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3188:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3188:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3188:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3206:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3206:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3206:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3222:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3222:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3222:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3239:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3239:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3239:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3919:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:3919:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:3919:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:3922:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:3922:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4203:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4246:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4357:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4434:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4437:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4446:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5141:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5268:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5595:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
>> kernel/sched/ext.c:6509:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:6683:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6683:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6683:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1257:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression

vim +/scx_bpf_reenqueue_local___v2 +6509 kernel/sched/ext.c

  6501	
  6502	/**
  6503	 * scx_bpf_reenqueue_local - Re-enqueue tasks on a local DSQ
  6504	 *
  6505	 * Iterate over all of the tasks currently enqueued on the local DSQ of the
  6506	 * caller's CPU, and re-enqueue them in the BPF scheduler. Can be called from
  6507	 * anywhere.
  6508	 */
> 6509	__bpf_kfunc void scx_bpf_reenqueue_local___v2(void)
  6510	{
  6511		struct rq *rq;
  6512	
  6513		guard(preempt)();
  6514	
  6515		rq = this_rq();
  6516		local_set(&rq->scx.reenq_local_deferred, 1);
  6517		schedule_deferred(rq);
  6518	}
  6519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
