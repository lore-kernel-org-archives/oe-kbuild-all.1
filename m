Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327D623
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689475152; x=1721011152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/u98GDQThFaIJh3QdsxbM6yRM2WEodGp/RoctXBGrws=;
  b=Ejki5j43WDNjLiupD/u4F616nSc2Nmd4ckozNlEPcgrjWdI1zg07rNtS
   /pyL55K/8z7kcTNdFZB/BcLt2HQohQHgH8NlZgKKk+cF/uHkT4uJbB8eQ
   uTft5Gx4N6MvoTKdDkm/6zGPufVKQlAcoNrtCEGo8HnbsQXx6ACWpHhJA
   ojXW01qExXMZHj4ny+VSo/WdDgKP6JrPOUPrry0jUeRQBtBheDMHc80nJ
   267a2ZraVHTrtnhiZhxkQ4YmQgmFwmIdlnlnZZw0PZUDHVIdM5xVXm7Hc
   iSr82wyQIkDVtAfBRlRL9Tf+EeHelRPhzSbaItyxHEZcsI9M6vHO3DDm7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="355658835"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="355658835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788238063"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788238063"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 19:39:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrfB-0008UK-2d;
	Sun, 16 Jul 2023 02:39:09 +0000
Date: Sun, 16 Jul 2023 10:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 41/365]
 include/linux/kvm_host.h:2369: multiple definition of
 `kvm_arch_gmem_invalidate';
 arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined
 here
Message-ID: <202307161052.1qT9XEJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: f3918645dc85801290d3e7cf1c2ce9e19b1d8489 [41/365] KVM: x86: Add gmem hook for invalidating private memory
config: i386-randconfig-i002-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161052.1qT9XEJh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161052.1qT9XEJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161052.1qT9XEJh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: virt/kvm/kvm_main.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/eventfd.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/binary_stats.o: in function `kvm_arch_gmem_invalidate':
   arch/x86/kvm/../../../virt/kvm/binary_stats.c:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/vfio.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/coalesced_mmio.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/async_pf.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/irqchip.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/dirty_ring.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: virt/kvm/pfncache.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/x86.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/emulate.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/i8259.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/irq.o: in function `kvm_arch_gmem_invalidate':
   arch/x86/kvm/irq.c:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/lapic.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/i8254.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/ioapic.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/irq_comm.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/cpuid.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/pmu.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/mtrr.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/hyperv.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/debugfs.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/mmu/mmu.o: in function `kvm_arch_gmem_invalidate':
   include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/mmu/page_track.o: in function `kvm_arch_gmem_invalidate':
   include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/mmu/spte.o: in function `kvm_arch_gmem_invalidate':
   include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: arch/x86/kvm/xen.o: in function `kvm_arch_gmem_invalidate':
   include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here
   ld: kernel/entry/kvm.o: in function `kvm_arch_gmem_invalidate':
   include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here


vim +2369 include/linux/kvm_host.h

  2368	
> 2369	void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
  2370	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
