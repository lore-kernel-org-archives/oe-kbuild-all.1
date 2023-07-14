Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA652AB26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 23:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689378528; x=1720914528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRjTms/3np1jHs5hUQbTc/DqPVu6CM6V3TaS9nmHgWI=;
  b=J1vWN9c7Ve3OGaBpnAVkrLhWJ27XG6lt1nxsKkTU1s8rn6HqcXq8YFRE
   6TrgVPL4X0CwNAL9di9MaHI/CpMZafOOT5WKWeQuca4pKcoOi+miJ9GRg
   tQbI6YOG4E8lCb9LFoFHPkfeSJfj5dNxVKaSjkYiZGbHBOx7XFj0069kF
   ryDAvIQIP9UjCjIFQL0/J7P9cs2eRq1eZKtzL5ikKaCiqeIXTfgeQvLpe
   oC3h9dlAWRAFQmtuf9v6/ZpG5sZFEVJDMqv9/cD4AuVMffpK7GeKrOGC3
   BLLrwTjoOr+7oUx06J+DN6Qp/fPRrEDTXx7LDJylDOc3UloARQF8t2yGA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="355542858"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="355542858"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 16:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="699867959"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="699867959"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2023 16:48:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKSWj-0007lt-2i;
	Fri, 14 Jul 2023 23:48:45 +0000
Date: Sat, 15 Jul 2023 07:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 37/48] arch/arm64/mm/gcs.c:137:5: warning: no
 previous prototype for 'arch_set_shadow_stack_status'
