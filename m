Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E37C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 03:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680493728; x=1712029728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mVhaqUI5ssgsEsasf4ulUAMfyiBKTELGeW7d3Xz5cc=;
  b=Gcg2hjF1JLmkq0508BLXg2fEILawbDj3YhSxv7kbOLH0+6tvzeCrL+mR
   vkoIIuqvMNT680kIHpNg3g8ch9lC2ecf0RWf54qJ9PNQhMDNCrQZ4vh0s
   cLEiR1CvkcOf+wW/vrF7t/1CJc/0VFqz8AXD/NfKSMpBUjXnRrdpTRBar
   MQVsPU7+zX8K8SskhH3NUY4mmewnnJM1tVBQHCkqZRpXXItgXQwyoIv2H
   0f8AjgwncDBENj1fa/28zLhzYnhvcPyX9bqpdTOLOr5kVgV0F9GPa+hHG
   3VVCMeQjUXYda12Warpk1qVnfG/dJer5ueV30Vqop46eTZSmeDmqfiVZ0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="343492562"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="343492562"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="1015553760"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="1015553760"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2023 20:48:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjBBV-000Nxw-1g;
	Mon, 03 Apr 2023 03:48:45 +0000
Date: Mon, 3 Apr 2023 11:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 303/389] kernel/sched/alt_core.c:5782: warning:
 expecting prototype for sys_sched_getscheduler(). Prototype was for
 sys_sched_getparam() instead
Message-ID: <202304031141.Z80O6cOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   0fa27a90251a61b571d62c5b7a1268c482ec6797
commit: 5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0 [303/389] sched/alt: [Sync] f5d39b020809 freezer,sched: Rewrite core freezer logic
config: x86_64-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230403/202304031141.Z80O6cOh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 5dbca3a371400fe69ad2177b7a6c9d6436dd1fa0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031141.Z80O6cOh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:114: warning: cannot understand function prototype: 'int sched_yield_type __read_mostly = 1; '
   kernel/sched/alt_core.c:3455: warning: Function parameter or member 'prev' not described in 'prepare_task_switch'
   kernel/sched/alt_core.c:3488: warning: Excess function parameter 'rq' description in 'finish_task_switch'
   kernel/sched/alt_core.c:5714: warning: Function parameter or member 'flags' not described in 'sys_sched_setattr'
>> kernel/sched/alt_core.c:5782: warning: expecting prototype for sys_sched_getscheduler(). Prototype was for sys_sched_getparam() instead


vim +5782 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  5772  
8b025fc742d760 Alfred Chen 2019-08-19  5773  /**
8b025fc742d760 Alfred Chen 2019-08-19  5774   * sys_sched_getscheduler - get the RT priority of a thread
8b025fc742d760 Alfred Chen 2019-08-19  5775   * @pid: the pid in question.
8b025fc742d760 Alfred Chen 2019-08-19  5776   * @param: structure containing the RT priority.
8b025fc742d760 Alfred Chen 2019-08-19  5777   *
8b025fc742d760 Alfred Chen 2019-08-19  5778   * Return: On success, 0 and the RT priority is in @param. Otherwise, an error
8b025fc742d760 Alfred Chen 2019-08-19  5779   * code.
8b025fc742d760 Alfred Chen 2019-08-19  5780   */
8b025fc742d760 Alfred Chen 2019-08-19  5781  SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
8b025fc742d760 Alfred Chen 2019-08-19 @5782  {
8b025fc742d760 Alfred Chen 2019-08-19  5783  	struct sched_param lp = { .sched_priority = 0 };
8b025fc742d760 Alfred Chen 2019-08-19  5784  	struct task_struct *p;
8b025fc742d760 Alfred Chen 2019-08-19  5785  	int retval = -EINVAL;
8b025fc742d760 Alfred Chen 2019-08-19  5786  
8b025fc742d760 Alfred Chen 2019-08-19  5787  	if (!param || pid < 0)
8b025fc742d760 Alfred Chen 2019-08-19  5788  		goto out_nounlock;
8b025fc742d760 Alfred Chen 2019-08-19  5789  
8b025fc742d760 Alfred Chen 2019-08-19  5790  	rcu_read_lock();
8b025fc742d760 Alfred Chen 2019-08-19  5791  	p = find_process_by_pid(pid);
8b025fc742d760 Alfred Chen 2019-08-19  5792  	retval = -ESRCH;
8b025fc742d760 Alfred Chen 2019-08-19  5793  	if (!p)
8b025fc742d760 Alfred Chen 2019-08-19  5794  		goto out_unlock;
8b025fc742d760 Alfred Chen 2019-08-19  5795  
8b025fc742d760 Alfred Chen 2019-08-19  5796  	retval = security_task_getscheduler(p);
8b025fc742d760 Alfred Chen 2019-08-19  5797  	if (retval)
8b025fc742d760 Alfred Chen 2019-08-19  5798  		goto out_unlock;
8b025fc742d760 Alfred Chen 2019-08-19  5799  
8b025fc742d760 Alfred Chen 2019-08-19  5800  	if (task_has_rt_policy(p))
8b025fc742d760 Alfred Chen 2019-08-19  5801  		lp.sched_priority = p->rt_priority;
8b025fc742d760 Alfred Chen 2019-08-19  5802  	rcu_read_unlock();
8b025fc742d760 Alfred Chen 2019-08-19  5803  
8b025fc742d760 Alfred Chen 2019-08-19  5804  	/*
8b025fc742d760 Alfred Chen 2019-08-19  5805  	 * This one might sleep, we cannot do it with a spinlock held ...
8b025fc742d760 Alfred Chen 2019-08-19  5806  	 */
8b025fc742d760 Alfred Chen 2019-08-19  5807  	retval = copy_to_user(param, &lp, sizeof(*param)) ? -EFAULT : 0;
8b025fc742d760 Alfred Chen 2019-08-19  5808  
8b025fc742d760 Alfred Chen 2019-08-19  5809  out_nounlock:
8b025fc742d760 Alfred Chen 2019-08-19  5810  	return retval;
8b025fc742d760 Alfred Chen 2019-08-19  5811  
8b025fc742d760 Alfred Chen 2019-08-19  5812  out_unlock:
8b025fc742d760 Alfred Chen 2019-08-19  5813  	rcu_read_unlock();
8b025fc742d760 Alfred Chen 2019-08-19  5814  	return retval;
8b025fc742d760 Alfred Chen 2019-08-19  5815  }
8b025fc742d760 Alfred Chen 2019-08-19  5816  

:::::: The code at line 5782 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
