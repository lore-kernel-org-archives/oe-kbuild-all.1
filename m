Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478F882F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682974638; x=1714510638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xoTq/5d2n8YYXRknuos5E/bSr0TrWzkqHyzXhHdeQw=;
  b=m/Uq8HgM9ypO54baa8d76KZLon0LusOiarDYaSwuofUoNFCKxBE6Oz2D
   RTYYj3p02HYZQcemS0Fek5bz8a36jQRNNhdpH2GTV/jRqck+gtzHXIStY
   N+vCNIiRuBgxwo69j6crEtZRKLrUTtFc7QRCcTJ6eLqvQ8B3J6LwdOVjP
   gF9GkSt/p9UDkrAdhkXDSJesCqOkzFUPNSIg3nx6Yf3GCwl8xOwM3+oYe
   1UykaUk3AjoOGMEzIMtnXCVeq2cTwbPd2k+zj64LRiGmd2wN93YuQW18n
   wMjfIzv8Ea+cTL6zqIrqeiMKVeuGWbTy/rWDOFZlbdnmZWT5VSwPbP/7a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337358102"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="337358102"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 13:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="760814788"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="760814788"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2023 13:57:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptaaA-0000e1-0T;
	Mon, 01 May 2023 20:57:14 +0000
Date: Tue, 2 May 2023 04:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/4] kernel/rcu/srcutree.c:1509:17:
 error: too many arguments to function 'debug_rcu_head_unqueue'
Message-ID: <202305020443.NZdQPGrC-lkp@intel.com>
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
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230502/202305020443.NZdQPGrC-lkp@intel.com/config)
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
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020443.NZdQPGrC-lkp@intel.com/

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
