Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1F243785D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625428; cv=none; b=n+ZwMqDYwn4vqCL23dBsCux8/yBSh6J2aNMaG8fhL+NsMW6dSMEhVEfL2Jj9I2MuNdwZe1S3roA7LSE3ovwtTlosn6xlHvwqTwhN4M0MC+mREeovydu4qZ+mZ/nnm9WPZBqG1OMRU9CrW4fcxt7LbM/mWelVbKbNa2eZyrXhUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625428; c=relaxed/simple;
	bh=0yBc9YVOte8wHbMQYjf+7VnPOETJqomJwtEOZTb88Os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QqYKtoyIgRgr6vzkcmHaPZNtefIxIiOb9Yx4ZqBJe8WZYcgws7+CA5rF2TA8dEMbv0nIY2dEFec+/s9IqiMWPjOvHcwveCP9ampv13X32lVxwCj8HC073Ogc+DuJ7bO94v8gAUz6cFQSjuPSiOzD/VQ5ivNm2P4rmf8jNiWfct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvhuiRbp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvhuiRbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791625426; x=1823161426;
  h=date:from:to:cc:subject:message-id;
  bh=0yBc9YVOte8wHbMQYjf+7VnPOETJqomJwtEOZTb88Os=;
  b=TvhuiRbp5gndhBCMDjlTfJzRJzYVbHFxRD5hkotZl/NT3pchnezg19Ha
   T8Sol81hCQbBe223PsRS1ovrvp6zQfNR+1zpNDSXZ8NZyJK5+SF2p4Ri9
   2lnTGLSrNrlU0N2bxduVhCZPgDfeZpuklPDfxETYx7tru0c+5rnd9KrJM
   Z2TvzjEDvKDPLptmM4aPQfyQSR7UfUGkXNRKD7eRDfsBeOuHu8trdgK+f
   itasdgiLH5H2NLobVSGRIWpyR2MQzGUm+WAv6yJmrLPaU12cxgktLkspP
   ZNzGe+oLzlPPqAHxtOBrPkfMch55qwOpnr0y24wE4pgkcJxzZqWIRp+lF
   Q==;
X-CSE-ConnectionGUID: gW7xF3+RT/6MalLCLBygfA==
X-CSE-MsgGUID: MWXyNPNNRFyzMUlKkoQIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="318122"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="318122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 02:43:46 -0700
X-CSE-ConnectionGUID: 34j9llXQQ7eGY2x95dbu8w==
X-CSE-MsgGUID: OgI7m6icQimXtn8ck9740w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="509947"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2026 02:43:45 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFTcD-000000008ld-4ByB;
	Sat, 10 Oct 2026 09:43:42 +0000
Date: Sat, 10 Oct 2026 11:43:26 +0200
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 20/22] kernel/rcu/tree.c:2772:59: error:
 'struct task_struct' has no member named 'rcu_node_entry'
Message-ID: <202610101152.pcWaETEm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   96aaeadd587ee111e53032f63b93e54a8b476483
commit: 2c4925768252397b03d47704f70891ce2b47e774 [20/22] EXP rcu: Send resched_cpu() to idle CPUs having preempted RCU readers
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261010/202610101152.pcWaETEm-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101152.pcWaETEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101152.pcWaETEm-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/tree.c: In function 'fqs_slow_task':
>> kernel/rcu/tree.c:2772:59: error: 'struct task_struct' has no member named 'rcu_node_entry'
    2772 |         if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
         |                                                           ^~
   In file included from ./include/linux/container_of.h:5,
                    from ./include/linux/kernel.h:22,
                    from kernel/rcu/tree.c:21:
   kernel/rcu/tree.c: In function 'force_qs_rnp':
>> ./include/linux/container_of.h:8:47: error: 'struct task_struct' has no member named 'rcu_node_entry'
       8 | #define typeof_member(T, m)     typeof(((T*)0)->m)
         |                                               ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   ./include/linux/container_of.h:20:43: note: in expansion of macro 'typeof_member'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                                           ^~~~~~~~~~~~~
   kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                     ^~~~~~~~~~~~
   ././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                     ^~~~~~~~~~~~
   In file included from ./include/uapi/linux/posix_types.h:5,
                    from ./include/uapi/linux/types.h:14,
                    from ./include/linux/types.h:5,
                    from kernel/rcu/tree.c:20:
>> ./include/linux/stddef.h:16:33: error: 'struct task_struct' has no member named 'rcu_node_entry'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:23:34: note: in expansion of macro 'offsetof'
      23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
         |                                  ^~~~~~~~
   kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                     ^~~~~~~~~~~~


vim +2772 kernel/rcu/tree.c

  2757	
  2758	// Check to see if a task holding up the current grace period is
  2759	// preempted but runnable on an idle CPU.  This involves an
  2760	// rcu_node structure, a pointer to which is passed to fqs_slow_task()
  2761	// as a callback from task_call_func().  The fqs_slow_task()
  2762	// function returns the CPU to pass to resched_cpu() or -1 if
  2763	// there is no need for an additional call to resched_cpu().
  2764	static int fqs_slow_task(struct task_struct *t, void *arg)
  2765	{
  2766		int cpu;
  2767		struct rcu_node *rnp = arg;
  2768		struct task_struct *tc;
  2769	
  2770		// If the task is running or is no longer blocking the current
  2771		// grace period, there should be no call to resched_cpu().
> 2772		if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
  2773			return -1;
  2774	
  2775		// If the target CPU is not idle, there should be no call to
  2776		// resched_cpu().
  2777		WARN_ON_ONCE(1); // @@@
  2778		cpu = task_cpu(t);
  2779		tc = rcu_cpu_curr(cpu);
  2780		if (!is_idle_task(tc))
  2781			return -1;
  2782	
  2783		// But the target CPU is idle, so resched_cpu() it is!
  2784		WARN_ON_ONCE(1); // @@@
  2785		return cpu;
  2786	}
  2787	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
