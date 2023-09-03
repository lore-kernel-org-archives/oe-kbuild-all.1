Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA0377
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693751459; x=1725287459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WPJX17M+sUngcTE0uCV1asoGumgRum4wKIkd83ZgaG4=;
  b=fpOhtcBkAsPFvJ0gXOFumfW3LARYGInfGlJsMmCyD9lgifyHa4uiMO9Y
   1oZzYpT4irXy6FxGY3ylTAdVfoE5x71BWbJsKc7kJFb8SZfRH35k4HFA+
   fZNcFCuzhJorKltqVudQ9qvJbwbYLHFSEOagUuP44apxTUc+4jSsiK/H7
   1XJ17OVeGWk+XtnmdOCRX+zYnGOYQ8CNbknn10JSKbVI1xR8xqjnkxTTi
   4gUF4qkziyJaXKNtw0zUKhTj7g4307yxlfW6DNAqNTJ50fwcrrDF7J16E
   QUiytQm563ldNs5H/+aMaeZg6KMEWSh+M4Kes1InIXW+iSp3EWLnEKiGy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="361475147"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="361475147"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 07:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717310001"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="717310001"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2023 07:30:57 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qco7r-0003DL-00;
	Sun, 03 Sep 2023 14:30:55 +0000
Date: Sun, 3 Sep 2023 22:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.24a 72/74]
 kernel/locking/qspinlock.c:779:23: warning: no previous declaration for
 '__pv_spinlock_dump'
Message-ID: <202309032246.VhgyldbK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.24a
head:   ed763051f63059bdb6d728c0890993eab8833feb
commit: c0aaeb8f1165a2624a6ed4d8c2a5f340e4b91158 [72/74] squash! EXP qspinlock: Dump lock state, add call from locktorture
config: x86_64-randconfig-003-20230903 (https://download.01.org/0day-ci/archive/20230903/202309032246.VhgyldbK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309032246.VhgyldbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309032246.VhgyldbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/qspinlock.c:784:0:
   kernel/locking/qspinlock_paravirt.h:493:1: warning: no previous declaration for '__pv_queued_spin_unlock_slowpath' [-Wmissing-declarations]
    __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 locked)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/qspinlock.c:785:0:
   kernel/locking/qspinlock.c:691:29: error: redefinition of 'next_to_cpu_idx'
    static struct mcs_spinlock *next_to_cpu_idx(struct mcs_spinlock *msp, int *cpup, int *idxp)
                                ^~~~~~~~~~~~~~~
   kernel/locking/qspinlock.c:691:29: note: previous definition of 'next_to_cpu_idx' was here
    static struct mcs_spinlock *next_to_cpu_idx(struct mcs_spinlock *msp, int *cpup, int *idxp)
                                ^~~~~~~~~~~~~~~
>> kernel/locking/qspinlock.c:779:23: warning: no previous declaration for '__pv_spinlock_dump' [-Wmissing-declarations]
    #define spinlock_dump __pv_spinlock_dump
                          ^
   kernel/locking/qspinlock.c:712:6: note: in expansion of macro 'spinlock_dump'
    void spinlock_dump(spinlock_t *sp, bool full)
         ^~~~~~~~~~~~~


vim +/__pv_spinlock_dump +779 kernel/locking/qspinlock.c

   775	
   776	#undef  queued_spin_lock_slowpath
   777	#define queued_spin_lock_slowpath	__pv_queued_spin_lock_slowpath
   778	#define queued_spin_lock_slowpath_diags	__pv_queued_spin_lock_slowpath_diags
 > 779	#define spinlock_dump	__pv_spinlock_dump
   780	#define tail_to_cpu	__pv_tail_to_cpu
   781	#define tail_to_idx	__pv_tail_to_idx
   782	#define next_to_prev	__pv_next_to_prev
   783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
