Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38DB10F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676181280; x=1707717280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgskxJATm0uRfbJMEDEFGMK2TJCeQiD2DO6F1XUUibM=;
  b=ZyFz8ta9g9zsDFhh/Dkc2Zlih9HJVTx+pO89Q4WPgqI1blZL4SVm7szk
   RdvbGOazuujYzAgJmlSebZei55hlwFzhPZ+XfF4ghyYVwvjmYW//vJtsB
   l8ZZMRw6jttpc3SNbK15UXWsPsVHVfCwGj6ZD9AIdeEZENXGDmQIFsz4y
   CfnOTmzB94SHroc+lGt9uF5l238G5Xvp7qcOGHqosoQGvDtJhO3Pjqap2
   Ki6KuOQw4qBXD8K0UR6XXBcvpA3dzAIAObx6KBSXA1wPYozUw3MkXkZjw
   rfMQ4NKFC5Kx9oA1w/bspxZrI+bEsy/OPE54I5wRiQj5xnPV87YxB6OsL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="329319393"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329319393"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 21:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="661810963"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661810963"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Feb 2023 21:54:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR5Jt-00075J-1z;
	Sun, 12 Feb 2023 05:54:37 +0000
Date: Sun, 12 Feb 2023 13:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc-test 304/375] kernel/sched/alt_core.c:5782: warning:
 expecting prototype for sys_sched_getscheduler(). Prototype was for
 sys_sched_getparam() instead
Message-ID: <202302121326.h3JeRmrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc-test
head:   543613647f11584e775c4eb8c5b784576e72e9c6
commit: 8007288fb3275f05b7da3fe81f5bd633bc8bf66a [304/375] sched/alt: [Sync] bb4479994945 sched, drivers: Remove max param from effective_cpu_util()/sched_cpu_util()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230212/202302121326.h3JeRmrv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/8007288fb3275f05b7da3fe81f5bd633bc8bf66a
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc-test
        git checkout 8007288fb3275f05b7da3fe81f5bd633bc8bf66a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121326.h3JeRmrv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:114: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
   kernel/sched/alt_core.c:3455: warning: Function parameter or member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3488: warning: Excess function parameter 'rq' description in 'finish_task_switch'
   kernel/sched/alt_core.c:5714: warning: Function parameter or member 'flags' not described in 'sys_sched_setattr'
>> kernel/sched/alt_core.c:5782: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +5782 kernel/sched/alt_core.c

570d4c77574657d Alfred Chen 2019-08-19  5772  
570d4c77574657d Alfred Chen 2019-08-19  5773  /**
570d4c77574657d Alfred Chen 2019-08-19  5774   * sys_sched_getscheduler - get the RT priority of a thread
570d4c77574657d Alfred Chen 2019-08-19  5775   * @pid: the pid in question.
570d4c77574657d Alfred Chen 2019-08-19  5776   * @param: structure containing the RT priority.
570d4c77574657d Alfred Chen 2019-08-19  5777   *
570d4c77574657d Alfred Chen 2019-08-19  5778   * Return: On success, 0 and the RT priority is in @param. Otherwise, an error
570d4c77574657d Alfred Chen 2019-08-19  5779   * code.
570d4c77574657d Alfred Chen 2019-08-19  5780   */
570d4c77574657d Alfred Chen 2019-08-19  5781  SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
570d4c77574657d Alfred Chen 2019-08-19 @5782  {
570d4c77574657d Alfred Chen 2019-08-19  5783  	struct sched_param lp = { .sched_priority = 0 };
570d4c77574657d Alfred Chen 2019-08-19  5784  	struct task_struct *p;
570d4c77574657d Alfred Chen 2019-08-19  5785  	int retval = -EINVAL;
570d4c77574657d Alfred Chen 2019-08-19  5786  
570d4c77574657d Alfred Chen 2019-08-19  5787  	if (!param || pid < 0)
570d4c77574657d Alfred Chen 2019-08-19  5788  		goto out_nounlock;
570d4c77574657d Alfred Chen 2019-08-19  5789  
570d4c77574657d Alfred Chen 2019-08-19  5790  	rcu_read_lock();
570d4c77574657d Alfred Chen 2019-08-19  5791  	p = find_process_by_pid(pid);
570d4c77574657d Alfred Chen 2019-08-19  5792  	retval = -ESRCH;
570d4c77574657d Alfred Chen 2019-08-19  5793  	if (!p)
570d4c77574657d Alfred Chen 2019-08-19  5794  		goto out_unlock;
570d4c77574657d Alfred Chen 2019-08-19  5795  
570d4c77574657d Alfred Chen 2019-08-19  5796  	retval = security_task_getscheduler(p);
570d4c77574657d Alfred Chen 2019-08-19  5797  	if (retval)
570d4c77574657d Alfred Chen 2019-08-19  5798  		goto out_unlock;
570d4c77574657d Alfred Chen 2019-08-19  5799  
570d4c77574657d Alfred Chen 2019-08-19  5800  	if (task_has_rt_policy(p))
570d4c77574657d Alfred Chen 2019-08-19  5801  		lp.sched_priority = p->rt_priority;
570d4c77574657d Alfred Chen 2019-08-19  5802  	rcu_read_unlock();
570d4c77574657d Alfred Chen 2019-08-19  5803  
570d4c77574657d Alfred Chen 2019-08-19  5804  	/*
570d4c77574657d Alfred Chen 2019-08-19  5805  	 * This one might sleep, we cannot do it with a spinlock held ...
570d4c77574657d Alfred Chen 2019-08-19  5806  	 */
570d4c77574657d Alfred Chen 2019-08-19  5807  	retval = copy_to_user(param, &lp, sizeof(*param)) ? -EFAULT : 0;
570d4c77574657d Alfred Chen 2019-08-19  5808  
570d4c77574657d Alfred Chen 2019-08-19  5809  out_nounlock:
570d4c77574657d Alfred Chen 2019-08-19  5810  	return retval;
570d4c77574657d Alfred Chen 2019-08-19  5811  
570d4c77574657d Alfred Chen 2019-08-19  5812  out_unlock:
570d4c77574657d Alfred Chen 2019-08-19  5813  	rcu_read_unlock();
570d4c77574657d Alfred Chen 2019-08-19  5814  	return retval;
570d4c77574657d Alfred Chen 2019-08-19  5815  }
570d4c77574657d Alfred Chen 2019-08-19  5816  

:::::: The code at line 5782 was first introduced by commit
:::::: 570d4c77574657dc1df2ca8c54e6b4407de76fd5 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
