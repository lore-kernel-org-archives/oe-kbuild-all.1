Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465DBA32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 21:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677274510; x=1708810510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MplvQ8SdUTQb9snSd9bFcMFMYayIuHorw0s7PAC1lP0=;
  b=mripb3bTOt9zQJQ4XAAyS08hGbdiJ5IG3F2morZPuyTRlN2s5rTirxJz
   4YMdliOAdlynW8ZsSdFGU3mxTNP/zkO50Qm2IzAaHc4QpfO1TPTItzDrK
   dTEmyu162kFx7nNHoGw0kEU+wgTK/Ei5+dkJBTigOzxuj5+weMEPPuCne
   ElRTyPP7uIcBvwMubzG4QvSyMNkqrgx/xrbZ+E1KjOS5FxVGxwkXRFU8s
   1leATgLlItCs2kNqfTg+wysFeQmY5KYH4ZAosuyBaLJeN+ri3cxUu9uHu
   voqdX8hy5W/kTBz3OKcxMBuQbkwu27wphmY0b0fV3lkosKelp+ywHd+53
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313221929"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="313221929"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 13:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="650490409"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="650490409"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Feb 2023 13:35:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVfie-0002jz-0Y;
	Fri, 24 Feb 2023 21:35:08 +0000
Date: Sat, 25 Feb 2023 05:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/tree.c:2204:15: error: implicit
 declaration of function 'rcu_debug_ptr_unqueue'; did you mean
 'rcu_debug_ptr_queue'?
Message-ID: <202302250541.U3UKPJBq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   561427c949299c3f6b3a42b5fa4b035aa5bb419a
commit: 561427c949299c3f6b3a42b5fa4b035aa5bb419a [1/1] debug: dynamic lazy wake debug
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230225/202302250541.U3UKPJBq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=561427c949299c3f6b3a42b5fa4b035aa5bb419a
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 561427c949299c3f6b3a42b5fa4b035aa5bb419a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250541.U3UKPJBq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:162:5: warning: no previous prototype for 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
     162 | int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:167:6: warning: no previous prototype for 'rcu_debug_set_context' [-Wmissing-prototypes]
     167 | void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:171:6: warning: no previous prototype for 'rcu_debug_reset_context' [-Wmissing-prototypes]
     171 | void rcu_debug_reset_context(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:175:6: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
     175 | void rcu_debug_init(void)
         |      ^~~~~~~~~~~~~~
   kernel/rcu/tree.c:2198:17: warning: no previous prototype for 'rcu_debug_ptr_unqueue_lock' [-Wmissing-prototypes]
    2198 | rcu_debug_entry rcu_debug_ptr_unqueue_lock(struct rcu_data *rdp, void *ip)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_debug_ptr_unqueue_lock':
>> kernel/rcu/tree.c:2204:15: error: implicit declaration of function 'rcu_debug_ptr_unqueue'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    2204 |         ret = rcu_debug_ptr_unqueue(rdp, ip);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               rcu_debug_ptr_queue
>> kernel/rcu/tree.c:2204:15: error: incompatible types when assigning to type 'rcu_debug_entry' from type 'int'
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/tree.c:23:
   kernel/rcu/tree.c: In function 'rcu_debug_ptr_queue_lock':
>> kernel/rcu/tree.c:2220:22: error: too many arguments to function 'rcu_debug_ptr_queue'
    2220 |         WARN_ON_ONCE(rcu_debug_ptr_queue(rdp, ip, lazy));
         |                      ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:162:5: note: declared here
     162 | int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/tree.c:23:
   kernel/rcu/tree.c: In function 'rcutree_migrate_callbacks':
>> kernel/rcu/tree.c:4440:61: error: request for member 'valid' in something not a structure or union
    4440 |                 WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
         |                                                             ^
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_init':
>> kernel/rcu/tree.c:4912:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
    4912 |                 rdp->rcu_debug_ptrs[i].valid = false;
         |                    ^~
   kernel/rcu/tree.c:4913:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
    4913 |                 rdp->rcu_debug_ptrs[i].in_flight = false;
         |                    ^~
   cc1: some warnings being treated as errors


vim +2204 kernel/rcu/tree.c

  2193	
  2194	/*
  2195	 * Lock wrapper for rcu_debug_ptr_unqueue(). Required as
  2196	 * rcu_debug_ptr_unqueue() expects the rdp lock to be held.
  2197	 */
  2198	rcu_debug_entry rcu_debug_ptr_unqueue_lock(struct rcu_data *rdp, void *ip)
  2199	{
  2200		unsigned long flags;
  2201		rcu_debug_entry ret;
  2202	
  2203		rcu_nocb_lock_irqsave(rdp, flags);
> 2204		ret = rcu_debug_ptr_unqueue(rdp, ip);
  2205		rcu_nocb_unlock_irqrestore(rdp, flags);
  2206	
  2207		return ret;
  2208	}
  2209	
  2210	/*
  2211	 * Lock wrapper for rcu_debug_ptr_queue(). Required as
  2212	 * rcu_debug_ptr_queue() expects the rdp lock to be held.
  2213	 */
  2214	static void rcu_debug_ptr_queue_lock(struct rcu_data *rdp, void *ip,
  2215		       			      bool lazy)
  2216	{
  2217		unsigned long flags;
  2218	
  2219		rcu_nocb_lock_irqsave(rdp, flags);
> 2220		WARN_ON_ONCE(rcu_debug_ptr_queue(rdp, ip, lazy));
  2221		rcu_nocb_unlock_irqrestore(rdp, flags);
  2222	}
  2223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
