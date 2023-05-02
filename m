Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8863B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 03:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682999718; x=1714535718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GB+FOisZH0321k/P+eCQ49qk7kO3w/2IVHEW24jRUSo=;
  b=ZY40IkwU18+JWLmIOtFL44O4u+501ahyS76UmbOef5AMidzObtM33JoI
   rqm/JxT3VEX2A/EL86rDJNzMTenF8oSa/XHw4Bk/DBrJcbQdmAEcjzbxh
   uDl7D/qVyl7evp8Qr5y51DEE9TJBP6VWnOw7a2uFZfLelmlTJOX1OCl0I
   AvuNIbFs5d1PW3ntG2MXpNkvhUfVXhNcC4WA/knieK7t92jYGmjh61g12
   nf269tO3KIf4k3Zs8z7N+ZYS1euaS/PHgy89tFom57hc6byZSQ8dD0zm8
   9lSz4wEo3JCXsW3OKjJQ7jtSj57pDcSAfm+DDo4DZPSQl3EF2UYTl15oM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="351276456"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="351276456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 20:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="785513522"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="785513522"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 May 2023 20:55:16 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pth6c-0000oo-21;
	Tue, 02 May 2023 03:55:10 +0000
Date: Tue, 2 May 2023 11:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 304/395] kernel/sched/alt_core.c:1004:6: sparse:
 sparse: symbol 'select_nohz_load_balancer' was not declared. Should it be
 static?
Message-ID: <202305021119.g89DEtyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   6a80d978aa1f981122f7478fedea389aa9475f9d
commit: 1889e596c5647b4e2c36420ecb4dc4f00ed4edcd [304/395] sched/alt: [Sync] bb4479994945 sched, drivers: Remove max param from effective_cpu_util()/sched_cpu_util()
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230502/202305021119.g89DEtyo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/zen-kernel/zen-kernel/commit/1889e596c5647b4e2c36420ecb4dc4f00ed4edcd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 1889e596c5647b4e2c36420ecb4dc4f00ed4edcd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021119.g89DEtyo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:968:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:968:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:968:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:1004:6: sparse: sparse: symbol 'select_nohz_load_balancer' was not declared. Should it be static?
   kernel/sched/alt_core.c:1712:45: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1712:45: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1712:45: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:2460:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2460:28: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2460:28: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:6859:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6859:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:6859:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:3813:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:3813:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:3813:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4069:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4069:14: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4069:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4525:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4525:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4525:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5059:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5059:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5059:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5209:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5209:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5209:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:6712:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6712:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:6712:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:495:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:514:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1670:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1670:38: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:1670:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1116:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1116:37: sparse:    struct task_struct [noderef] __rcu *

vim +/select_nohz_load_balancer +1004 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  1003  
56e0358e1d4dc0 Alfred Chen 2020-08-07 @1004  void select_nohz_load_balancer(int stop_tick) {}
8b025fc742d760 Alfred Chen 2019-08-19  1005  

:::::: The code at line 1004 was first introduced by commit
:::::: 56e0358e1d4dc0a857a1dabb35776bebf9862a7f sched/alt: Fix/Enabled nohz_csd_func(), but not used.

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
