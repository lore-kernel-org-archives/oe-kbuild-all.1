Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C45C3D8907
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957969; cv=none; b=nPpafNRGxlRvtTj/Q+t5BmkTdwtl16XMGnXtsFj0fXhPTq5HNewfFZgkY8AKinA/0MZP1hxKF/EwWnVf89kxbOkG4MZ7zrYVLcrj9mkDKaL7fZcUsG29oIzn2zRNZTJmiAmTXQlGm0FY2wa+aJ99sXyHPt4qoT1opp3E1KfuvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957969; c=relaxed/simple;
	bh=BewL16Hf31GJmYUrQgoWivSomAUh85GUJ6vpDGdKzoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LROEbQa6FtHaOBcizDsWD6VOgvONbvUW2keSAm0VYUgqiutE7EZ6dXR6iplDHdP1Vmvmb1VA7CSG2IF+shmrljtR4H2F5ah5DKpd89l3d1iIROCFppRQSJt7E/HRyLhLemqXMm2/mHx9dc+i0M1ZMReQTFrBwGq6e5juqvdcZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXE25Ptn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXE25Ptn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774957968; x=1806493968;
  h=date:from:to:cc:subject:message-id;
  bh=BewL16Hf31GJmYUrQgoWivSomAUh85GUJ6vpDGdKzoo=;
  b=GXE25PtnqkCyw5+uCgk8ImsgondMarRQ1XwJJSMfPTwpE1j2ZQrImYgk
   ZauD3XQzTzzGM7+v/b3IYK23RzkVERhDQQ7Zh+wFGKO6LEtqtYp8T12bO
   v7kLhND84UfMsTZRs6GttSWmVIyzD4g24a89beVEACPeCq9ru4QVAxDP2
   EyI1tyaN9QEe7xFw13hKmP1aXYPkkYUOXRCD6BU1Z/+C6xupW5fMXzEtR
   +4uWWIxuoJ3t1oi9c023RuN6u6K86ZkswXOn1K44k9k4B7wKy3gLjVVzi
   optQmQwe/yYV+k3hlh9O6k4bmKSLU5SaN13FcyMGhwpF2hUzS9kZJucbS
   g==;
X-CSE-ConnectionGUID: FuuoqghhRMWYpVizOV+PfQ==
X-CSE-MsgGUID: oyHM7tYnTnmzsouuGKCong==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79568403"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79568403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:52:48 -0700
X-CSE-ConnectionGUID: xsk/ptiWQ/WDVQLHhXE3iA==
X-CSE-MsgGUID: VVZBgx2cRUm0x150ti9xqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219700077"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Mar 2026 04:52:46 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7XeF-000000002aR-2UB1;
	Tue, 31 Mar 2026 11:52:43 +0000
Date: Tue, 31 Mar 2026 19:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-07 0/1]
 kernel/sched/core.c:3976:21: warning: no previous prototype for
 'find_exec_ctx'
Message-ID: <202603311948.E25hr2Gz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Connor,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-07
head:   4f3d5d464c04efbd6bec02d698dd527d03f65a36
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [0/1] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-013-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311948.E25hr2Gz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311948.E25hr2Gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311948.E25hr2Gz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:3976:21: warning: no previous prototype for 'find_exec_ctx' [-Wmissing-prototypes]
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         |                     ^~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_runnable':
   kernel/sched/core.c:4149:63: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    4149 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                                               ^~~~~~~~
         |                                                               wake_q
   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:280,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'find_proxy_task':
   kernel/sched/core.c:7376:18: error: implicit declaration of function 'is_cpu_allowed'; did you mean 'cpuset_cpus_allowed'? [-Wimplicit-function-declaration]
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7376:39: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                       ^~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7377:16: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7377 |         if (p->wake_cpu == this_cpu) {
         |                ^~~~~~~~
         |                wake_q
   kernel/sched/core.c:7390:47: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7390 |         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                               ^~~~~~~~
         |                                               wake_q
   kernel/sched/core.c:7391:42: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7391 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                          ^~~~~~~~
         |                                          wake_q
   kernel/sched/core.c: In function '__schedule':
   kernel/sched/core.c:7551:25: error: implicit declaration of function 'zap_balance_callbacks'; did you mean 'balance_callbacks'? [-Wimplicit-function-declaration]
    7551 |                         zap_balance_callbacks(rq);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         balance_callbacks


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
