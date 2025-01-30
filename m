Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694B1E522
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247029; cv=none; b=ZWfPwgFTV07MLYpbo17YrXN/SJfQqXs9TdqmtDwHzE9CHywVSUQgrTemKzTxIAdx/H5fz22mCBxPp0GwubW2Vduy1RoQplTbIQMLOGMxkPwKLQNrLLpAd3OGNOYTiu289Cy++hlQkcf/AU1v4CuieDihEZxGTJNzsCQa2HVISrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247029; c=relaxed/simple;
	bh=hZL2vxjdFDBqUVuVBpUA0T2WRKY3/I4KOBjjKeZ+FLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRWDRthJGmwe31mjoVongnblrO3EKVX0WVieTjvMs5HXEmJBRyls1zHKJeX5c6cHq8pdpyFO/snTL42S6mcLMVEAwoQbGxZRlfBm14eiSQ2V1DIjI1SAXu8toCkNfDSF3IR4WMGYzIVP0v/km4J+GmF3K7cNlgOHpSvVSaTJPus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+X1IT37; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+X1IT37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738247027; x=1769783027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZL2vxjdFDBqUVuVBpUA0T2WRKY3/I4KOBjjKeZ+FLQ=;
  b=C+X1IT37ouZ1EEoW5kacFODm4CGzPNwZpy6gzC6VLk75Vi3Hcu7h6Xdt
   0zR1gt7Pa4aAcTk/ZzeG11jIsmHXTEqOo/Ac8Bqc3OUnp0NyCpRDq0Ak8
   tC3LLqPXV4tAk2YkII5IjCRh3jX286hQaRfLa7Z8/SZy2nKPwjFtng0IC
   AO0aqsWGC77i7pxiO3wEa8Oy35ZAN84FmGd2bYcCcEMMpWhjmonQ662Xo
   FE417kvIzajExUhg+vN+DHTrXfnvq7yqwh43U11CFwVX5OX9sYuQvkrkd
   tOmJNf8pfd+24PRg4HyRiMSehBN3yT7ENriy8gjCIOfX3VVsFLuYY040z
   Q==;
X-CSE-ConnectionGUID: bP5enwoeQxa+QwVd+KxEww==
X-CSE-MsgGUID: ePrtW4/5SjGu+2IGh8u7IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50173945"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="50173945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 06:23:46 -0800
X-CSE-ConnectionGUID: ctC0eYT6TeKMq8jRsdH0WQ==
X-CSE-MsgGUID: fFlbhr9XRz2WkiK/voFsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114488619"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2025 06:23:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdVSI-000kDb-0t;
	Thu, 30 Jan 2025 14:23:42 +0000
Date: Thu, 30 Jan 2025 22:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put()
 of guest_memfd pages
Message-ID: <202501302255.5PtPuPoM-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250130-012603
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250129172320.950523-3-tabba%40google.com
patch subject: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put() of guest_memfd pages
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250130/202501302255.5PtPuPoM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302255.5PtPuPoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302255.5PtPuPoM-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/x86/include/asm/kvm_host.h:569:47: error: 'X86_PMC_IDX_MAX' undeclared here (not in a function)
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
   arch/x86/include/asm/kvm_host.h:828:26: error: field 'guest_fpu' has incomplete type
     828 |         struct fpu_guest guest_fpu;
         |                          ^~~~~~~~~
   arch/x86/include/asm/kvm_host.h:150:33: error: 'PG_LEVEL_1G' undeclared here (not in a function)
     150 | #define KVM_MAX_HUGEPAGE_LEVEL  PG_LEVEL_1G
         |                                 ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:151:34: note: in expansion of macro 'KVM_MAX_HUGEPAGE_LEVEL'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1051:36: note: in expansion of macro 'KVM_NR_PAGE_SIZES'
    1051 |         struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
         |                                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:151:59: error: 'PG_LEVEL_4K' undeclared here (not in a function)
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                                           ^~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1051:36: note: in expansion of macro 'KVM_NR_PAGE_SIZES'
    1051 |         struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
         |                                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_lapic_irq_dest_mode':
   arch/x86/include/asm/kvm_host.h:1623:36: error: 'APIC_DEST_LOGICAL' undeclared (first use in this function)
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1623:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/kvm_host.h:1623:56: error: 'APIC_DEST_PHYSICAL' undeclared (first use in this function)
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                                        ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: At top level:
>> arch/x86/include/asm/kvm_host.h:1670:55: warning: 'struct desc_ptr' declared inside parameter list will not be visible outside of this definition or declaration
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
   arch/x86/include/asm/kvm_host.h:2228:9: error: implicit declaration of function 'rdmsrl' [-Werror=implicit-function-declaration]
    2228 |         rdmsrl(msr, value);
         |         ^~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_irq_is_postable':
   arch/x86/include/asm/kvm_host.h:2327:39: error: 'APIC_DM_FIXED' undeclared (first use in this function)
    2327 |         return (irq->delivery_mode == APIC_DM_FIXED ||
         |                                       ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2328:39: error: 'APIC_DM_LOWEST' undeclared (first use in this function)
    2328 |                 irq->delivery_mode == APIC_DM_LOWEST);
         |                                       ^~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h: In function 'kvm_cpu_get_apicid':
   arch/x86/include/asm/kvm_host.h:2347:16: error: 'BAD_APICID' undeclared (first use in this function)
    2347 |         return BAD_APICID;
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1670 arch/x86/include/asm/kvm_host.h

