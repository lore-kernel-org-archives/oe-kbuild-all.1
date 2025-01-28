Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8811A0B08
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738105488; cv=none; b=ILWsH7el+rcIR4kF+b0WJ7UX9H7AHg+QtixuCtz3LyLyIdQCvocOoOPC7df5ReSaspLc3kkg96dVWKPoIpkZ+OapG5JBy0SLYMZQblVPZRZibMJdnEXFRBgwIKZ5+dwyvQCMADqVR9NSZvUvoNsuFbLFDznluYeN+k82RrIk7Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738105488; c=relaxed/simple;
	bh=On3cZ82D1k6wvyVorI2QRCn6MGmVG4i181OHC/QduZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JISMubljyIieIMoNDS/V9Pe6ccyUWniXGx0JKujietPYFjUaTO51M5G/JstIA37xA0PP4zDZwreyJHKYMl7wV/e5a8IqyHzha+ATIEH9pnW5cLumXJWZ0TB45dKd7m9ku/yd+0nIPjP6jp93ddYA6vpE9IN98TyPjlLSC73hMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVCJr5nq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVCJr5nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738105487; x=1769641487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=On3cZ82D1k6wvyVorI2QRCn6MGmVG4i181OHC/QduZE=;
  b=OVCJr5nqzzBayutDWrK2Ck9zXJfoCg6CyQls16kQ6q8Z6R8EIKGoCk5A
   5hWiJE6zSiUF/Uxcuxi1+6B3h3z2RU+WRxsdyx3jYAgdoyqv4xguHDzlG
   XvWbvC++fMsZcmGgBNKTADm6pr4ycQcEK84A4IUMf8cgk7Hdf5zkQy48s
   p0vp8LGZGbYb9I8NgGGkJXazKRH6AXa013oB91W8dboeT+vAyn2B0U7q3
   fX0+szHHAovmmrzmeySRN63eONag4C6mCTE62Fa9V72Vua4Iu7n0x9jF9
   8ZO7+x2V/SgvCbOeOCksbLizcHX4NIN2qxDxJeqbwqG1JYgem8JDYTVM1
   w==;
X-CSE-ConnectionGUID: vblob8SGQXKPdnQz/TajjQ==
X-CSE-MsgGUID: dJcvn6MDT0Wi4dBuwgRLJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38516270"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38516270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 15:04:43 -0800
X-CSE-ConnectionGUID: aaG4Uu3+T228lfJpymdLHw==
X-CSE-MsgGUID: L7rF33VDQCSpQcMEEB9Ijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109788551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 15:04:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcudL-000iK7-2p;
	Tue, 28 Jan 2025 23:04:39 +0000
Date: Wed, 29 Jan 2025 07:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 04/14] x86/virt/tdx: Add SEAMCALL wrappers for TDX
 page cache management
