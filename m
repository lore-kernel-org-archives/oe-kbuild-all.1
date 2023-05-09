Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAC19918
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 21:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683669295; x=1715205295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ijc4yO911iy4ToQafBBVxV4avm9m3Sd5d5IilgsWhvM=;
  b=YgOErB9DNkXrBZ+mfK1OkI8vCMd6/ozhV82cZBhc9FuQAVoSKljlyire
   RWTi2mbAwKS9E/qqtzfMcYv1EL9xDx47ev4/K9EjdiuiQDvs1MJ0m3OEX
   J0pnIlnDHQL/MzC2go2YRSLa8VBGb13vttQrH2qjs3XjU8ByaPOC+wKKa
   AE/YbHU+86QFMGw4RbQCldGnKk/3IOGgymbP6z8GsGCV6SZUUy4wJoNaI
   VJNvDuNJvSdAio+sCfm4HzAZws60sPaQXR5G9VpRzaXfKspIsxX96JXBI
   iFytrYgcB70gzCQiuJk4PMs7Vts9raU6DujvrdgB9YGHam2UcrYHqhmVQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415630725"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="415630725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 14:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="764036951"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="764036951"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 14:54:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwVIK-0002Xu-0g;
	Tue, 09 May 2023 21:54:52 +0000
Date: Wed, 10 May 2023 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 1/2] lockdep: lock_set_cmp_fn()
Message-ID: <202305100552.41Mi8Ctu-lkp@intel.com>
References: <20230509195847.1745548-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509195847.1745548-1-kent.overstreet@linux.dev>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[cannot apply to linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/bcache-Convert-to-lock_cmp_fn/20230510-040030
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20230509195847.1745548-1-kent.overstreet%40linux.dev
patch subject: [PATCH 1/2] lockdep: lock_set_cmp_fn()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305100552.41Mi8Ctu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f265373c48cadb6f81e032df9893abffc370ab89
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kent-Overstreet/bcache-Convert-to-lock_cmp_fn/20230510-040030
        git checkout f265373c48cadb6f81e032df9893abffc370ab89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/md/bcache/ kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100552.41Mi8Ctu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/lockdep.c: In function 'print_chain_keys_chain':
   kernel/locking/lockdep.c:3592:46: error: passing argument 1 of 'print_lock_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3592 |                 print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
         |                                 ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              |
         |                                              struct lock_class *
   kernel/locking/lockdep.c:732:47: note: expected 'struct held_lock *' but argument is of type 'struct lock_class *'
     732 | static void print_lock_name(struct held_lock *hlock, struct lock_class *class)
         |                             ~~~~~~~~~~~~~~~~~~^~~~~
   kernel/locking/lockdep.c:3592:17: error: too few arguments to function 'print_lock_name'
    3592 |                 print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
         |                 ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:732:13: note: declared here
     732 | static void print_lock_name(struct held_lock *hlock, struct lock_class *class)
         |             ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c: At top level:
>> kernel/locking/lockdep.c:4898:6: warning: no previous prototype for 'lockdep_set_lock_cmp_fn' [-Wmissing-prototypes]
    4898 | void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/lockdep_set_lock_cmp_fn +4898 kernel/locking/lockdep.c

  4896	
  4897	#ifdef CONFIG_PROVE_LOCKING
> 4898	void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
  4899				     lock_print_fn print_fn)
  4900	{
  4901		struct lock_class *class = lock->class_cache[0];
  4902		unsigned long flags;
  4903	
  4904		raw_local_irq_save(flags);
  4905		lockdep_recursion_inc();
  4906	
  4907		if (!class)
  4908			class = register_lock_class(lock, 0, 0);
  4909	
  4910		if (class) {
  4911			WARN_ON(class->cmp_fn	&& class->cmp_fn != cmp_fn);
  4912			WARN_ON(class->print_fn && class->print_fn != print_fn);
  4913	
  4914			class->cmp_fn	= cmp_fn;
  4915			class->print_fn = print_fn;
  4916		}
  4917	
  4918		lockdep_recursion_finish();
  4919		raw_local_irq_restore(flags);
  4920	}
  4921	EXPORT_SYMBOL_GPL(lockdep_set_lock_cmp_fn);
  4922	#endif
  4923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
