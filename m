Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C7612B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682105604; x=1713641604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AklTkorl12BKNNL4YFuNYslM7MwoyvETQkoj4HVGmD8=;
  b=XTFw/zRxAeZOWuVj/sRmZwi2Xa4GeWx9iH1edOQrUvsnJHhUvUQOyMVs
   ECKEXm7AVjW0IID8f4TWXSs3JCSL8voC4FUujmDK4mui2ygGXXc4Z9vkX
   YHXgaasxIsFRphKWQqlWDZVp7SeKNG/VAXqeQ6nJJLSKsCl6I+/t0znVM
   mBicROOEZwNc/rEz84MbJ40To/B1fHoHkuSZcW9zpsHVI9R0MGB6ZbPvc
   DZ3otsAPgvPUnK1KwwYlpTGZIxLm0PJ/UFWB3lo6YnF0bvtiuIpzjq9zb
   rEud3SOX22DvlxoyJG8NOjuHOmU/M2wXt3Riv74b6ZB2zStBy4OJp0idJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409003681"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409003681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="803833371"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="803833371"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 12:33:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwVU-000gko-2B;
	Fri, 21 Apr 2023 19:33:20 +0000
Date: Sat, 22 Apr 2023 03:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/4] kernel/rcu/tiny.c:131:17: error: too
 few arguments to function 'debug_rcu_head_unqueue'
Message-ID: <202304220309.q253n5Li-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   6b836c3cf663fc9a4fbbe3c14bd8038f84fcd8ed
commit: 6a0f43fcea9122f89ea9994453bf0b8f3203e0a7 [2/4] rcu/debug: Add support for recording stats of RCU CBs
config: m68k-randconfig-r014-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220309.q253n5Li-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6a0f43fcea9122f89ea9994453bf0b8f3203e0a7
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 6a0f43fcea9122f89ea9994453bf0b8f3203e0a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220309.q253n5Li-lkp@intel.com/

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