c96001c5702e66 arch/x86/include/asm/kvm_host.h Peter Xu              2019-12-04  1625  
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1626  struct kvm_x86_ops {
9dadfc4a6145e1 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-10-18  1627  	const char *name;
9dadfc4a6145e1 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-10-18  1628  
d83420c2d74e66 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-11-30  1629  	int (*check_processor_compatibility)(void);
d83420c2d74e66 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-11-30  1630  
0617a769ce16b8 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-08-29  1631  	int (*enable_virtualization_cpu)(void);
0617a769ce16b8 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-08-29  1632  	void (*disable_virtualization_cpu)(void);
590b09b1d88e18 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-08-29  1633  	cpu_emergency_virt_cb *emergency_disable_virtualization_cpu;
590b09b1d88e18 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-08-29  1634  
6e4fd06f3ee1b1 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-21  1635  	void (*hardware_unsetup)(void);
5719455fbd952a arch/x86/include/asm/kvm_host.h Tom Lendacky          2020-12-10  1636  	bool (*has_emulated_msr)(struct kvm *kvm, u32 index);
7c1b761be029da arch/x86/include/asm/kvm_host.h Xiaoyao Li            2020-07-09  1637  	void (*vcpu_after_set_cpuid)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1638  
562b6b089d6472 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-01-26  1639  	unsigned int vm_size;
03543133cea646 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1640  	int (*vm_init)(struct kvm *kvm);
03543133cea646 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1641  	void (*vm_destroy)(struct kvm *kvm);
03543133cea646 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1642  
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1643  	/* Create, but do not attach this VCPU */
d588bb9be1da6a arch/x86/include/asm/kvm_host.h Chao Gao              2022-04-19  1644  	int (*vcpu_precreate)(struct kvm *kvm);
987b2594ed5d12 arch/x86/include/asm/kvm_host.h Sean Christopherson   2019-12-18  1645  	int (*vcpu_create)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1646  	void (*vcpu_free)(struct kvm_vcpu *vcpu);
d28bc9dd25ce02 arch/x86/include/asm/kvm_host.h Nadav Amit            2015-04-13  1647  	void (*vcpu_reset)(struct kvm_vcpu *vcpu, bool init_event);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1648  
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1649  	void (*prepare_switch_to_guest)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1650  	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1651  	void (*vcpu_put)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1652  
6986982fef86ae arch/x86/include/asm/kvm_host.h Paolo Bonzini         2020-07-10  1653  	void (*update_exception_bitmap)(struct kvm_vcpu *vcpu);
609e36d372ad93 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2015-04-08  1654  	int (*get_msr)(struct kvm_vcpu *vcpu, struct msr_data *msr);
8fe8ab46be06fc arch/x86/include/asm/kvm_host.h Will Auld             2012-11-29  1655  	int (*set_msr)(struct kvm_vcpu *vcpu, struct msr_data *msr);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1656  	u64 (*get_segment_base)(struct kvm_vcpu *vcpu, int seg);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1657  	void (*get_segment)(struct kvm_vcpu *vcpu,
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1658  			    struct kvm_segment *var, int seg);
2e4d2653497856 include/asm-x86/kvm_host.h      Izik Eidus            2008-03-24  1659  	int (*get_cpl)(struct kvm_vcpu *vcpu);
f0e7012c4b9386 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-10-09  1660  	int (*get_cpl_no_cache)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1661  	void (*set_segment)(struct kvm_vcpu *vcpu,
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1662  			    struct kvm_segment *var, int seg);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1663  	void (*get_cs_db_l_bits)(struct kvm_vcpu *vcpu, int *db, int *l);
26a0652cb453c7 arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-06-13  1664  	bool (*is_valid_cr0)(struct kvm_vcpu *vcpu, unsigned long cr0);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1665  	void (*set_cr0)(struct kvm_vcpu *vcpu, unsigned long cr0);
405329fc9aeef1 arch/x86/include/asm/kvm_host.h Michael Roth          2021-12-16  1666  	void (*post_set_cr3)(struct kvm_vcpu *vcpu, unsigned long cr3);
26a0652cb453c7 arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-06-13  1667  	bool (*is_valid_cr4)(struct kvm_vcpu *vcpu, unsigned long cr4);
c2fe3cd4604ac8 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-10-06  1668  	void (*set_cr4)(struct kvm_vcpu *vcpu, unsigned long cr4);
72f211ecaa80a0 arch/x86/include/asm/kvm_host.h Maxim Levitsky        2020-10-01  1669  	int (*set_efer)(struct kvm_vcpu *vcpu, u64 efer);
89a27f4d0e042a arch/x86/include/asm/kvm_host.h Gleb Natapov          2010-02-16 @1670  	void (*get_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
89a27f4d0e042a arch/x86/include/asm/kvm_host.h Gleb Natapov          2010-02-16  1671  	void (*set_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
89a27f4d0e042a arch/x86/include/asm/kvm_host.h Gleb Natapov          2010-02-16  1672  	void (*get_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
89a27f4d0e042a arch/x86/include/asm/kvm_host.h Gleb Natapov          2010-02-16  1673  	void (*set_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
c77fb5fe6f031b arch/x86/include/asm/kvm_host.h Paolo Bonzini         2014-02-21  1674  	void (*sync_dirty_debug_regs)(struct kvm_vcpu *vcpu);
020df0794f5764 arch/x86/include/asm/kvm_host.h Gleb Natapov          2010-04-13  1675  	void (*set_dr7)(struct kvm_vcpu *vcpu, unsigned long value);
5fdbf9765b7ba6 include/asm-x86/kvm_host.h      Marcelo Tosatti       2008-06-27  1676  	void (*cache_reg)(struct kvm_vcpu *vcpu, enum kvm_reg reg);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1677  	unsigned long (*get_rflags)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1678  	void (*set_rflags)(struct kvm_vcpu *vcpu, unsigned long rflags);
c5063551bfcae4 arch/x86/include/asm/kvm_host.h Marc Orr              2021-12-09  1679  	bool (*get_if_flag)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1680  
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1681  	void (*flush_tlb_all)(struct kvm_vcpu *vcpu);
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1682  	void (*flush_tlb_current)(struct kvm_vcpu *vcpu);
0277022a77a56f arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-10-18  1683  #if IS_ENABLED(CONFIG_HYPERV)
8a1300ff95185b arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-04-04  1684  	int  (*flush_remote_tlbs)(struct kvm *kvm);
9ed3bf411226f4 arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-04-04  1685  	int  (*flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
9ed3bf411226f4 arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-04-04  1686  					gfn_t nr_pages);
0277022a77a56f arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-10-18  1687  #endif
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1688  
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1689  	/*
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1690  	 * Flush any TLB entries associated with the given GVA.
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1691  	 * Does not need to flush GPA->HPA mappings.
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1692  	 * Can potentially get non-canonical addresses through INVLPGs, which
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1693  	 * the implementation may choose to ignore if appropriate.
faff87588d8bfd arch/x86/include/asm/kvm_host.h Junaid Shahid         2018-06-29  1694  	 */
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1695  	void (*flush_tlb_gva)(struct kvm_vcpu *vcpu, gva_t addr);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1696  
e64419d991ea21 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1697  	/*
e64419d991ea21 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1698  	 * Flush any TLB entries created by the guest.  Like tlb_flush_gva(),
e64419d991ea21 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1699  	 * does not need to flush GPA->HPA mappings.
e64419d991ea21 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1700  	 */
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1701  	void (*flush_tlb_guest)(struct kvm_vcpu *vcpu);
e64419d991ea21 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1702  
fc4fad79fc3d88 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-12-28  1703  	int (*vcpu_pre_run)(struct kvm_vcpu *vcpu);
9c9025ea003a03 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-01-09  1704  	enum exit_fastpath_completion (*vcpu_run)(struct kvm_vcpu *vcpu,
9c9025ea003a03 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-01-09  1705  						  bool force_immediate_exit);
1e9e2622a149e8 arch/x86/include/asm/kvm_host.h Wanpeng Li            2019-11-21  1706  	int (*handle_exit)(struct kvm_vcpu *vcpu,
1e9e2622a149e8 arch/x86/include/asm/kvm_host.h Wanpeng Li            2019-11-21  1707  		enum exit_fastpath_completion exit_fastpath);
f8ea7c6049d5d0 arch/x86/include/asm/kvm_host.h Vitaly Kuznetsov      2019-08-13  1708  	int (*skip_emulated_instruction)(struct kvm_vcpu *vcpu);
5ef8acbdd687c9 arch/x86/include/asm/kvm_host.h Oliver Upton          2020-02-07  1709  	void (*update_emulated_instruction)(struct kvm_vcpu *vcpu);
2809f5d2c4cfad arch/x86/include/asm/kvm_host.h Glauber Costa         2009-05-12  1710  	void (*set_interrupt_shadow)(struct kvm_vcpu *vcpu, int mask);
37ccdcbe075719 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2014-05-20  1711  	u32 (*get_interrupt_shadow)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1712  	void (*patch_hypercall)(struct kvm_vcpu *vcpu,
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1713  				unsigned char *hypercall_addr);
2d61391270a3ce arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-05-02  1714  	void (*inject_irq)(struct kvm_vcpu *vcpu, bool reinjected);
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1715  	void (*inject_nmi)(struct kvm_vcpu *vcpu);
6ad75c5c99f78e arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-08-30  1716  	void (*inject_exception)(struct kvm_vcpu *vcpu);
b463a6f744a263 arch/x86/include/asm/kvm_host.h Avi Kivity            2010-07-20  1717  	void (*cancel_injection)(struct kvm_vcpu *vcpu);
c9d40913ac5a21 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2020-05-22  1718  	int (*interrupt_allowed)(struct kvm_vcpu *vcpu, bool for_injection);
c9d40913ac5a21 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2020-05-22  1719  	int (*nmi_allowed)(struct kvm_vcpu *vcpu, bool for_injection);
3cfc3092f40bc3 arch/x86/include/asm/kvm_host.h Jan Kiszka            2009-11-12  1720  	bool (*get_nmi_mask)(struct kvm_vcpu *vcpu);
3cfc3092f40bc3 arch/x86/include/asm/kvm_host.h Jan Kiszka            2009-11-12  1721  	void (*set_nmi_mask)(struct kvm_vcpu *vcpu, bool masked);
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1722  	/* Whether or not a virtual NMI is pending in hardware. */
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1723  	bool (*is_vnmi_pending)(struct kvm_vcpu *vcpu);
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1724  	/*
54aa699e8094ef arch/x86/include/asm/kvm_host.h Bjorn Helgaas         2024-01-02  1725  	 * Attempt to pend a virtual NMI in hardware.  Returns %true on success
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1726  	 * to allow using static_call_ret0 as the fallback.
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1727  	 */
fa4c027a7956f5 arch/x86/include/asm/kvm_host.h Santosh Shukla        2023-02-27  1728  	bool (*set_vnmi_pending)(struct kvm_vcpu *vcpu);
c9a7953f09bbe2 arch/x86/include/asm/kvm_host.h Jan Kiszka            2014-03-07  1729  	void (*enable_nmi_window)(struct kvm_vcpu *vcpu);
c9a7953f09bbe2 arch/x86/include/asm/kvm_host.h Jan Kiszka            2014-03-07  1730  	void (*enable_irq_window)(struct kvm_vcpu *vcpu);
95ba82731374eb arch/x86/include/asm/kvm_host.h Gleb Natapov          2009-04-21  1731  	void (*update_cr8_intercept)(struct kvm_vcpu *vcpu, int tpr, int irr);
73b42dc69be856 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-07-19  1732  
73b42dc69be856 arch/x86/include/asm/kvm_host.h Sean Christopherson   2024-07-19  1733  	const bool x2apic_icr_is_split;
b3f257a846960d arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-01-06  1734  	const unsigned long required_apicv_inhibits;
2008fab3453019 arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-01-06  1735  	bool allow_apicv_in_x2apic_without_x2apic_virtualization;
d62caabb41f33d arch/x86/include/asm/kvm_host.h Andrey Smetanin       2015-11-10  1736  	void (*refresh_apicv_exec_ctrl)(struct kvm_vcpu *vcpu);
c7c9c56ca26f7b arch/x86/include/asm/kvm_host.h Yang Zhang            2013-01-25  1737  	void (*hwapic_irr_update)(struct kvm_vcpu *vcpu, int max_irr);
d39850f57d2102 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-06-14  1738  	void (*hwapic_isr_update)(int isr);
6308630bd3dbb6 arch/x86/include/asm/kvm_host.h Andrey Smetanin       2015-11-10  1739  	void (*load_eoi_exitmap)(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap);
8d860bbeedef97 arch/x86/include/asm/kvm_host.h Jim Mattson           2018-05-09  1740  	void (*set_virtual_apic_mode)(struct kvm_vcpu *vcpu);
a4148b7ca2a5af arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-20  1741  	void (*set_apic_access_page_addr)(struct kvm_vcpu *vcpu);
57dfd7b53dec74 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1742  	void (*deliver_interrupt)(struct kvm_lapic *apic, int delivery_mode,
57dfd7b53dec74 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1743  				  int trig_mode, int vector);
76dfafd536730e arch/x86/include/asm/kvm_host.h Paolo Bonzini         2016-12-19  1744  	int (*sync_pir_to_irr)(struct kvm_vcpu *vcpu);
ea4a5ff80c24a2 drivers/kvm/x86.h               Zhang Xiantao         2007-11-19  1745  	int (*set_tss_addr)(struct kvm *kvm, unsigned int addr);
2ac52ab861b920 arch/x86/include/asm/kvm_host.h Sean Christopherson   2018-03-20  1746  	int (*set_identity_map_addr)(struct kvm *kvm, u64 ident_addr);
ba28401bb93e5c arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-07-14  1747  	u8 (*get_mt_mask)(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio);
344f414fa0f162 arch/x86/include/asm/kvm_host.h Joerg Roedel          2009-07-27  1748  
e83bc09caf1671 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-03-05  1749  	void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
e83bc09caf1671 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-03-05  1750  			     int root_level);
727a7e27cf88a2 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2020-03-05  1751  
f5f48ee15c2ee3 arch/x86/include/asm/kvm_host.h Sheng Yang            2010-06-30  1752  	bool (*has_wbinvd_exit)(void);
f5f48ee15c2ee3 arch/x86/include/asm/kvm_host.h Sheng Yang            2010-06-30  1753  
307a94c721fed1 arch/x86/include/asm/kvm_host.h Ilias Stamatis        2021-05-26  1754  	u64 (*get_l2_tsc_offset)(struct kvm_vcpu *vcpu);
307a94c721fed1 arch/x86/include/asm/kvm_host.h Ilias Stamatis        2021-05-26  1755  	u64 (*get_l2_tsc_multiplier)(struct kvm_vcpu *vcpu);
2d63699099ac1f arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-07-28  1756  	void (*write_tsc_offset)(struct kvm_vcpu *vcpu);
2d63699099ac1f arch/x86/include/asm/kvm_host.h Sean Christopherson   2023-07-28  1757  	void (*write_tsc_multiplier)(struct kvm_vcpu *vcpu);
99e3e30aee1a32 arch/x86/include/asm/kvm_host.h Zachary Amsden        2010-08-19  1758  
235ba74f008d2e arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-09-23  1759  	/*
0a62a0319abb92 arch/x86/include/asm/kvm_host.h David Edmondson       2021-09-20  1760  	 * Retrieve somewhat arbitrary exit information.  Intended to
0a62a0319abb92 arch/x86/include/asm/kvm_host.h David Edmondson       2021-09-20  1761  	 * be used only from within tracepoints or error paths.
235ba74f008d2e arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-09-23  1762  	 */
0a62a0319abb92 arch/x86/include/asm/kvm_host.h David Edmondson       2021-09-20  1763  	void (*get_exit_info)(struct kvm_vcpu *vcpu, u32 *reason,
0a62a0319abb92 arch/x86/include/asm/kvm_host.h David Edmondson       2021-09-20  1764  			      u64 *info1, u64 *info2,
235ba74f008d2e arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-09-23  1765  			      u32 *exit_int_info, u32 *exit_int_info_err_code);
8a76d7f25f8f24 arch/x86/include/asm/kvm_host.h Joerg Roedel          2011-04-04  1766  
8a76d7f25f8f24 arch/x86/include/asm/kvm_host.h Joerg Roedel          2011-04-04  1767  	int (*check_intercept)(struct kvm_vcpu *vcpu,
8a76d7f25f8f24 arch/x86/include/asm/kvm_host.h Joerg Roedel          2011-04-04  1768  			       struct x86_instruction_info *info,
21f1b8f29ea5b2 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-02-18  1769  			       enum x86_intercept_stage stage,
21f1b8f29ea5b2 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-02-18  1770  			       struct x86_exception *exception);
a9ab13ff6e844a arch/x86/include/asm/kvm_host.h Wanpeng Li            2020-04-10  1771  	void (*handle_exit_irqoff)(struct kvm_vcpu *vcpu);
7f5581f5929849 arch/x86/include/asm/kvm_host.h Sean Christopherson   2020-03-02  1772  
88178fd4f7187b arch/x86/include/asm/kvm_host.h Kai Huang             2015-01-28  1773  	/*
a018eba53870aa arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-02-12  1774  	 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer.  A zero
a018eba53870aa arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-02-12  1775  	 * value indicates CPU dirty logging is unsupported or disabled.
88178fd4f7187b arch/x86/include/asm/kvm_host.h Kai Huang             2015-01-28  1776  	 */
6dd03800b1afe4 arch/x86/include/asm/kvm_host.h Sean Christopherson   2021-02-12  1777  	int cpu_dirty_log_size;
a85863c2ec55ed arch/x86/include/asm/kvm_host.h Makarand Sonare       2021-02-12  1778  	void (*update_cpu_dirty_logging)(struct kvm_vcpu *vcpu);
bab4165e2f0319 arch/x86/include/asm/kvm_host.h Bandan Das            2017-05-05  1779  
33b22172452f05 arch/x86/include/asm/kvm_host.h Paolo Bonzini         2020-04-17  1780  	const struct kvm_x86_nested_ops *nested_ops;
efc644048ecde5 arch/x86/include/asm/kvm_host.h Feng Wu               2015-09-18  1781  
d1ed092f77ef56 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1782  	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
d1ed092f77ef56 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1783  	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
d1ed092f77ef56 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1784  
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1785  	int (*pi_update_irte)(struct kvm *kvm, unsigned int host_irq,
efc644048ecde5 arch/x86/include/asm/kvm_host.h Feng Wu               2015-09-18  1786  			      uint32_t guest_irq, bool set);
e27bc0440ebd14 arch/x86/include/asm/kvm_host.h Sean Christopherson   2022-01-28  1787  	void (*pi_start_assignment)(struct kvm *kvm);
9cfec6d097c607 arch/x86/include/asm/kvm_host.h Haitao Shan           2023-09-12  1788  	void (*apicv_pre_state_restore)(struct kvm_vcpu *vcpu);
be8ca170edf342 arch/x86/include/asm/kvm_host.h Suravee Suthikulpanit 2016-05-04  1789  	void (*apicv_post_state_restore)(struct kvm_vcpu *vcpu);
17e433b54393a6 arch/x86/include/asm/kvm_host.h Wanpeng Li            2019-08-05  1790  	bool (*dy_apicv_has_pending_interrupt)(struct kvm_vcpu *vcpu);
ce7a058a2117f0 arch/x86/include/asm/kvm_host.h Yunhong Jiang         2016-06-13  1791  
f99279825ee30b arch/x86/include/asm/kvm_host.h Sean Christopherson   2019-04-16  1792  	int (*set_hv_timer)(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
f99279825ee30b arch/x86/include/asm/kvm_host.h Sean Christopherson   2019-04-16  1793  			    bool *expired);
ce7a058a2117f0 arch/x86/include/asm/kvm_host.h Yunhong Jiang         2016-06-13  1794  	void (*cancel_hv_timer)(struct kvm_vcpu *vcpu);
c45dcc71b794b5 arch/x86/include/asm/kvm_host.h Ashok Raj             2016-06-22  1795  
c45dcc71b794b5 arch/x86/include/asm/kvm_host.h Ashok Raj             2016-06-22  1796  	void (*setup_mce)(struct kvm_vcpu *vcpu);
0234bf885236a4 arch/x86/include/asm/kvm_host.h Ladi Prosek           2017-10-11  1797  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