Message-ID: <202501290644.uFIc4hv8-lkp@intel.com>
References: <20250115160912.617654-5-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115160912.617654-5-pbonzini@redhat.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/tdx]
[also build test ERROR on kvm/queue kvm/next linus/master v6.13 next-20250128]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/x86-virt-tdx-Add-SEAMCALL-wrappers-for-TDX-KeyID-management/20250116-001537
base:   tip/x86/tdx
patch link:    https://lore.kernel.org/r/20250115160912.617654-5-pbonzini%40redhat.com
patch subject: [PATCH v3 04/14] x86/virt/tdx: Add SEAMCALL wrappers for TDX page cache management
config: x86_64-randconfig-076-20250128 (https://download.01.org/0day-ci/archive/20250129/202501290644.uFIc4hv8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290644.uFIc4hv8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290644.uFIc4hv8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/clocksource.h:13,
                    from arch/x86/kernel/kvmclock.c:6:
   arch/x86/include/asm/tdx.h: In function 'mk_keyed_paddr':
>> include/asm-generic/memory_model.h:38:58: error: 'vmemmap' undeclared (first use in this function); did you mean 'mem_map'?
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                          ^~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:70:31: note: in expansion of macro 'page_to_pfn'
      70 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/tdx.h:148:15: note: in expansion of macro 'page_to_phys'
     148 |         ret = page_to_phys(page);
         |               ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:38:58: note: each undeclared identifier is reported only once for each function it appears in
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                          ^~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:70:31: note: in expansion of macro 'page_to_pfn'
      70 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/tdx.h:148:15: note: in expansion of macro 'page_to_phys'
     148 |         ret = page_to_phys(page);
         |               ^~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/kernel/cpu/hypervisor.c:26:
   arch/x86/include/asm/tdx.h: In function 'mk_keyed_paddr':
   include/asm-generic/memory_model.h:38:58: error: 'vmemmap' undeclared (first use in this function)
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                          ^~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:70:31: note: in expansion of macro 'page_to_pfn'
      70 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/tdx.h:148:15: note: in expansion of macro 'page_to_phys'
     148 |         ret = page_to_phys(page);
         |               ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:38:58: note: each undeclared identifier is reported only once for each function it appears in
      38 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                          ^~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:70:31: note: in expansion of macro 'page_to_pfn'
      70 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/tdx.h:148:15: note: in expansion of macro 'page_to_phys'
     148 |         ret = page_to_phys(page);
         |               ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from arch/x86/include/asm/kvm_para.h:7,
                    from arch/x86/include/asm/hypervisor.h:37,
                    from arch/x86/kernel/cpu/hypervisor.c:27:
>> include/asm-generic/memory_model.h:72:23: error: implicit declaration of function 'pfn_valid' [-Werror=implicit-function-declaration]
      72 |         WARN_ON_ONCE(!pfn_valid(__pfn));                                \
         |                       ^~~~~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   arch/x86/include/asm/tdx.h:148:15: note: in expansion of macro 'page_to_phys'
     148 |         ret = page_to_phys(page);
         |               ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +38 include/asm-generic/memory_model.h

8f6aac419bd590 Christoph Lameter  2007-10-16  35  
af901ca181d92a André Goddard Rosa 2009-11-14  36  /* memmap is virtually contiguous.  */
8f6aac419bd590 Christoph Lameter  2007-10-16  37  #define __pfn_to_page(pfn)	(vmemmap + (pfn))
32272a26974d20 Martin Schwidefsky 2008-12-25 @38  #define __page_to_pfn(page)	(unsigned long)((page) - vmemmap)
8f6aac419bd590 Christoph Lameter  2007-10-16  39  
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  40  #elif defined(CONFIG_SPARSEMEM)
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  41  /*
1a49123b343461 Zhang Yanfei       2013-10-03  42   * Note: section's mem_map is encoded to reflect its start_pfn.
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  43   * section[i].section_mem_map == mem_map's address - start_pfn;
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  44   */
67de648211fa04 Andy Whitcroft     2006-06-23  45  #define __page_to_pfn(pg)					\
aa462abe8aaf21 Ian Campbell       2011-08-17  46  ({	const struct page *__pg = (pg);				\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  47  	int __sec = page_to_section(__pg);			\
f05b6284ee5d3b Randy Dunlap       2007-02-10  48  	(unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));	\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  49  })
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  50  
67de648211fa04 Andy Whitcroft     2006-06-23  51  #define __pfn_to_page(pfn)				\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  52  ({	unsigned long __pfn = (pfn);			\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  53  	struct mem_section *__sec = __pfn_to_section(__pfn);	\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  54  	__section_mem_map_addr(__sec) + __pfn;		\
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  55  })
bb1c50d3967f69 Mike Rapoport      2021-06-28  56  #endif /* CONFIG_FLATMEM/SPARSEMEM */
67de648211fa04 Andy Whitcroft     2006-06-23  57  
012dcef3f05838 Christoph Hellwig  2015-08-07  58  /*
012dcef3f05838 Christoph Hellwig  2015-08-07  59   * Convert a physical address to a Page Frame Number and back
012dcef3f05838 Christoph Hellwig  2015-08-07  60   */
8f235d1a3eb719 Chen Gang          2016-01-14  61  #define	__phys_to_pfn(paddr)	PHYS_PFN(paddr)
ae4f976968896f Tyler Baker        2015-09-19  62  #define	__pfn_to_phys(pfn)	PFN_PHYS(pfn)
012dcef3f05838 Christoph Hellwig  2015-08-07  63  
67de648211fa04 Andy Whitcroft     2006-06-23  64  #define page_to_pfn __page_to_pfn
67de648211fa04 Andy Whitcroft     2006-06-23  65  #define pfn_to_page __pfn_to_page
a117e66ed45ac0 KAMEZAWA Hiroyuki  2006-03-27  66  
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  67  #ifdef CONFIG_DEBUG_VIRTUAL
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  68  #define page_to_phys(page)						\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  69  ({									\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  70  	unsigned long __pfn = page_to_pfn(page);			\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  71  									\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23 @72  	WARN_ON_ONCE(!pfn_valid(__pfn));				\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  73  	PFN_PHYS(__pfn);						\
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  74  })
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  75  #else
c5c3238d9b8cee Christoph Hellwig  2024-10-23  76  #define page_to_phys(page)	PFN_PHYS(page_to_pfn(page))
3e25d5a49f99b7 Christoph Hellwig  2024-10-23  77  #endif /* CONFIG_DEBUG_VIRTUAL */
c5c3238d9b8cee Christoph Hellwig  2024-10-23  78  #define phys_to_page(phys)	pfn_to_page(PHYS_PFN(phys))
c5c3238d9b8cee Christoph Hellwig  2024-10-23  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
