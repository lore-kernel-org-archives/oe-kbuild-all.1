Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D21AF0BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738273322; cv=none; b=p8bSEAMhjeGB27URDw0gi3GDVI5XdoilS5Rnodle66RsJML8gR20Iy2hWhhbja9pnkrrQMCOgStE9gp7mn63yzBb6tHv1vZ+gxALgq4sZiZ8rp4xP4YmxWO4JactV0O6bbeQAoxn6MUa5UdQqSXU4xD7z8zpA8ujiDOCIPTuyV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738273322; c=relaxed/simple;
	bh=RmGGFcMnlWnDTmzj7S3tqwGbFVkPpEZv61U0HAVctfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJbWIecBD4/Jtkqes/9QagwNYVKKKERfkqwEDc74g4Frw92lN9gEQwpzDAvIZmRzdumJK4rMBHS2FyL15QIO09eyffHdNH4JTFJJy+9MM1JiWdJn/ZLYwDQDiGehKDHpkCkuEbe6uP0Yc/XXazNwJh8zXeSwXnFd+81aRGL2f14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuH4J12g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuH4J12g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738273319; x=1769809319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmGGFcMnlWnDTmzj7S3tqwGbFVkPpEZv61U0HAVctfI=;
  b=NuH4J12git49BL+wg8CKTnzpTUohmg1bv7j+gZBzB34IpfdrJLz80eJv
   zv3+Ait9FbsGdIPmEa3svG1R+yFRjxPqXhRQxfZddlX/Xv1mTsrj8dUEX
   iBFfW0t/HS9n5PIwovLaF/Z5Zr2f6m2AINNanc1xkpwQWm2r235l7tDQp
   YpoVNJXZ8I9KuDoJzgpCpnJLoWT+d89+peE9OUEouKFSzn/easNvzZUtY
   4qdgJnKza++S++ak05lM1ONkaTnqD/MMHu8zTlaM5nU8AYj/rdCOo9wzT
   thC6sJ84/f2r4b6sczcR0PsCLcNDMMsLDGAHm6T6J4H/M3ypFq0F3Ss3z
   A==;
X-CSE-ConnectionGUID: 02c5TjPoRb+TvVxVsjJqEA==
X-CSE-MsgGUID: sfX/L8aeTkGVJRBl0vYDIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="41677923"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="41677923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 13:41:59 -0800
X-CSE-ConnectionGUID: 9Vg8kjZ3QnGoisWD1ghhbQ==
X-CSE-MsgGUID: MeXlbrhKSJSBqc241u9vbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140340312"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2025 13:41:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdcIN-000l0Z-2O;
	Thu, 30 Jan 2025 21:41:55 +0000
Date: Fri, 31 Jan 2025 05:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put()
 of guest_memfd pages
Message-ID: <202501310527.7xQxYqAN-lkp@intel.com>
References: <20250129172320.950523-3-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129172320.950523-3-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250130-012603
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250129172320.950523-3-tabba%40google.com
patch subject: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put() of guest_memfd pages
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250131/202501310527.7xQxYqAN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310527.7xQxYqAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310527.7xQxYqAN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/swap.c:17:
>> arch/x86/include/asm/kvm_host.h:569:47: error: 'X86_PMC_IDX_MAX' undeclared here (not in a function)
     569 |                 DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
         |                                               ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   include/linux/types.h:11:28: note: in expansion of macro 'BITS_TO_LONGS'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:569:17: note: in expansion of macro 'DECLARE_BITMAP'
     569 |                 DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
         |                 ^~~~~~~~~~~~~~
   In file included from include/linux/kvm_host.h:45,
                    from mm/swap.c:40:
>> arch/x86/include/asm/kvm_host.h:828:26: error: field 'guest_fpu' has incomplete type
     828 |         struct fpu_guest guest_fpu;
         |                          ^~~~~~~~~
>> arch/x86/include/asm/kvm_host.h:150:33: error: 'PG_LEVEL_1G' undeclared here (not in a function)
     150 | #define KVM_MAX_HUGEPAGE_LEVEL  PG_LEVEL_1G
         |                                 ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:151:34: note: in expansion of macro 'KVM_MAX_HUGEPAGE_LEVEL'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1051:36: note: in expansion of macro 'KVM_NR_PAGE_SIZES'
    1051 |         struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
         |                                    ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_host.h:151:59: error: 'PG_LEVEL_4K' undeclared here (not in a function)
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                                           ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1051:36: note: in expansion of macro 'KVM_NR_PAGE_SIZES'
    1051 |         struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
         |                                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_lapic_irq_dest_mode':
