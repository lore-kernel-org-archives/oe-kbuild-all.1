Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47552F30
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682869721; x=1714405721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gw73/zhsxmSiLYXktRhxVJdgOu40OIdpMLG3yjSqWEw=;
  b=kyRlQlIBeG6+ONXSGkDKtFSEiU8RTGrBpUr3aWoLs4Jnd2WsCOKnd9iC
   BYv0eG1v3OR5OUXf4g+tOgvwUIRTvjOE+mEwIUfyS+5SN4SrJWlbLP26i
   KoxGe7M4WA+Y9nPqCctCas5TxrxH0aIfOV2f9muCvY9ztHwzyt1ueXp+/
   FezDZlne/rjboKEN1lb7a7PY15m/S1BQ/Rh9B+s7/P2qd0ayI6isPvOZd
   G5r2QYtccQkSPYlQ4G60frMgVUHgLOBWPamRvTbMaOOU5NXOyeGtzXnXy
   P0JlXNnil4FgoZuU0Wl5Orry2KfAQ42Azcyl7gMGCuVxn6rKRWsRE6DnP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="337147416"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="337147416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 08:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="807159540"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="807159540"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2023 08:48:40 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt9Hz-00001Z-1B;
	Sun, 30 Apr 2023 15:48:39 +0000
Date: Sun, 30 Apr 2023 23:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/4] kernel/rcu/tiny.c:131:17: error: too
 few arguments to function 'debug_rcu_head_unqueue'
Message-ID: <202304302338.3EKmhvhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   bb4ed72d010d114a825cba50a2f910b8a6bdadf7
commit: 14152f0da3bdbf3547684655bec19bf657624886 [2/4] rcu/debug: Add support for recording stats of RCU CBs
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230430/202304302338.3EKmhvhI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=14152f0da3bdbf3547684655bec19bf657624886
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 14152f0da3bdbf3547684655bec19bf657624886
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/reiserfs/ kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304302338.3EKmhvhI-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/tiny.c: In function 'rcu_process_callbacks':
>> kernel/rcu/tiny.c:131:17: error: too few arguments to function 'debug_rcu_head_unqueue'
     131 |                 debug_rcu_head_unqueue(list);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tiny.c:28:
   kernel/rcu/rcu.h:205:20: note: declared here
     205 | static inline void debug_rcu_head_unqueue(struct rcu_head *head, struct rcu_head_debug_data **datap)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/debug_rcu_head_unqueue +131 kernel/rcu/tiny.c

77a40f97030b27 kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  105) 
65cfe3583b612a kernel/rcu/tiny.c Paul E. McKenney        2018-07-01  106  /* Invoke the RCU callbacks whose grace period has elapsed.  */
65cfe3583b612a kernel/rcu/tiny.c Paul E. McKenney        2018-07-01  107  static __latent_entropy void rcu_process_callbacks(struct softirq_action *unused)
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  108  {
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  109  	struct rcu_head *next, *list;
4ce5b90340879c kernel/rcutiny.c  Ingo Molnar             2009-10-26  110  	unsigned long flags;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  111  
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  112  	/* Move the ready-to-invoke callbacks to a local list. */
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  113  	local_irq_save(flags);
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  114  	if (rcu_ctrlblk.donetail == &rcu_ctrlblk.rcucblist) {
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  115  		/* No callbacks ready, so just leave. */
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  116  		local_irq_restore(flags);
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  117  		return;
6e91f8cb138625 kernel/rcu/tiny.c Paul E. McKenney        2015-05-11  118  	}
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  119  	list = rcu_ctrlblk.rcucblist;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  120  	rcu_ctrlblk.rcucblist = *rcu_ctrlblk.donetail;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  121  	*rcu_ctrlblk.donetail = NULL;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  122  	if (rcu_ctrlblk.curtail == rcu_ctrlblk.donetail)
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  123  		rcu_ctrlblk.curtail = &rcu_ctrlblk.rcucblist;
709fdce7545c97 kernel/rcu/tiny.c Paul E. McKenney        2018-07-03  124  	rcu_ctrlblk.donetail = &rcu_ctrlblk.rcucblist;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  125  	local_irq_restore(flags);
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  126  
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  127  	/* Invoke the callbacks on the local list. */
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  128  	while (list) {
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  129  		next = list->next;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  130  		prefetch(next);
551d55a944b143 kernel/rcutiny.c  Mathieu Desnoyers       2010-04-17 @131  		debug_rcu_head_unqueue(list);
b2c0710c464ede kernel/rcutiny.c  Paul E. McKenney        2010-09-09  132  		local_bh_disable();
77a40f97030b27 kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  133) 		rcu_reclaim_tiny(list);
b2c0710c464ede kernel/rcutiny.c  Paul E. McKenney        2010-09-09  134  		local_bh_enable();
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  135  		list = next;
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  136  	}
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  137  }
9b1d82fa161170 kernel/rcutiny.c  Paul E. McKenney        2009-10-25  138  

:::::: The code at line 131 was first introduced by commit
:::::: 551d55a944b143ef26fbd482d1c463199d6f65cf tree/tiny rcu: Add debug RCU head objects

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
