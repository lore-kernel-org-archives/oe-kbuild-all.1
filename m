Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50763C23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677276370; x=1708812370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBDFegU/z3qQa5wN5Y+v6FHgflchQCdQw1Asz1jdb/s=;
  b=lpwD0TXOwoYMPOgjWtk20F5Sw22UoB5Sdjj45shZ4Ee41/4M1etnDcl3
   sHwI8Ya9drzoniqR7Y0UHHRn7cl5VN3NEB15q+e+YXxAdHtRUiBf2/SpQ
   4AmLA64CdIPwb+TFg0S82pEFDjXZqJl0yT3rLsh5F3rRXpTH2A2qWaq7M
   +J8YoNIQiuZPYfqebKLzJweyDHiwX4eZYK4LZA2VIUeHuTb9zK4bHqg5r
   wILHn4eUpcfed5qtGIVGb4dst06vfDIHgR9D5OiiS97Kax3Vw+68aSAjP
   tlyb8ClLhfNJI5lVVIUmHIk+m6m30//REKfKKbyzKC8zSzw0dQWmFdryS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335021079"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="335021079"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847082337"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="847082337"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 14:06:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgCe-0002l1-2Z;
	Fri, 24 Feb 2023 22:06:08 +0000
Date: Sat, 25 Feb 2023 06:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h:162:5: warning: no
 previous prototype for 'rcu_debug_ptr_queue'
Message-ID: <202302250617.5MxlMWdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38
commit: 561427c949299c3f6b3a42b5fa4b035aa5bb419a [1/1] debug: dynamic lazy wake debug
config: arm-randconfig-r046-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250617.5MxlMWdG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=561427c949299c3f6b3a42b5fa4b035aa5bb419a
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 561427c949299c3f6b3a42b5fa4b035aa5bb419a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250617.5MxlMWdG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
>> kernel/rcu/debug.h:162:5: warning: no previous prototype for 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
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
>> kernel/rcu/tree.c:2198:17: warning: no previous prototype for 'rcu_debug_ptr_unqueue_lock' [-Wmissing-prototypes]
    2198 | rcu_debug_entry rcu_debug_ptr_unqueue_lock(struct rcu_data *rdp, void *ip)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_debug_ptr_unqueue_lock':
   kernel/rcu/tree.c:2204:15: error: implicit declaration of function 'rcu_debug_ptr_unqueue'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    2204 |         ret = rcu_debug_ptr_unqueue(rdp, ip);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               rcu_debug_ptr_queue
   kernel/rcu/tree.c:2204:15: error: incompatible types when assigning to type 'rcu_debug_entry' from type 'int'
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from kernel/rcu/tree.c:21:
   kernel/rcu/tree.c: In function 'rcu_debug_ptr_queue_lock':
   kernel/rcu/tree.c:2220:22: error: too many arguments to function 'rcu_debug_ptr_queue'
    2220 |         WARN_ON_ONCE(rcu_debug_ptr_queue(rdp, ip, lazy));
         |                      ^~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/tree.c:2220:9: note: in expansion of macro 'WARN_ON_ONCE'
    2220 |         WARN_ON_ONCE(rcu_debug_ptr_queue(rdp, ip, lazy));
         |         ^~~~~~~~~~~~
   kernel/rcu/debug.h:162:5: note: declared here
     162 | int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_init':
   kernel/rcu/tree.c:4912:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
    4912 |                 rdp->rcu_debug_ptrs[i].valid = false;
         |                    ^~
   kernel/rcu/tree.c:4913:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
    4913 |                 rdp->rcu_debug_ptrs[i].in_flight = false;
         |                    ^~
   cc1: some warnings being treated as errors


vim +/rcu_debug_ptr_queue +162 kernel/rcu/debug.h

   151	
   152	void rcu_debug_init(void)
   153	{
   154		int ret;
   155		pr_info("RCU Lazy CB debugging is turned on, system may be slow.\n");
   156	
   157		ret = register_trace_sched_waking(probe_waking, NULL);
   158		if (ret)
   159			pr_info("RCU: Lazy debug ched_waking probe could not be registered.");
   160	}
   161	#else
 > 162	int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
   163	{
   164		return -1;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
