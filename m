Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE05397
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 05:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687931458; x=1719467458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uws4UiLU/HqmrWNhTxe6DSxl8znoUNnhci7BradA57s=;
  b=nsiszkFVDWDEttggWxo/bj/bsNSeEXzSHUdfVNObro80kihnxnVIH6Cd
   pi1o4pIALWrdNwV1SOEQpmlOcPA02VIgqlZ6wmv77my9bdA+Tqkossvil
   xklP5QoKqpKDuFvjw9Jb00gUnySL7sybQ+y27z01Fqxm1doJ4owRzTtSb
   +BUDTV3zPIwXtmXCIldKdZ7ef2onhUWhhAkcbzRAGP3S9IaNWqw5FG95A
   NCuVtjwNAqAJYvbPvoOxLFMD8Q0n68yg23UiJ6Fx2kKRijA2B/T+eAmwT
   pqyidovQsHRE07XlCVT3NW+w1ol1S7eptAKVp2erC3x/Mm1b3OQQOePjL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448144727"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="448144727"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 22:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="782138529"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="782138529"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2023 22:50:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEO4n-000Ct0-2R;
	Wed, 28 Jun 2023 05:50:49 +0000
Date: Wed, 28 Jun 2023 13:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 378/385] kernel/sched/alt_core.c:5986: warning:
 expecting prototype for sys_sched_getscheduler(). Prototype was for
 sys_sched_getparam() instead
Message-ID: <202306281333.IHbyG7Hy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: 8541fa12f886cf52e531f9b31d76e9c0684d5c5e [378/385] sched/alt: [Sync] cc9cb0a71725 sched, smp: Trace IPIs sent via send_call_function_single_ipi()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230628/202306281333.IHbyG7Hy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281333.IHbyG7Hy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281333.IHbyG7Hy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:129: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
   kernel/sched/alt_core.c:3643: warning: Function parameter or member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3677: warning: Excess function parameter 'rq' description in 'finish_task_switch'
   kernel/sched/alt_core.c:5918: warning: Function parameter or member 'flags' not described in 'sys_sched_setattr'
>> kernel/sched/alt_core.c:5986: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +5986 kernel/sched/alt_core.c

cedcd3e67433b34 Alfred Chen 2019-08-19  5976  
cedcd3e67433b34 Alfred Chen 2019-08-19  5977  /**
cedcd3e67433b34 Alfred Chen 2019-08-19  5978   * sys_sched_getscheduler - get the RT priority of a thread
cedcd3e67433b34 Alfred Chen 2019-08-19  5979   * @pid: the pid in question.
cedcd3e67433b34 Alfred Chen 2019-08-19  5980   * @param: structure containing the RT priority.
cedcd3e67433b34 Alfred Chen 2019-08-19  5981   *
cedcd3e67433b34 Alfred Chen 2019-08-19  5982   * Return: On success, 0 and the RT priority is in @param. Otherwise, an error
cedcd3e67433b34 Alfred Chen 2019-08-19  5983   * code.
cedcd3e67433b34 Alfred Chen 2019-08-19  5984   */
cedcd3e67433b34 Alfred Chen 2019-08-19  5985  SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
cedcd3e67433b34 Alfred Chen 2019-08-19 @5986  {
cedcd3e67433b34 Alfred Chen 2019-08-19  5987  	struct sched_param lp = { .sched_priority = 0 };
cedcd3e67433b34 Alfred Chen 2019-08-19  5988  	struct task_struct *p;
cedcd3e67433b34 Alfred Chen 2019-08-19  5989  	int retval = -EINVAL;
cedcd3e67433b34 Alfred Chen 2019-08-19  5990  
cedcd3e67433b34 Alfred Chen 2019-08-19  5991  	if (!param || pid < 0)
cedcd3e67433b34 Alfred Chen 2019-08-19  5992  		goto out_nounlock;
cedcd3e67433b34 Alfred Chen 2019-08-19  5993  
cedcd3e67433b34 Alfred Chen 2019-08-19  5994  	rcu_read_lock();
cedcd3e67433b34 Alfred Chen 2019-08-19  5995  	p = find_process_by_pid(pid);
cedcd3e67433b34 Alfred Chen 2019-08-19  5996  	retval = -ESRCH;
cedcd3e67433b34 Alfred Chen 2019-08-19  5997  	if (!p)
cedcd3e67433b34 Alfred Chen 2019-08-19  5998  		goto out_unlock;
cedcd3e67433b34 Alfred Chen 2019-08-19  5999  
cedcd3e67433b34 Alfred Chen 2019-08-19  6000  	retval = security_task_getscheduler(p);
cedcd3e67433b34 Alfred Chen 2019-08-19  6001  	if (retval)
cedcd3e67433b34 Alfred Chen 2019-08-19  6002  		goto out_unlock;
cedcd3e67433b34 Alfred Chen 2019-08-19  6003  
cedcd3e67433b34 Alfred Chen 2019-08-19  6004  	if (task_has_rt_policy(p))
cedcd3e67433b34 Alfred Chen 2019-08-19  6005  		lp.sched_priority = p->rt_priority;
cedcd3e67433b34 Alfred Chen 2019-08-19  6006  	rcu_read_unlock();
cedcd3e67433b34 Alfred Chen 2019-08-19  6007  
cedcd3e67433b34 Alfred Chen 2019-08-19  6008  	/*
cedcd3e67433b34 Alfred Chen 2019-08-19  6009  	 * This one might sleep, we cannot do it with a spinlock held ...
cedcd3e67433b34 Alfred Chen 2019-08-19  6010  	 */
cedcd3e67433b34 Alfred Chen 2019-08-19  6011  	retval = copy_to_user(param, &lp, sizeof(*param)) ? -EFAULT : 0;
cedcd3e67433b34 Alfred Chen 2019-08-19  6012  
cedcd3e67433b34 Alfred Chen 2019-08-19  6013  out_nounlock:
cedcd3e67433b34 Alfred Chen 2019-08-19  6014  	return retval;
cedcd3e67433b34 Alfred Chen 2019-08-19  6015  
cedcd3e67433b34 Alfred Chen 2019-08-19  6016  out_unlock:
cedcd3e67433b34 Alfred Chen 2019-08-19  6017  	rcu_read_unlock();
cedcd3e67433b34 Alfred Chen 2019-08-19  6018  	return retval;
cedcd3e67433b34 Alfred Chen 2019-08-19  6019  }
cedcd3e67433b34 Alfred Chen 2019-08-19  6020  

:::::: The code at line 5986 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
