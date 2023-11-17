Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF311A73E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViNkctcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700225781; x=1731761781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKT1CpqSDkAISnvNVwVKqIi+qyJjeulmSFNrvy+e13U=;
  b=ViNkctcYuzhq48XjZVqgxTE1nRrZQ7wmaKCg3Mk7m2ci7J56PkCoej8U
   ITzdeBuHhkcId3BojyPQJ2mBgwAHm9Y0rAxp8RSmC7XVYhxqe5y0l5gpG
   wj3KXhoNzbSy+Kia9XiQO1dKXa49d20h4GCXRW+uUwAEnsDoH29CdVFNn
   lpa7xJ/lSK8Sbtoy4RfCk8jB/MVJA1z5q6/ku6uPK2F6zJ0nFOwY8Nl8Q
   VwGW0OCwoq3E3+NxVv0ySiFvnrQu9It0yQdYpVrlFOk8AFf1DlzJ3yKSd
   KWw32VkO5gUlb/OTK9tJLWvIpB0qlHS/hLdHM+csyPG+aqvQydSvNCaew
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390153187"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390153187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="7005051"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2023 04:56:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3yON-0002np-1c;
	Fri, 17 Nov 2023 12:56:15 +0000
Date: Fri, 17 Nov 2023 20:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 230/273] arch/x86/kvm/vmx/tdx.c:3438:
 undefined reference to `mce_is_memory_error'
Message-ID: <202311172053.MIxzAzwO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: 793537786e7a35dae54fed096914c0f04f56ece3 [230/273] [REVERTME] KVM: TDX: Clear memory poisoned bit on memory failure
config: x86_64-randconfig-072-20231117 (https://download.01.org/0day-ci/archive/20231117/202311172053.MIxzAzwO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172053.MIxzAzwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172053.MIxzAzwO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/vmx/tdx.o: in function `tdx_mce_notifier':
>> arch/x86/kvm/vmx/tdx.c:3438: undefined reference to `mce_is_memory_error'
   ld: arch/x86/kvm/vmx/tdx.o: in function `tdx_hardware_unsetup':
>> arch/x86/kvm/vmx/tdx.c:3757: undefined reference to `mce_unregister_decode_chain'
   ld: arch/x86/kvm/vmx/tdx.o: in function `tdx_hardware_setup':
>> arch/x86/kvm/vmx/tdx.c:3744: undefined reference to `mce_register_decode_chain'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +3438 arch/x86/kvm/vmx/tdx.c

  3419	
  3420	/* Clear poisoned bit to avoid further #MC */
  3421	static int tdx_mce_notifier(struct notifier_block *nb, unsigned long val,
  3422				    void *data)
  3423	{
  3424		const void *zero_page = (const void *) __va(page_to_phys(ZERO_PAGE(0)));
  3425		struct mce *m = (struct mce *)data;
  3426		unsigned long kaddr;
  3427		unsigned long addr;
  3428		struct page *page;
  3429		u16 hkid;
  3430	
  3431		/* Direct write is needed to clear poison bit. */
  3432		if (!boot_cpu_has(X86_FEATURE_MOVDIR64B))
  3433			return NOTIFY_DONE;
  3434	
  3435		/* Handle memory failure only. */
  3436		if (!m)
  3437			return NOTIFY_DONE;
> 3438		if (!mce_is_memory_error(m))
  3439			return NOTIFY_DONE;
  3440	
  3441		addr = m->addr & ((1ULL << boot_cpu_data.x86_phys_bits) - 1);
  3442		hkid = m->addr >> boot_cpu_data.x86_phys_bits;
  3443	
  3444		/* Is hkid used for TDX? */
  3445		if (hkid < tdx_global_keyid)
  3446			return NOTIFY_DONE;
  3447	
  3448		/*
  3449		 * MCE handler may make the page non-present in direct map. Map the page
  3450		 * to access.  Use VM_FLUSH_RESET_PERMS flag to tlb flush at vunmap()
  3451		 * and reset direct mapping region.
  3452		 */
  3453		page = pfn_to_page(addr >> PAGE_SHIFT);
  3454		kaddr = (unsigned long)vmap(&page, 1, VM_FLUSH_RESET_PERMS, PAGE_KERNEL);
  3455		if (!kaddr)
  3456			return NOTIFY_DONE;
  3457	
  3458		/* Adjust page offset. */
  3459		kaddr |= addr & ~PAGE_MASK;
  3460		/* Align to cache line. */
  3461		kaddr = ALIGN_DOWN(kaddr, 64);
  3462		/* Direct write to clear poison bit. */
  3463		movdir64b((void *)kaddr, zero_page);
  3464		__mb();
  3465	
  3466		vunmap((void *)(kaddr & PAGE_MASK));
  3467	
  3468		pr_err("cleared poisoned cache hkid 0x%x pa 0x%lx\n", hkid, addr);
  3469		return NOTIFY_DONE;
  3470	}
  3471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
