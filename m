Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD30101EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694784604; x=1726320604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKb0pKZU4T6x9lFqGX6Mn/zjzyMb2NDiMqrD1nssiYo=;
  b=I7GlYPY6gMedgxYdEv3YGTNXRkzCLNAreUjmmDbslXKOO8SEaCn2tfhJ
   cfDHbqGqdUu01LQU4j2Ab3uYR5iZs+vwqO77HbphDBtuBSOropwb76adD
   rvOXI+IvY5pmTvjpE3hawDA0z+hS6pfcQEgEdO+qJunfjfoIfbwfCF1Je
   04y1Xerxd3XEVJ3gjjH/9HYICzwMvKwxWXjr7DZHd1NnG1rgxs+CMNoWh
   OQ+ShUlZ9vAzNGQEug6cxP3kg72BgrdtppEdhj88Q5k2IJlVIXeJ+x4gn
   letWI4MahiIgV8wLae84Gwoj7IuRone7kEu5WxPyQbo9NvPxz9yodyrNW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="381976139"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="381976139"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="744985175"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="744985175"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 06:30:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh8tT-00030j-2T;
	Fri, 15 Sep 2023 13:29:59 +0000
Date: Fri, 15 Sep 2023 21:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 37/323]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1957:20: error: 'struct
 kvm_memory_slot' has no member named 'file'
Message-ID: <202309152115.KXtvN1BE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   5f6df2bb916b5aca21bbdc6962234979b1476ef1
commit: e840dbba5f248b69d48348cc1458e1980f624e24 [37/323] RFC: KVM: gmem: Guarantee the order of destruction
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230915/202309152115.KXtvN1BE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152115.KXtvN1BE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152115.KXtvN1BE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_set_memslot':
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1957:20: error: 'struct kvm_memory_slot' has no member named 'file'
    1957 |                 new->file = old->file;
         |                    ^~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1957:32: error: 'struct kvm_memory_slot' has no member named 'file'
    1957 |                 new->file = old->file;
         |                                ^~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1958:20: error: 'struct kvm_memory_slot' has no member named 'file'
    1958 |                 old->file = NULL;
         |                    ^~


vim +1957 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

  1908	
  1909	static int kvm_set_memslot(struct kvm *kvm,
  1910				   struct kvm_memory_slot *old,
  1911				   struct kvm_memory_slot *new,
  1912				   enum kvm_mr_change change)
  1913	{
  1914		struct kvm_memory_slot *invalid_slot;
  1915		int r;
  1916	
  1917		/*
  1918		 * Released in kvm_swap_active_memslots().
  1919		 *
  1920		 * Must be held from before the current memslots are copied until after
  1921		 * the new memslots are installed with rcu_assign_pointer, then
  1922		 * released before the synchronize srcu in kvm_swap_active_memslots().
  1923		 *
  1924		 * When modifying memslots outside of the slots_lock, must be held
  1925		 * before reading the pointer to the current memslots until after all
  1926		 * changes to those memslots are complete.
  1927		 *
  1928		 * These rules ensure that installing new memslots does not lose
  1929		 * changes made to the previous memslots.
  1930		 */
  1931		mutex_lock(&kvm->slots_arch_lock);
  1932	
  1933		/*
  1934		 * Invalidate the old slot if it's being deleted or moved.  This is
  1935		 * done prior to actually deleting/moving the memslot to allow vCPUs to
  1936		 * continue running by ensuring there are no mappings or shadow pages
  1937		 * for the memslot when it is deleted/moved.  Without pre-invalidation
  1938		 * (and without a lock), a window would exist between effecting the
  1939		 * delete/move and committing the changes in arch code where KVM or a
  1940		 * guest could access a non-existent memslot.
  1941		 *
  1942		 * Modifications are done on a temporary, unreachable slot.  The old
  1943		 * slot needs to be preserved in case a later step fails and the
  1944		 * invalidation needs to be reverted.
  1945		 */
  1946		if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
  1947			invalid_slot = kzalloc(sizeof(*invalid_slot), GFP_KERNEL_ACCOUNT);
  1948			if (!invalid_slot) {
  1949				mutex_unlock(&kvm->slots_arch_lock);
  1950				return -ENOMEM;
  1951			}
  1952			kvm_invalidate_memslot(kvm, old, invalid_slot);
  1953		}
  1954	
  1955	
  1956		if (new && old) {
> 1957			new->file = old->file;
  1958			old->file = NULL;
  1959		}
  1960		r = kvm_prepare_memory_region(kvm, old, new, change);
  1961		if (r) {
  1962			/*
  1963			 * For DELETE/MOVE, revert the above INVALID change.  No
  1964			 * modifications required since the original slot was preserved
  1965			 * in the inactive slots.  Changing the active memslots also
  1966			 * release slots_arch_lock.
  1967			 */
  1968			if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
  1969				kvm_activate_memslot(kvm, invalid_slot, old);
  1970				kfree(invalid_slot);
  1971			} else {
  1972				mutex_unlock(&kvm->slots_arch_lock);
  1973			}
  1974			return r;
  1975		}
  1976	
  1977		/*
  1978		 * For DELETE and MOVE, the working slot is now active as the INVALID
  1979		 * version of the old slot.  MOVE is particularly special as it reuses
  1980		 * the old slot and returns a copy of the old slot (in working_slot).
  1981		 * For CREATE, there is no old slot.  For DELETE and FLAGS_ONLY, the
  1982		 * old slot is detached but otherwise preserved.
  1983		 */
  1984		if (change == KVM_MR_CREATE)
  1985			kvm_create_memslot(kvm, new);
  1986		else if (change == KVM_MR_DELETE)
  1987			kvm_delete_memslot(kvm, old, invalid_slot);
  1988		else if (change == KVM_MR_MOVE)
  1989			kvm_move_memslot(kvm, old, new, invalid_slot);
  1990		else if (change == KVM_MR_FLAGS_ONLY)
  1991			kvm_update_flags_memslot(kvm, old, new);
  1992		else
  1993			BUG();
  1994	
  1995		/* Free the temporary INVALID slot used for DELETE and MOVE. */
  1996		if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
  1997			kfree(invalid_slot);
  1998	
  1999		/*
  2000		 * No need to refresh new->arch, changes after dropping slots_arch_lock
  2001		 * will directly hit the final, active memslot.  Architectures are
  2002		 * responsible for knowing that new->arch may be stale.
  2003		 */
  2004		kvm_commit_memory_region(kvm, old, new, change);
  2005	
  2006		return 0;
  2007	}
  2008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
