Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D719992C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734209544; cv=none; b=buz0rrpxkSpGZZuO3z4/WVAYKvtzLmoNuXgTggEGfyNJikYcpkaYqtXWGJCANG+iydXg3HhJEi4fhM7gEWh6It6Aq2Fg5eumPoTVm99x/7hS4kf3aj1dm7RLH4Zh9+r31bkf0E5tjb0o/lvGTSE3ldF3MGMZcp0lxgZKI85XuyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734209544; c=relaxed/simple;
	bh=SLM1B1zUo1slvaU7lsOVoufbc6Xa5Z8zHuFIpHHaGdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNlMOUrZM31QA/y8juERPGU/pGn0ojE2hxMpsemp1zcV2VC0KnDB1FDa58hhxtd7TbxzaK63jjbLXLHulyTTZV/cGU7HwM+3JK0Gu/Cd6tWJ4zKyRb/RtUfGTHCHkcB3Kmjttby1mlcHV1Zl1EbBulqUFoZybutMtjyvtmu8+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRhdVJHr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRhdVJHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734209542; x=1765745542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLM1B1zUo1slvaU7lsOVoufbc6Xa5Z8zHuFIpHHaGdQ=;
  b=FRhdVJHreYTUm30EC+5ybW4BuHmIQ8QLVckf40RkhOyeGqEIURUINaIL
   MQMdeWipApS4FwvweHgzphbpAzGj4w/rvusXGhdXS9VN4EhjKybBFJlm5
   sHcJ3RumRiWv/Q45NhbqMkd9mwpccFz7badpVchTOoebMPB+qmkUXBlqV
   CVvXjeeEblLwWejkRd8IGahtAhdsP6twfXbDH8fkTNV/60x4TPbTlLjIj
   zM4NkJKeLqBVPunwv77gussniWxWlREfROVYFQVm2L2SUMHr4tEUNkO0L
   /OV5ybcTZ5Ckga/Ozf0wd5H1FzObmiLu4l4A8tuC/31eCsmgu4aQQ2GWi
   A==;
X-CSE-ConnectionGUID: azikgS7VQ/2EaDivH8ZUgg==
X-CSE-MsgGUID: +Kr7Q/o2T82dy0s0ndpsaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34542565"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34542565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 12:52:21 -0800
X-CSE-ConnectionGUID: AioRVNxbR1G4Y7jRf2qQvQ==
X-CSE-MsgGUID: Cf4h8iOGQSOrdAiasRdjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97399859"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 12:52:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZ7a-000DDX-0M;
	Sat, 14 Dec 2024 20:52:18 +0000
Date: Sun, 15 Dec 2024 04:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7350/7391]
 kernel/sched/core.c:3976:21: warning: no previous prototype for function
 'find_exec_ctx'
Message-ID: <202412150416.OxZkbF4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   979e6f6aa3c78b92ad965d072eddc53477a84fb6
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [7350/7391] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-141-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150416.OxZkbF4L-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150416.OxZkbF4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150416.OxZkbF4L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:3976:21: warning: no previous prototype for function 'find_exec_ctx' [-Wmissing-prototypes]
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         |                     ^
   kernel/sched/core.c:3976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         | ^
         | static 
   kernel/sched/core.c:4149:42: error: no member named 'wake_cpu' in 'struct task_struct'
    4149 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                                            ~  ^
   kernel/sched/core.c:7376:11: error: call to undeclared function 'is_cpu_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^
   kernel/sched/core.c:7376:32: error: no member named 'wake_cpu' in 'struct task_struct'
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                    ~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7377:9: error: no member named 'wake_cpu' in 'struct task_struct'
    7377 |         if (p->wake_cpu == this_cpu) {
         |             ~  ^
   kernel/sched/core.c:7390:40: error: no member named 'wake_cpu' in 'struct task_struct'
    7390 |         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                            ~  ^
   kernel/sched/core.c:7391:35: error: no member named 'wake_cpu' in 'struct task_struct'
    7391 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                       ~  ^
   kernel/sched/core.c:7551:4: error: call to undeclared function 'zap_balance_callbacks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7551 |                         zap_balance_callbacks(rq);
         |                         ^
   kernel/sched/core.c:7551:4: note: did you mean '__balance_callbacks'?
   kernel/sched/core.c:5518:20: note: '__balance_callbacks' declared here
    5518 | static inline void __balance_callbacks(struct rq *rq)
         |                    ^
   2 warnings and 7 errors generated.


vim +/find_exec_ctx +3976 kernel/sched/core.c

  3971	
  3972	/*
  3973	 * Returns the unblocked task at the end of the blocked chain starting with p
  3974	 * if that chain is composed entirely of tasks enqueued on rq, or NULL otherwise.
  3975	 */
> 3976	struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
  3977	{
  3978		struct task_struct *exec_ctx, *owner;
  3979	
  3980		if (!sched_proxy_exec())
  3981			return p;
  3982	
  3983		lockdep_assert_rq_held(rq);
  3984	
  3985		for (exec_ctx = p; task_is_blocked(exec_ctx) && !task_on_cpu(rq, exec_ctx);
  3986								exec_ctx = owner) {
  3987			owner = __mutex_owner(exec_ctx->blocked_on);
  3988			if (!owner || owner == exec_ctx)
  3989				break;
  3990	
  3991			if (!task_queued_on_rq(rq, owner) || task_current_donor(rq, owner)) {
  3992				exec_ctx = NULL;
  3993				break;
  3994			}
  3995		}
  3996		return exec_ctx;
  3997	}
  3998	#else /* !CONFIG_SCHED_PROXY_EXEC */
  3999	static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
  4000	{
  4001	}
  4002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
