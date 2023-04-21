Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10A37A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 02:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682043662; x=1713579662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pr2d7MoE1H50DOyUpGQxP7fkePWviHMYd+Y6EpYGWhE=;
  b=ODJVZfbeGtniCmkYXrFHl0o/RBctxAy5HNsLuKlVqWVY8/JQs25PiHWM
   +rQ4nvQfp3V0xhV3IfcpakzYUlWgVjzNZiKnYwBvXipkPYfGJhRpV642y
   TpwUXGbxBRkq/eFJY6wOlqi08+W7SdXbSuj4y6Jh0pj8l1mWPFzrrS61V
   xfXmI4Gqd2RAHfeEfxyrziSlMGcj9gfJp2aqhJyYVc7vnqiyE3DHV2yYR
   Lp5aTCKunmHyy97qhDpKFgpptcs3HvuEXum4ONJMzSi1YenMhmlMaanup
   vwJEqozShjNnMjvtrJv03YIkNR+jrdRED3nutJDDwO/MbuvzBNPk0Rhpo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408835652"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="408835652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 19:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="722601389"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="722601389"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2023 19:21:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppgOS-000gFl-1E;
	Fri, 21 Apr 2023 02:21:00 +0000
Date: Fri, 21 Apr 2023 10:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/2] kernel/rcu/srcutree.c:1509:17:
 error: too many arguments to function 'debug_rcu_head_unqueue'
Message-ID: <202304211004.tUOTYXsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   7633c44e65602b1f7c11dd52c7935ed71b7dce74
commit: 7633c44e65602b1f7c11dd52c7935ed71b7dce74 [2/2] rcu/debug: Add support for debugfs debugging of RCU CBs.
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230421/202304211004.tUOTYXsa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=7633c44e65602b1f7c11dd52c7935ed71b7dce74
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 7633c44e65602b1f7c11dd52c7935ed71b7dce74
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211004.tUOTYXsa-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/srcutree.c: In function 'srcu_barrier_one_cpu':
>> kernel/rcu/srcutree.c:1509:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    1509 |                 debug_rcu_head_unqueue(&sdp->srcu_barrier_head, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/srcutree.c:30:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c: In function 'srcu_invoke_callbacks':
   kernel/rcu/srcutree.c:1673:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    1673 |                 debug_rcu_head_unqueue(rhp, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/srcutree.c:30:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:89:5: warning: no previous prototype for 'rcu_debug_cb_done' [-Wmissing-prototypes]
      89 | int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
         |     ^~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:94:6: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
      94 | void rcu_debug_init(void)
         |      ^~~~~~~~~~~~~~
   kernel/rcu/tree.c:2051:5: warning: no previous prototype for 'rcu_debug_cb_done_lock' [-Wmissing-prototypes]
    2051 | int rcu_debug_cb_done_lock(struct rcu_data *rdp, void *ip, struct rcu_head_debug_data *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_do_batch':
>> kernel/rcu/tree.c:2123:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    2123 |                 debug_rcu_head_unqueue(rhp, &debug_data);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'kvfree_rcu_list':
   kernel/rcu/tree.c:2978:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    2978 |                 debug_rcu_head_unqueue((struct rcu_head *)ptr, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'kvfree_call_rcu':
   kernel/rcu/tree.c:3368:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    3368 |                 debug_rcu_head_unqueue((struct rcu_head *) ptr, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_barrier_entrain':
   kernel/rcu/tree.c:3921:17: error: too many arguments to function 'debug_rcu_head_unqueue'
    3921 |                 debug_rcu_head_unqueue(&rdp->barrier_head, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/rcu.h:220:20: note: declared here
     220 | static inline void debug_rcu_head_unqueue(struct rcu_head *head)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/debug_rcu_head_unqueue +1509 kernel/rcu/srcutree.c

  1492	
  1493	/*
  1494	 * Enqueue an srcu_barrier() callback on the specified srcu_data
  1495	 * structure's ->cblist.  but only if that ->cblist already has at least one
  1496	 * callback enqueued.  Note that if a CPU already has callbacks enqueue,
  1497	 * it must have already registered the need for a future grace period,
  1498	 * so all we need do is enqueue a callback that will use the same grace
  1499	 * period as the last callback already in the queue.
  1500	 */
  1501	static void srcu_barrier_one_cpu(struct srcu_struct *ssp, struct srcu_data *sdp)
  1502	{
  1503		spin_lock_irq_rcu_node(sdp);
  1504		atomic_inc(&ssp->srcu_barrier_cpu_cnt);
  1505		sdp->srcu_barrier_head.func = srcu_barrier_cb;
  1506		debug_rcu_head_queue(&sdp->srcu_barrier_head);
  1507		if (!rcu_segcblist_entrain(&sdp->srcu_cblist,
  1508					   &sdp->srcu_barrier_head)) {
> 1509			debug_rcu_head_unqueue(&sdp->srcu_barrier_head, NULL);
  1510			atomic_dec(&ssp->srcu_barrier_cpu_cnt);
  1511		}
  1512		spin_unlock_irq_rcu_node(sdp);
  1513	}
  1514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