>> arch/x86/include/asm/kvm_host.h:1623:36: error: 'APIC_DEST_LOGICAL' undeclared (first use in this function)
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1623:36: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/kvm_host.h:1623:56: error: 'APIC_DEST_PHYSICAL' undeclared (first use in this function)
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                                        ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: At top level:
   arch/x86/include/asm/kvm_host.h:1670:55: warning: 'struct desc_ptr' declared inside parameter list will not be visible outside of this definition or declaration
    1670 |         void (*get_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^~~~~~~~
   arch/x86/include/asm/kvm_host.h:1671:55: warning: 'struct desc_ptr' declared inside parameter list will not be visible outside of this definition or declaration
    1671 |         void (*set_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^~~~~~~~
   arch/x86/include/asm/kvm_host.h:1672:55: warning: 'struct desc_ptr' declared inside parameter list will not be visible outside of this definition or declaration
    1672 |         void (*get_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^~~~~~~~
   arch/x86/include/asm/kvm_host.h:1673:55: warning: 'struct desc_ptr' declared inside parameter list will not be visible outside of this definition or declaration
    1673 |         void (*set_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'read_msr':
>> arch/x86/include/asm/kvm_host.h:2228:9: error: implicit declaration of function 'rdmsrl' [-Werror=implicit-function-declaration]
    2228 |         rdmsrl(msr, value);
         |         ^~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_irq_is_postable':
>> arch/x86/include/asm/kvm_host.h:2327:39: error: 'APIC_DM_FIXED' undeclared (first use in this function)
    2327 |         return (irq->delivery_mode == APIC_DM_FIXED ||
         |                                       ^~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_host.h:2328:39: error: 'APIC_DM_LOWEST' undeclared (first use in this function)
    2328 |                 irq->delivery_mode == APIC_DM_LOWEST);
         |                                       ^~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_cpu_get_apicid':
>> arch/x86/include/asm/kvm_host.h:2347:16: error: 'BAD_APICID' undeclared (first use in this function)
    2347 |         return BAD_APICID;
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/X86_PMC_IDX_MAX +569 arch/x86/include/asm/kvm_host.h

f5132b01386b5a Gleb Natapov        2011-11-10  533  
4f1fa2a1bbeb2f Like Xu             2022-09-19  534  /* More counters may conflict with other existing Architectural MSRs */
f287bef6ddc208 Dapeng Mi           2024-06-27  535  #define KVM_MAX(a, b)	((a) >= (b) ? (a) : (b))
f287bef6ddc208 Dapeng Mi           2024-06-27  536  #define KVM_MAX_NR_INTEL_GP_COUNTERS	8
f287bef6ddc208 Dapeng Mi           2024-06-27  537  #define KVM_MAX_NR_AMD_GP_COUNTERS	6
f287bef6ddc208 Dapeng Mi           2024-06-27  538  #define KVM_MAX_NR_GP_COUNTERS		KVM_MAX(KVM_MAX_NR_INTEL_GP_COUNTERS, \
f287bef6ddc208 Dapeng Mi           2024-06-27  539  						KVM_MAX_NR_AMD_GP_COUNTERS)
f287bef6ddc208 Dapeng Mi           2024-06-27  540  
f287bef6ddc208 Dapeng Mi           2024-06-27  541  #define KVM_MAX_NR_INTEL_FIXED_COUTNERS	3
f287bef6ddc208 Dapeng Mi           2024-06-27  542  #define KVM_MAX_NR_AMD_FIXED_COUTNERS	0
f287bef6ddc208 Dapeng Mi           2024-06-27  543  #define KVM_MAX_NR_FIXED_COUNTERS	KVM_MAX(KVM_MAX_NR_INTEL_FIXED_COUTNERS, \
f287bef6ddc208 Dapeng Mi           2024-06-27  544  						KVM_MAX_NR_AMD_FIXED_COUTNERS)
004a0aa56edea3 Sean Christopherson 2023-11-09  545  
f5132b01386b5a Gleb Natapov        2011-11-10  546  struct kvm_pmu {
12aad9164763bb Mathias Krause      2023-02-17  547  	u8 version;
f5132b01386b5a Gleb Natapov        2011-11-10  548  	unsigned nr_arch_gp_counters;
f5132b01386b5a Gleb Natapov        2011-11-10  549  	unsigned nr_arch_fixed_counters;
f5132b01386b5a Gleb Natapov        2011-11-10  550  	unsigned available_event_types;
f5132b01386b5a Gleb Natapov        2011-11-10  551  	u64 fixed_ctr_ctrl;
0e102ce3d41331 Dapeng Mi           2024-04-30  552  	u64 fixed_ctr_ctrl_rsvd;
f5132b01386b5a Gleb Natapov        2011-11-10  553  	u64 global_ctrl;
f5132b01386b5a Gleb Natapov        2011-11-10  554  	u64 global_status;
f5132b01386b5a Gleb Natapov        2011-11-10  555  	u64 counter_bitmask[2];
0e102ce3d41331 Dapeng Mi           2024-04-30  556  	u64 global_ctrl_rsvd;
0e102ce3d41331 Dapeng Mi           2024-04-30  557  	u64 global_status_rsvd;
103af0a9878859 Andi Kleen          2013-07-18  558  	u64 reserved_bits;
95b065bf5c431c Jim Mattson         2022-03-07  559  	u64 raw_event_mask;
f287bef6ddc208 Dapeng Mi           2024-06-27  560  	struct kvm_pmc gp_counters[KVM_MAX_NR_GP_COUNTERS];
f287bef6ddc208 Dapeng Mi           2024-06-27  561  	struct kvm_pmc fixed_counters[KVM_MAX_NR_FIXED_COUNTERS];
f1c5651fda43e0 Sean Christopherson 2022-09-23  562  
f1c5651fda43e0 Sean Christopherson 2022-09-23  563  	/*
f1c5651fda43e0 Sean Christopherson 2022-09-23  564  	 * Overlay the bitmap with a 64-bit atomic so that all bits can be
f1c5651fda43e0 Sean Christopherson 2022-09-23  565  	 * set in a single access, e.g. to reprogram all counters when the PMU
f1c5651fda43e0 Sean Christopherson 2022-09-23  566  	 * filter changes.
f1c5651fda43e0 Sean Christopherson 2022-09-23  567  	 */
f1c5651fda43e0 Sean Christopherson 2022-09-23  568  	union {
4be946728f65c1 Like Xu             2019-10-21 @569  		DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
f1c5651fda43e0 Sean Christopherson 2022-09-23  570  		atomic64_t __reprogram_pmi;
f1c5651fda43e0 Sean Christopherson 2022-09-23  571  	};
b35e5548b41131 Like Xu             2019-10-27  572  	DECLARE_BITMAP(all_valid_pmc_idx, X86_PMC_IDX_MAX);
b35e5548b41131 Like Xu             2019-10-27  573  	DECLARE_BITMAP(pmc_in_use, X86_PMC_IDX_MAX);
b35e5548b41131 Like Xu             2019-10-27  574  
8183a538cd95f7 Like Xu             2022-04-11  575  	u64 ds_area;
c59a1f106f5cd4 Like Xu             2022-04-11  576  	u64 pebs_enable;
0e102ce3d41331 Dapeng Mi           2024-04-30  577  	u64 pebs_enable_rsvd;
902caeb6841a64 Like Xu             2022-04-11  578  	u64 pebs_data_cfg;
0e102ce3d41331 Dapeng Mi           2024-04-30  579  	u64 pebs_data_cfg_rsvd;
c59a1f106f5cd4 Like Xu             2022-04-11  580  
854250329c02c0 Like Xu             2022-04-11  581  	/*
854250329c02c0 Like Xu             2022-04-11  582  	 * If a guest counter is cross-mapped to host counter with different
854250329c02c0 Like Xu             2022-04-11  583  	 * index, its PEBS capability will be temporarily disabled.
854250329c02c0 Like Xu             2022-04-11  584  	 *
854250329c02c0 Like Xu             2022-04-11  585  	 * The user should make sure that this mask is updated
854250329c02c0 Like Xu             2022-04-11  586  	 * after disabling interrupts and before perf_guest_get_msrs();
854250329c02c0 Like Xu             2022-04-11  587  	 */
854250329c02c0 Like Xu             2022-04-11  588  	u64 host_cross_mapped_mask;
854250329c02c0 Like Xu             2022-04-11  589  
b35e5548b41131 Like Xu             2019-10-27  590  	/*
b35e5548b41131 Like Xu             2019-10-27  591  	 * The gate to release perf_events not marked in
b35e5548b41131 Like Xu             2019-10-27  592  	 * pmc_in_use only once in a vcpu time slice.
b35e5548b41131 Like Xu             2019-10-27  593  	 */
b35e5548b41131 Like Xu             2019-10-27  594  	bool need_cleanup;
b35e5548b41131 Like Xu             2019-10-27  595  
b35e5548b41131 Like Xu             2019-10-27  596  	/*
b35e5548b41131 Like Xu             2019-10-27  597  	 * The total number of programmed perf_events and it helps to avoid
b35e5548b41131 Like Xu             2019-10-27  598  	 * redundant check before cleanup if guest don't use vPMU at all.
b35e5548b41131 Like Xu             2019-10-27  599  	 */
b35e5548b41131 Like Xu             2019-10-27  600  	u8 event_count;
f5132b01386b5a Gleb Natapov        2011-11-10  601  };
f5132b01386b5a Gleb Natapov        2011-11-10  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
