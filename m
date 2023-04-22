Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DEC7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682130393; x=1713666393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Js6b6FUvqofZjw556tgb6Ptev1mDrNcivm4pJbFgkLE=;
  b=bhJK6HOkwTXbslNI91XBNMcNrqPU+f6KBYzF4JuSvVgbwbiwEZ3zyhjW
   kcSTlY/pVDD9FtmyxFY3bRTi1QzYi67TlpqIS52xVUjjdIMGXU583SEE0
   lH9V8Zgeh+mOWB15j7tPeT50m0wEBONRInuT6IE6Kghzq8POhICWMCaYZ
   H7cAxrAF89T8KJRorGXQmTyQxpNKXk+U2qFV19xbIm7wF/zaeou5PuAGm
   DK93jpQdpfIsNl+TRbUb3Asbi3upn+WFdxNgJnE247+f7wFo0OiO/xaOv
   c00eHfPvD9smR3jHPAxtc6DHwm42vyv8pKgnD1Zezkd9YN4IrLhUzJGga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411391566"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411391566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 19:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="757086434"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="757086434"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 19:26:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq2xL-000h0i-0w;
	Sat, 22 Apr 2023 02:26:31 +0000
Date: Sat, 22 Apr 2023 10:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 3/4] kernel/rcu/debug.h:130:33: error:
 'rcu_head_debug_data' undeclared
Message-ID: <202304221020.AeA0sTBi-lkp@intel.com>
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
commit: 2df956d971601d26c6568dd888fa0398f20e29d1 [3/4] rcu/debug: Add debugfs nodes to read data
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304221020.AeA0sTBi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=2df956d971601d26c6568dd888fa0398f20e29d1
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 2df956d971601d26c6568dd888fa0398f20e29d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221020.AeA0sTBi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:52:5: warning: no previous prototype for 'rcu_debug_cb_done' [-Wmissing-prototypes]
      52 | int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
         |     ^~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:126:13: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
     126 | void __init rcu_debug_init(void)
         |             ^~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/tree.c:23:
   kernel/rcu/debug.h: In function 'rcu_debug_init':
>> kernel/rcu/debug.h:130:33: error: 'rcu_head_debug_data' undeclared (first use in this function)
     130 |         if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/rcu/debug.h:130:33: note: each undeclared identifier is reported only once for each function it appears in
     130 |         if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
>> kernel/rcu/debug.h:130:56: error: 'CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE' undeclared (first use in this function); did you mean 'CONFIG_DEBUG_OBJECTS_RCU_HEAD'?
     130 |         if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/rcu/tree.c: At top level:
   kernel/rcu/tree.c:2051:5: warning: no previous prototype for 'rcu_debug_cb_done_lock' [-Wmissing-prototypes]
    2051 | int rcu_debug_cb_done_lock(struct rcu_data *rdp, void *ip, struct rcu_head_debug_data *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/rcu_head_debug_data +130 kernel/rcu/debug.h

   125	
   126	void __init rcu_debug_init(void)
   127	{
   128		struct dentry *rcu_dir, *rcu_file;
   129	
 > 130		if (WARN_ON_ONCE(sizeof(rcu_head_debug_data) > CONFIG_DEBUG_OBJECTS_RCU_HEAD_SIZE))
   131			return;
   132	
   133		rcu_dir = debugfs_create_dir("rcu", NULL);
   134		if (!rcu_dir || IS_ERR(rcu_dir))
   135			return;
   136	
   137		rcu_file = debugfs_create_file("callbacks", 0444, rcu_dir, NULL,
   138				&rcu_debug_fops);
   139		if (!rcu_file)
   140			debugfs_remove(rcu_dir);
   141	}
   142	#else
   143	int rcu_debug_cb_done(struct rcu_data *rdp, void* ip_ptr, struct rcu_head_debug_data *data)
   144	{
   145		return -1;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
