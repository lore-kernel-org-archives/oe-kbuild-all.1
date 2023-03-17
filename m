Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1B2C9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679094265; x=1710630265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0tab3kzu5SQcbuhrOA0fGvK/KacuPOeN5rbFxHe09Q=;
  b=E1oOZR98EIOUYw07PDjK2IihTXR8x/0BDD2eKvMOY+ZvzEimSq8vjw0v
   lwaCoRQtJoKkuDjCDFYT7YMJPt8pa11IJuy3b3IUMcCHRkzpi3KI0JhSM
   SZjzOTZPBaZUN5mnnPP4bCHKvYs8Hg9Om5RpfKmPBO51ua5OF5yZHTofe
   FXHL7ae2OXbZdLAQ9Z8Gy+m6qIKpA51J41eK+Nhvgj8IQUPAQgU6R3KZH
   ufMapUYxDw5x97D07RcUzIES1TW57ZIryazIH34QKlIQRi2BRG5dwuc+t
   V9KYKg0kYiWL16f1zN/c5hCPvsmoComzLxGYEAK9afzw2+elym4eneEuw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335875342"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="335875342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 16:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="710650997"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="710650997"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 16:04:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdJ7W-0009di-1K;
	Fri, 17 Mar 2023 23:04:22 +0000
Date: Sat, 18 Mar 2023 07:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 5/8] kernel/cgroup/cgroup.c:2435:9:
 error: implicit declaration of function 'cpus_read_lock'; did you mean
 'cpuset_read_lock'?
Message-ID: <202303180740.i53CuGfE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   74dbc56ffbac4b4912e598d245eaf4b0a6db638f
commit: 8515ceedf9e1709310184254bfea56eca6bf8617 [5/8] static_call: Remove static_call.h dependency on cpu.h
config: riscv-randconfig-r042-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180740.i53CuGfE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=8515ceedf9e1709310184254bfea56eca6bf8617
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 8515ceedf9e1709310184254bfea56eca6bf8617
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180740.i53CuGfE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_attach_lock':
>> kernel/cgroup/cgroup.c:2435:9: error: implicit declaration of function 'cpus_read_lock'; did you mean 'cpuset_read_lock'? [-Werror=implicit-function-declaration]
    2435 |         cpus_read_lock();
         |         ^~~~~~~~~~~~~~
         |         cpuset_read_lock
   kernel/cgroup/cgroup.c: In function 'cgroup_attach_unlock':
>> kernel/cgroup/cgroup.c:2448:9: error: implicit declaration of function 'cpus_read_unlock'; did you mean 'cpuset_read_unlock'? [-Werror=implicit-function-declaration]
    2448 |         cpus_read_unlock();
         |         ^~~~~~~~~~~~~~~~
         |         cpuset_read_unlock
   cc1: some warnings being treated as errors


vim +2435 kernel/cgroup/cgroup.c

857a2beb09ab83 kernel/cgroup.c        Tejun Heo    2013-04-14  2409  
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2410  /**
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2411   * cgroup_attach_lock - Lock for ->attach()
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2412   * @lock_threadgroup: whether to down_write cgroup_threadgroup_rwsem
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2413   *
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2414   * cgroup migration sometimes needs to stabilize threadgroups against forks and
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2415   * exits by write-locking cgroup_threadgroup_rwsem. However, some ->attach()
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2416   * implementations (e.g. cpuset), also need to disable CPU hotplug.
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2417   * Unfortunately, letting ->attach() operations acquire cpus_read_lock() can
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2418   * lead to deadlocks.
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2419   *
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2420   * Bringing up a CPU may involve creating and destroying tasks which requires
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2421   * read-locking threadgroup_rwsem, so threadgroup_rwsem nests inside
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2422   * cpus_read_lock(). If we call an ->attach() which acquires the cpus lock while
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2423   * write-locking threadgroup_rwsem, the locking order is reversed and we end up
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2424   * waiting for an on-going CPU hotplug operation which in turn is waiting for
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2425   * the threadgroup_rwsem to be released to create new tasks. For more details:
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2426   *
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2427   *   http://lkml.kernel.org/r/20220711174629.uehfmqegcwn2lqzu@wubuntu
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2428   *
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2429   * Resolve the situation by always acquiring cpus_read_lock() before optionally
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2430   * write-locking cgroup_threadgroup_rwsem. This allows ->attach() to assume that
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2431   * CPU hotplug is disabled on entry.
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2432   */
075b593f54f0f3 kernel/cgroup/cgroup.c Tetsuo Handa 2022-08-26  2433  void cgroup_attach_lock(bool lock_threadgroup)
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2434  {
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15 @2435  	cpus_read_lock();
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2436  	if (lock_threadgroup)
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2437  		percpu_down_write(&cgroup_threadgroup_rwsem);
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2438  }
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2439  
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2440  /**
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2441   * cgroup_attach_unlock - Undo cgroup_attach_lock()
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2442   * @lock_threadgroup: whether to up_write cgroup_threadgroup_rwsem
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2443   */
075b593f54f0f3 kernel/cgroup/cgroup.c Tetsuo Handa 2022-08-26  2444  void cgroup_attach_unlock(bool lock_threadgroup)
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2445  {
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2446  	if (lock_threadgroup)
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2447  		percpu_up_write(&cgroup_threadgroup_rwsem);
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15 @2448  	cpus_read_unlock();
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2449  }
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo    2022-08-15  2450  

:::::: The code at line 2435 was first introduced by commit
:::::: 4f7e7236435ca0abe005c674ebd6892c6e83aeb3 cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
