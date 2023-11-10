Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA453588A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQ9J93uA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699650232; x=1731186232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgZip6lIU9NPqDn828LKjiKS8/Tla7uA5sTErsGnoww=;
  b=WQ9J93uALDmIiLbtC23G9hUZcbl7XnLIxh+lGyoOhJt7S1shxR73oXgT
   OhFSot9BqcololxUomYp9lI8wgIYE10J46E/OVZATwh3I6z76pG7zUAlf
   tsalbuGT6xM0CnhtcNcK8nWk0m0CFNP1WzNgqgAgfDFEHYCaOIhmw97iI
   m5L5srH7GuvNUlfCJ8gX83fEYfeWJVsr1N6bJAXZRCgZaHqrjlGowyhb2
   bxhGyD6rY3zuCD2dWV9zBstlvkWYnE5ZE5GZ1UIi+j05YdHkf2wztdKJq
   Btyn4FqX+Oryzt1IKFjs/1xeJcv4bdKFHQ2keMw0wjGZ+YvsWKhkQhzor
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370435724"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="370435724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="887431977"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="887431977"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Nov 2023 13:03:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1YfL-0009tm-2U;
	Fri, 10 Nov 2023 21:03:47 +0000
Date: Sat, 11 Nov 2023 05:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mmind-rockchip:dev/panthor 41/41]
 drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Function parameter or
 member 'as' not described in 'panthor_mmu'
Message-ID: <202311110558.72PvHKdt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mmind/linux-rockchip dev/panthor
head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
commit: ef8d76d568fba69012333ce6e9d7cce4aebbb2da [41/41] fixup: panthor to compile newer version of its dependency series'
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110558.72PvHKdt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110558.72PvHKdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110558.72PvHKdt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Function parameter or member 'as' not described in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:419: warning: Cannot understand  * @pt_cache: Cache used to allocate MMU page tables.
    on line 419 - I thought it was a doc line
>> drivers/gpu/drm/panthor/panthor_mmu.c:488: warning: Cannot understand  * @free_pt() - Custom page table free function
    on line 488 - I thought it was a doc line
>> drivers/gpu/drm/panthor/panthor_mmu.c:680: warning: Function parameter or member 'vm' not described in 'panthor_vm_active'
>> drivers/gpu/drm/panthor/panthor_mmu.c:680: warning: Excess function parameter 'VM' description in 'panthor_vm_active'
>> drivers/gpu/drm/panthor/panthor_mmu.c:775: warning: Function parameter or member 'vm' not described in 'panthor_vm_idle'
>> drivers/gpu/drm/panthor/panthor_mmu.c:775: warning: Excess function parameter 'VM' description in 'panthor_vm_idle'
>> drivers/gpu/drm/panthor/panthor_mmu.c:973: warning: Function parameter or member 'vm' not described in 'panthor_vm_alloc_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:973: warning: Function parameter or member 'va' not described in 'panthor_vm_alloc_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:973: warning: Function parameter or member 'va_node' not described in 'panthor_vm_alloc_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:973: warning: Excess function parameter 'VM' description in 'panthor_vm_alloc_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1006: warning: Function parameter or member 'vm' not described in 'panthor_vm_free_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1006: warning: Function parameter or member 'va_node' not described in 'panthor_vm_free_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1006: warning: Excess function parameter 'VM' description in 'panthor_vm_free_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1006: warning: Excess function parameter 'mm_node' description in 'panthor_vm_free_va'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1348: warning: Function parameter or member 'ptdev' not described in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1348: warning: Function parameter or member 'args' not described in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1348: warning: Excess function parameter 'kernel_va_start' description in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1348: warning: Excess function parameter 'kernel_va_range' description in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1407: warning: expecting prototype for panthor_vm_destroy(). Prototype was for panthor_vm_pool_destroy_vm() instead
--
>> drivers/gpu/drm/panthor/panthor_sched.c:631: warning: Function parameter or member 'max_fragment_cores' not described in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:991: warning: Cannot understand  * @cs_slot_reset_locked() - Reset a queue slot
    on line 991 - I thought it was a doc line
>> drivers/gpu/drm/panthor/panthor_sched.c:1525: warning: expecting prototype for panthor_sched_process_global_irq(). Prototype was for sched_process_global_irq_locked() instead
>> drivers/gpu/drm/panthor/panthor_sched.c:1566: warning: Function parameter or member 'ptdev' not described in 'panthor_sched_report_fw_events'
>> drivers/gpu/drm/panthor/panthor_sched.c:1566: warning: Function parameter or member 'events' not described in 'panthor_sched_report_fw_events'
>> drivers/gpu/drm/panthor/panthor_sched.c:1590: warning: Cannot understand  */
    on line 1590 - I thought it was a doc line
