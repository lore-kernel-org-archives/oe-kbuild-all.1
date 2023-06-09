Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808161113
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 02:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686277568; x=1717813568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYTTsPiR4uGm8z922I6ccA0tzeTlz7UK2bAZe/JzUdI=;
  b=ZClVwhAM9bzuxnniiO1jRCUcU4ohuic8DCcdKufpz7mWF9At1pSnkUmO
   BtRYbbetUt/oR5/v8goRWTYYKo1L7DkM+hYqLV4Un/69XbyWdF+AcNoRK
   S1Uw+MsuDv0NvTqFE9lEM+uyxmZTc4IE98dJAgXUNAoGdR3ehSQzIYPWI
   7+/FgXjcyN1kdU74hj3wipiGZdL8op06opxcA1eZ/sBGrV9eOPu4Bi20T
   6rvGmUKPR+/ENreWL+52hlMtEHcAOMmBSYJnrfvqhlDh66FTzNc+xOLh1
   f3FixOaS/SsTqemECXHVn6P6mnzbvWgRMckUXBWCIqADfNHHgpL1ZEkdQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347141219"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="347141219"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743322256"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="743322256"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jun 2023 19:26:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7RpF-0008WI-2V;
	Fri, 09 Jun 2023 02:26:05 +0000
Date: Fri, 9 Jun 2023 10:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma_v4 6/7] kernel/bpf/memalloc.c:307:13: warning: variable
 'cnt' set but not used
Message-ID: <202306091056.K50P7cxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git ma_v4
head:   86c9deee3b8263f7546b8bad1e1a8d9662503ded
commit: 45acfe8484365cc1aa89e3d676697ce69ff4169b [6/7] hack 3
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306091056.K50P7cxn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=45acfe8484365cc1aa89e3d676697ce69ff4169b
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf ma_v4
        git checkout 45acfe8484365cc1aa89e3d676697ce69ff4169b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash kernel/bpf/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091056.K50P7cxn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/memalloc.c: In function 'free_rcu':
>> kernel/bpf/memalloc.c:307:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     307 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_reuse_tt_cb':
   kernel/bpf/memalloc.c:327:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     327 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_add_to_reuse_ready_or_free':
   kernel/bpf/memalloc.c:340:33: warning: unused variable 'batch' [-Wunused-variable]
     340 |         struct bpf_reuse_batch *batch;
         |                                 ^~~~~
   kernel/bpf/memalloc.c: At top level:
   kernel/bpf/memalloc.c:323:13: warning: 'bpf_ma_reuse_tt_cb' defined but not used [-Wunused-function]
     323 | static void bpf_ma_reuse_tt_cb(struct rcu_head *rcu)
         |             ^~~~~~~~~~~~~~~~~~


vim +/cnt +307 kernel/bpf/memalloc.c

74997411cd7dbc Hou Tao            2023-06-06  301  
968197295c21af Hou Tao            2023-06-06  302  static void free_rcu(struct rcu_head *rcu)
74997411cd7dbc Hou Tao            2023-06-06  303  {
968197295c21af Hou Tao            2023-06-06  304  	struct bpf_mem_shared_cache *sc = container_of(rcu, struct bpf_mem_shared_cache, rcu);
968197295c21af Hou Tao            2023-06-06  305  	struct llist_node *head;
968197295c21af Hou Tao            2023-06-06  306  	unsigned long flags;
bf586de1a9943a Alexei Starovoitov 2023-06-08 @307  	int cnt;
74997411cd7dbc Hou Tao            2023-06-06  308  
968197295c21af Hou Tao            2023-06-06  309  	raw_spin_lock_irqsave(&sc->reuse_lock, flags);
968197295c21af Hou Tao            2023-06-06  310  	head = __llist_del_all(&sc->wait_for_free);
968197295c21af Hou Tao            2023-06-06  311  	raw_spin_unlock_irqrestore(&sc->reuse_lock, flags);
bf586de1a9943a Alexei Starovoitov 2023-06-08  312  	cnt = free_all(head, sc->percpu);
45acfe8484365c Alexei Starovoitov 2023-06-08  313  //	printk("after rcu_tasks_trace GP %d\n", cnt);
968197295c21af Hou Tao            2023-06-06  314  	atomic_set(&sc->call_rcu_in_progress, 0);
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  315  }
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  316  

:::::: The code at line 307 was first introduced by commit
:::::: bf586de1a9943af02ecaeddbfff66d7fde56bc26 hack2

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