Message-ID: <202307150747.bDnXcsEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: ade31d872efeac42c07295034805e2965cffd2fa [37/48] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-r032-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150747.bDnXcsEw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150747.bDnXcsEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150747.bDnXcsEw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/gcs.c:137:5: warning: no previous prototype for 'arch_set_shadow_stack_status' [-Wmissing-prototypes]
     137 | int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/gcs.c:189:5: warning: no previous prototype for 'arch_get_shadow_stack_status' [-Wmissing-prototypes]
     189 | int arch_get_shadow_stack_status(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/mm/gcs.c:9:
   arch/arm64/include/asm/gcs.h: In function 'gcssttr':
>> arch/arm64/include/asm/gcs.h:38:9: warning: 'err' is used uninitialized [-Wuninitialized]
      38 |         asm volatile(
         |         ^~~
   arch/arm64/include/asm/gcs.h:35:13: note: 'err' was declared here
      35 |         int err;
         |             ^~~
--
   In file included from arch/arm64/kernel/signal.c:28:
   arch/arm64/include/asm/gcs.h: In function 'gcssttr':
>> arch/arm64/include/asm/gcs.h:38:9: warning: 'err' is used uninitialized [-Wuninitialized]
      38 |         asm volatile(
         |         ^~~
   arch/arm64/include/asm/gcs.h:35:13: note: 'err' was declared here
      35 |         int err;
         |             ^~~


vim +/arch_set_shadow_stack_status +137 arch/arm64/mm/gcs.c

899240b92ff882 Mark Brown 2023-04-05  136  
899240b92ff882 Mark Brown 2023-04-05 @137  int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
899240b92ff882 Mark Brown 2023-04-05  138  {
899240b92ff882 Mark Brown 2023-04-05  139  	unsigned long gcs, size;
899240b92ff882 Mark Brown 2023-04-05  140  
899240b92ff882 Mark Brown 2023-04-05  141  	if (!system_supports_gcs())
899240b92ff882 Mark Brown 2023-04-05  142  		return -EINVAL;
899240b92ff882 Mark Brown 2023-04-05  143  
899240b92ff882 Mark Brown 2023-04-05  144  	if (is_compat_thread(task_thread_info(task)))
899240b92ff882 Mark Brown 2023-04-05  145  		return -EINVAL;
899240b92ff882 Mark Brown 2023-04-05  146  
899240b92ff882 Mark Brown 2023-04-05  147  	/* Reject unknown flags */
899240b92ff882 Mark Brown 2023-04-05  148  	if (arg & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
899240b92ff882 Mark Brown 2023-04-05  149  		return -EINVAL;
899240b92ff882 Mark Brown 2023-04-05  150  
899240b92ff882 Mark Brown 2023-04-05  151  	/* If the task has been locked block any attempted changes */
899240b92ff882 Mark Brown 2023-04-05  152  	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_LOCK)
899240b92ff882 Mark Brown 2023-04-05  153  		return -EBUSY;
899240b92ff882 Mark Brown 2023-04-05  154  
899240b92ff882 Mark Brown 2023-04-05  155  	/* Drop flags other than lock if disabling */
899240b92ff882 Mark Brown 2023-04-05  156  	if (!(arg & PR_SHADOW_STACK_ENABLE))
899240b92ff882 Mark Brown 2023-04-05  157  		arg &= ~PR_SHADOW_STACK_LOCK;
899240b92ff882 Mark Brown 2023-04-05  158  
899240b92ff882 Mark Brown 2023-04-05  159  	/* If we are enabling GCS then make sure we have a stack */
899240b92ff882 Mark Brown 2023-04-05  160  	if (arg & PR_SHADOW_STACK_ENABLE) {
899240b92ff882 Mark Brown 2023-04-05  161  		if (!task_gcs_el0_enabled(task)) {
899240b92ff882 Mark Brown 2023-04-05  162  			/* Do not allow GCS to be reenabled */
899240b92ff882 Mark Brown 2023-04-05  163  			if (task->thread.gcs_base)
899240b92ff882 Mark Brown 2023-04-05  164  				return -EINVAL;
899240b92ff882 Mark Brown 2023-04-05  165  
899240b92ff882 Mark Brown 2023-04-05  166  			size = gcs_size(0);
899240b92ff882 Mark Brown 2023-04-05  167  			gcs = alloc_gcs(task->thread.gcspr_el0, size,
899240b92ff882 Mark Brown 2023-04-05  168  					0, 0);
899240b92ff882 Mark Brown 2023-04-05  169  			if (!gcs)
899240b92ff882 Mark Brown 2023-04-05  170  				return -ENOMEM;
899240b92ff882 Mark Brown 2023-04-05  171  
899240b92ff882 Mark Brown 2023-04-05  172  			task->thread.gcspr_el0 = gcs + size - sizeof(u64);
899240b92ff882 Mark Brown 2023-04-05  173  			task->thread.gcs_base = gcs;
899240b92ff882 Mark Brown 2023-04-05  174  			task->thread.gcs_size = size;
899240b92ff882 Mark Brown 2023-04-05  175  			if (task == current)
899240b92ff882 Mark Brown 2023-04-05  176  				write_sysreg_s(task->thread.gcspr_el0,
899240b92ff882 Mark Brown 2023-04-05  177  					       SYS_GCSPR_EL0);
899240b92ff882 Mark Brown 2023-04-05  178  
899240b92ff882 Mark Brown 2023-04-05  179  		}
899240b92ff882 Mark Brown 2023-04-05  180  	}
899240b92ff882 Mark Brown 2023-04-05  181  
899240b92ff882 Mark Brown 2023-04-05  182  	task->thread.gcs_el0_mode = arg;
899240b92ff882 Mark Brown 2023-04-05  183  	if (task == current)
899240b92ff882 Mark Brown 2023-04-05  184  		gcs_set_el0_mode(task);
899240b92ff882 Mark Brown 2023-04-05  185  
899240b92ff882 Mark Brown 2023-04-05  186  	return 0;
899240b92ff882 Mark Brown 2023-04-05  187  }
899240b92ff882 Mark Brown 2023-04-05  188  
899240b92ff882 Mark Brown 2023-04-05 @189  int arch_get_shadow_stack_status(struct task_struct *task,

:::::: The code at line 137 was first introduced by commit
:::::: 899240b92ff8825f93df3628582f518ba1784297 arm64/gcs: Implement shadow stack prctl() interface

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
