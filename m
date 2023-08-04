Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C211FC8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691126227; x=1722662227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hw4XKeY10yU18US9DXVgpUAtf7timoiWPEtwNWqBVHs=;
  b=Y3P1W4rDi9IiWpoE/9maSReQuQC71cX6k7R+wNJ4pqHXDh6Vl/jxGJGv
   oJWclG/NwXIrvgIvVLSLG5LzutdmMoW1Z71dnOjkEBWG+a6Cmo6Jt3rb4
   cCrI/vPeG4YcVKYC2KzXa8DgD2m5liMCPePqMTwCuzXv3uPjhhLt0vEgL
   btMqTLwa+pa8Fy6e+ENWneZNXMcj9NxU3m52HRAKTmnrGUUJ0WrZ+3gLr
   SeomM5St9bH3GH9uC79gqT63T7Vdo4B5IK3fRlkyDgYn9lpZrUUo35tyO
   aXkCwL5rDway/MNRzIzvTZ2lcHBMkrtzyk/slA0Z3NhIVslWOE//54BZZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373715099"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373715099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 22:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723494953"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="723494953"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Aug 2023 22:17:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRnBQ-0002dR-1v;
	Fri, 04 Aug 2023 05:17:04 +0000
Date: Fri, 4 Aug 2023 13:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 364/387] kernel/sched/alt_core.c:5977: warning:
 expecting prototype for sys_sched_getscheduler(). Prototype was for
 sys_sched_getparam() instead
Message-ID: <202308041214.ufBM4fE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: 1ccb501e2339eb0caf90af913c9eeebd37e6aa3c [364/387] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041214.ufBM4fE5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041214.ufBM4fE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041214.ufBM4fE5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:126: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
   kernel/sched/alt_core.c:3637: warning: Function parameter or member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3670: warning: Excess function parameter 'rq' description in 'finish_task_switch'
   kernel/sched/alt_core.c:5909: warning: Function parameter or member 'flags' not described in 'sys_sched_setattr'
>> kernel/sched/alt_core.c:5977: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +5977 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  5967  
cedcd3e67433b3 Alfred Chen 2019-08-19  5968  /**
cedcd3e67433b3 Alfred Chen 2019-08-19  5969   * sys_sched_getscheduler - get the RT priority of a thread
cedcd3e67433b3 Alfred Chen 2019-08-19  5970   * @pid: the pid in question.
cedcd3e67433b3 Alfred Chen 2019-08-19  5971   * @param: structure containing the RT priority.
cedcd3e67433b3 Alfred Chen 2019-08-19  5972   *
cedcd3e67433b3 Alfred Chen 2019-08-19  5973   * Return: On success, 0 and the RT priority is in @param. Otherwise, an error
cedcd3e67433b3 Alfred Chen 2019-08-19  5974   * code.
cedcd3e67433b3 Alfred Chen 2019-08-19  5975   */
cedcd3e67433b3 Alfred Chen 2019-08-19  5976  SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
cedcd3e67433b3 Alfred Chen 2019-08-19 @5977  {
cedcd3e67433b3 Alfred Chen 2019-08-19  5978  	struct sched_param lp = { .sched_priority = 0 };
cedcd3e67433b3 Alfred Chen 2019-08-19  5979  	struct task_struct *p;
cedcd3e67433b3 Alfred Chen 2019-08-19  5980  	int retval = -EINVAL;
cedcd3e67433b3 Alfred Chen 2019-08-19  5981  
cedcd3e67433b3 Alfred Chen 2019-08-19  5982  	if (!param || pid < 0)
cedcd3e67433b3 Alfred Chen 2019-08-19  5983  		goto out_nounlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  5984  
cedcd3e67433b3 Alfred Chen 2019-08-19  5985  	rcu_read_lock();
cedcd3e67433b3 Alfred Chen 2019-08-19  5986  	p = find_process_by_pid(pid);
cedcd3e67433b3 Alfred Chen 2019-08-19  5987  	retval = -ESRCH;
cedcd3e67433b3 Alfred Chen 2019-08-19  5988  	if (!p)
cedcd3e67433b3 Alfred Chen 2019-08-19  5989  		goto out_unlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  5990  
cedcd3e67433b3 Alfred Chen 2019-08-19  5991  	retval = security_task_getscheduler(p);
cedcd3e67433b3 Alfred Chen 2019-08-19  5992  	if (retval)
cedcd3e67433b3 Alfred Chen 2019-08-19  5993  		goto out_unlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  5994  
cedcd3e67433b3 Alfred Chen 2019-08-19  5995  	if (task_has_rt_policy(p))
cedcd3e67433b3 Alfred Chen 2019-08-19  5996  		lp.sched_priority = p->rt_priority;
cedcd3e67433b3 Alfred Chen 2019-08-19  5997  	rcu_read_unlock();
cedcd3e67433b3 Alfred Chen 2019-08-19  5998  
cedcd3e67433b3 Alfred Chen 2019-08-19  5999  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  6000  	 * This one might sleep, we cannot do it with a spinlock held ...
cedcd3e67433b3 Alfred Chen 2019-08-19  6001  	 */
cedcd3e67433b3 Alfred Chen 2019-08-19  6002  	retval = copy_to_user(param, &lp, sizeof(*param)) ? -EFAULT : 0;
cedcd3e67433b3 Alfred Chen 2019-08-19  6003  
cedcd3e67433b3 Alfred Chen 2019-08-19  6004  out_nounlock:
cedcd3e67433b3 Alfred Chen 2019-08-19  6005  	return retval;
cedcd3e67433b3 Alfred Chen 2019-08-19  6006  
cedcd3e67433b3 Alfred Chen 2019-08-19  6007  out_unlock:
cedcd3e67433b3 Alfred Chen 2019-08-19  6008  	rcu_read_unlock();
cedcd3e67433b3 Alfred Chen 2019-08-19  6009  	return retval;
cedcd3e67433b3 Alfred Chen 2019-08-19  6010  }
cedcd3e67433b3 Alfred Chen 2019-08-19  6011  

:::::: The code at line 5977 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
