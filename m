Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD223400
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685634211; x=1717170211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rM5g+AGeUQlGkALrHrLqRnkd3iOXOZzjyISdeRCeLjs=;
  b=SG5QIxLuRpQMD2nRweZuNlKiGJyX4IlaYvrcsx8+mu3B+QGyaVW3/eZL
   pyBk3da8kczd+aH/HUQbQnfSC4WTOGTJc6Du7LW03dcttzCs6x+ExzydQ
   aYIiZMqTrJ2eJfxdpRWaERIeOkm7329RwO8r6cmIkeYRBbWnrjFqeOtzj
   JvejjNxelPoZBj1EqooXo1LIbptpoR3X/j74l+5yqLTwPwQH3NyvWRDit
   FnoHsVNhEfHva3K/oIhRowPHXFJMgJyGEAMEBB7oVMqSEysFTGtBW/yNG
   yFviDomPESCC3sdpLEzqwh0DwYJjuWiKBwTmcyHa8iXd3d0gEqQMOya84
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383868064"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="383868064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 08:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819868263"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="819868263"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 08:43:29 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4kSW-0002Qk-1k;
	Thu, 01 Jun 2023 15:43:28 +0000
Date: Thu, 1 Jun 2023 23:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 25/25] kernel/sched/core.c:4053:31: error:
 implicit declaration of function '__task_state_match'; did you mean
 'ttwu_state_match'?
Message-ID: <202306012319.QpaKwNob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
commit: 1fd7ac28685ef6c242cc8689f97bc7014ae82ca5 [25/25] sched: Consider task_struct::saved_state in wait_task_inactive()
config: arm-randconfig-r046-20230531 (https://download.01.org/0day-ci/archive/20230601/202306012319.QpaKwNob-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306012319.QpaKwNob-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'ttwu_state_match':
>> kernel/sched/core.c:4053:31: error: implicit declaration of function '__task_state_match'; did you mean 'ttwu_state_match'? [-Werror=implicit-function-declaration]
    4053 |         *success = !!(match = __task_state_match(p, state));
         |                               ^~~~~~~~~~~~~~~~~~
         |                               ttwu_state_match
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:6815:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    6815 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4053 kernel/sched/core.c

  4028	
  4029	/*
  4030	 * Invoked from try_to_wake_up() to check whether the task can be woken up.
  4031	 *
  4032	 * The caller holds p::pi_lock if p != current or has preemption
  4033	 * disabled when p == current.
  4034	 *
  4035	 * The rules of PREEMPT_RT saved_state:
  4036	 *
  4037	 *   The related locking code always holds p::pi_lock when updating
  4038	 *   p::saved_state, which means the code is fully serialized in both cases.
  4039	 *
  4040	 *   The lock wait and lock wakeups happen via TASK_RTLOCK_WAIT. No other
  4041	 *   bits set. This allows to distinguish all wakeup scenarios.
  4042	 */
  4043	static __always_inline
  4044	bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  4045	{
  4046		int match;
  4047	
  4048		if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)) {
  4049			WARN_ON_ONCE((state & TASK_RTLOCK_WAIT) &&
  4050				     state != TASK_RTLOCK_WAIT);
  4051		}
  4052	
> 4053		*success = !!(match = __task_state_match(p, state));
  4054	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
