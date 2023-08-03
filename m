Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704157F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 00:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691023776; x=1722559776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pr6eHaHkwVpOORA0t1R8o4NNQcT/jbDeN8bq+LujSQQ=;
  b=d0aFXYZUZHIS9rjoVT4QOSFokTY/hWMXWn2bwvhtjdba1HE+8B/wFfzb
   I6Rz4DRPsAiF+68Nv8ajrHhXM8dMpryy+ZokRmwePZZMZVT6GhP+6QmSE
   jGZua0pDXfihBw494rYqhWF27qxJT9e+35QE8QwuIWtio6PUp292qvYbe
   ov74XQEOvoRzWqr++T3MyT6PuJ02Al/DGracnDuJXzosTbsGSdffJkwYZ
   Ul0M534Mc5RU0lPqWaqel5Y5TsUBm7cgG4ytimWrQD5JNcvRM5k9hzj8J
   6opR55qVIEestY+2hqRgUx9o5WQfdSQ5KU0ZT9u16NpC3h9BlRxz2BiwT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369739943"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="369739943"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 17:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853047689"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853047689"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 17:49:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRMWz-0001c7-2Y;
	Thu, 03 Aug 2023 00:49:33 +0000
Date: Thu, 3 Aug 2023 08:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 378/386] kernel/sched/alt_core.c:5986: warning:
 expecting prototype for sys_sched_getscheduler(). Prototype was for
 sys_sched_getparam() instead
Message-ID: <202308030845.XFUCM9Ns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: 8541fa12f886cf52e531f9b31d76e9c0684d5c5e [378/386] sched/alt: [Sync] cc9cb0a71725 sched, smp: Trace IPIs sent via send_call_function_single_ipi()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308030845.XFUCM9Ns-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030845.XFUCM9Ns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030845.XFUCM9Ns-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:129: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
   kernel/sched/alt_core.c:3643: warning: Function parameter or member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3677: warning: Excess function parameter 'rq' description in 'finish_task_switch'
   kernel/sched/alt_core.c:5918: warning: Function parameter or member 'flags' not described in 'sys_sched_setattr'
>> kernel/sched/alt_core.c:5986: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +5986 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  5976  
cedcd3e67433b3 Alfred Chen 2019-08-19  5977  /**
cedcd3e67433b3 Alfred Chen 2019-08-19  5978   * sys_sched_getscheduler - get the RT priority of a thread
cedcd3e67433b3 Alfred Chen 2019-08-19  5979   * @pid: the pid in question.
cedcd3e67433b3 Alfred Chen 2019-08-19  5980   * @param: structure containing the RT priority.
cedcd3e67433b3 Alfred Chen 2019-08-19  5981   *
cedcd3e67433b3 Alfred Chen 2019-08-19  5982   * Return: On success, 0 and the RT priority is in @param. Otherwise, an error
cedcd3e67433b3 Alfred Chen 2019-08-19  5983   * code.
cedcd3e67433b3 Alfred Chen 2019-08-19  5984   */
cedcd3e67433b3 Alfred Chen 2019-08-19  5985  SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
cedcd3e67433b3 Alfred Chen 2019-08-19 @5986  {
cedcd3e67433b3 Alfred Chen 2019-08-19  5987  	struct sched_param lp = { .sched_priority = 0 };
cedcd3e67433b3 Alfred Chen 2019-08-19  5988  	struct task_struct *p;
cedcd3e67433b3 Alfred Chen 2019-08-19  5989  	int retval = -EINVAL;
cedcd3e67433b3 Alfred Chen 2019-08-19  5990  
cedcd3e67433b3 Alfred Chen 2019-08-19  5991  	if (!param || pid < 0)
cedcd3e67433b3 Alfred Chen 2019-08-19  5992  		goto out_nounlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  5993  
cedcd3e67433b3 Alfred Chen 2019-08-19  5994  	rcu_read_lock();
cedcd3e67433b3 Alfred Chen 2019-08-19  5995  	p = find_process_by_pid(pid);
cedcd3e67433b3 Alfred Chen 2019-08-19  5996  	retval = -ESRCH;
cedcd3e67433b3 Alfred Chen 2019-08-19  5997  	if (!p)
cedcd3e67433b3 Alfred Chen 2019-08-19  5998  		goto out_unlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  5999  
cedcd3e67433b3 Alfred Chen 2019-08-19  6000  	retval = security_task_getscheduler(p);
cedcd3e67433b3 Alfred Chen 2019-08-19  6001  	if (retval)
cedcd3e67433b3 Alfred Chen 2019-08-19  6002  		goto out_unlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  6003  
cedcd3e67433b3 Alfred Chen 2019-08-19  6004  	if (task_has_rt_policy(p))
cedcd3e67433b3 Alfred Chen 2019-08-19  6005  		lp.sched_priority = p->rt_priority;
cedcd3e67433b3 Alfred Chen 2019-08-19  6006  	rcu_read_unlock();
cedcd3e67433b3 Alfred Chen 2019-08-19  6007  
cedcd3e67433b3 Alfred Chen 2019-08-19  6008  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  6009  	 * This one might sleep, we cannot do it with a spinlock held ...
cedcd3e67433b3 Alfred Chen 2019-08-19  6010  	 */
cedcd3e67433b3 Alfred Chen 2019-08-19  6011  	retval = copy_to_user(param, &lp, sizeof(*param)) ? -EFAULT : 0;
cedcd3e67433b3 Alfred Chen 2019-08-19  6012  
cedcd3e67433b3 Alfred Chen 2019-08-19  6013  out_nounlock:
cedcd3e67433b3 Alfred Chen 2019-08-19  6014  	return retval;
cedcd3e67433b3 Alfred Chen 2019-08-19  6015  
cedcd3e67433b3 Alfred Chen 2019-08-19  6016  out_unlock:
cedcd3e67433b3 Alfred Chen 2019-08-19  6017  	rcu_read_unlock();
cedcd3e67433b3 Alfred Chen 2019-08-19  6018  	return retval;
cedcd3e67433b3 Alfred Chen 2019-08-19  6019  }
cedcd3e67433b3 Alfred Chen 2019-08-19  6020  

:::::: The code at line 5986 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