>> drivers/gpu/drm/panthor/panthor_sched.c:2464: warning: Function parameter or member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +102 drivers/gpu/drm/panthor/panthor_mmu.c

d9ea7e08c921d9 Boris Brezillon 2023-08-09   48  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   49  /**
d9ea7e08c921d9 Boris Brezillon 2023-08-09   50   * struct panthor_mmu - MMU related data
d9ea7e08c921d9 Boris Brezillon 2023-08-09   51   */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   52  struct panthor_mmu {
d9ea7e08c921d9 Boris Brezillon 2023-08-09   53  	/** @irq: The MMU irq. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   54  	struct panthor_irq irq;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   55  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   56  	/** @as: Address space related fields.
d9ea7e08c921d9 Boris Brezillon 2023-08-09   57  	 *
d9ea7e08c921d9 Boris Brezillon 2023-08-09   58  	 * The GPU has a limited number of address spaces (AS) slots, forcing
d9ea7e08c921d9 Boris Brezillon 2023-08-09   59  	 * us to re-assign them to re-assign slots on-demand.
d9ea7e08c921d9 Boris Brezillon 2023-08-09   60  	 */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   61  	struct {
d9ea7e08c921d9 Boris Brezillon 2023-08-09   62  		/** @slots_lock: Lock protecting access to all other AS fields. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   63  		struct mutex slots_lock;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   64  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   65  		/** @alloc_mask: Bitmask encoding the allocated slots. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   66  		unsigned long alloc_mask;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   67  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   68  		/** @faulty_mask: Bitmask encoding the faulty slots. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   69  		unsigned long faulty_mask;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   70  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   71  		/** @slots: VMs currently bound to the AS slots. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   72  		struct panthor_as_slot slots[MAX_AS_SLOTS];
d9ea7e08c921d9 Boris Brezillon 2023-08-09   73  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   74  		/**
d9ea7e08c921d9 Boris Brezillon 2023-08-09   75  		 * @lru_list: List of least recently used VMs.
d9ea7e08c921d9 Boris Brezillon 2023-08-09   76  		 *
d9ea7e08c921d9 Boris Brezillon 2023-08-09   77  		 * We use this list to pick a VM to evict when all slots are
d9ea7e08c921d9 Boris Brezillon 2023-08-09   78  		 * used.
d9ea7e08c921d9 Boris Brezillon 2023-08-09   79  		 *
d9ea7e08c921d9 Boris Brezillon 2023-08-09   80  		 * There should be no more active VMs than there are AS slots,
d9ea7e08c921d9 Boris Brezillon 2023-08-09   81  		 * so this LRU is just here to keep VMs bound until there's
d9ea7e08c921d9 Boris Brezillon 2023-08-09   82  		 * a need to release a slot, thus avoid unnecessary TLB/cache
d9ea7e08c921d9 Boris Brezillon 2023-08-09   83  		 * flushes.
d9ea7e08c921d9 Boris Brezillon 2023-08-09   84  		 */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   85  		struct list_head lru_list;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   86  	} as;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   87  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   88  	/** @vm: VMs management fields */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   89  	struct {
d9ea7e08c921d9 Boris Brezillon 2023-08-09   90  		/** @lock: Lock protecting access to list. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   91  		struct mutex lock;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   92  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   93  		/** @list: List containing all VMs. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   94  		struct list_head list;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   95  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   96  		/** @reset_in_progress: True if a reset is in progress. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09   97  		bool reset_in_progress;
d9ea7e08c921d9 Boris Brezillon 2023-08-09   98  
d9ea7e08c921d9 Boris Brezillon 2023-08-09   99  		/** @wq: Workqueue used for the VM_BIND queues. */
d9ea7e08c921d9 Boris Brezillon 2023-08-09  100  		struct workqueue_struct *wq;
d9ea7e08c921d9 Boris Brezillon 2023-08-09  101  	} vm;
d9ea7e08c921d9 Boris Brezillon 2023-08-09 @102  };
d9ea7e08c921d9 Boris Brezillon 2023-08-09  103  

:::::: The code at line 102 was first introduced by commit
:::::: d9ea7e08c921d9316032d21c88cc310906884693 drm/panthor: Add the MMU/VM logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
