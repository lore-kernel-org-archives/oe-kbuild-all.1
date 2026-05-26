Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8CE3D16EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793105; cv=none; b=Dk9+ZdM7r8E1wvpzfSeT6sQYBpK9q2+AVdmqhJW0bwf3ZyFERcK+zU8CtQqSQ4JfLR4fNaNNcQZopZWCY9zwXNb187GlzFFxkAX7coYGNEcjPl7kOSbLoaXV9NZc5hnjnOTkUNuXe/ScQUxIuxevDyUczK8sAZrnD+U+9j2oCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793105; c=relaxed/simple;
	bh=fzy5UWolQilpCQpI3ULJKMV2x5BLJI8UekUd+AJJonU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sprNh82n/dAIVKP9yCivYz8VxWzrRgjMAFZcMUxBywPXEMbhPcIM6NkFXk7DjbkfTzIRA4FeptsSqW1YebsJNrSj71HJXrhfC5NaZJgEWx1m2SteTn1KozpXtYvgdpClX2uXJhzThGenzrFWg0Vmq+nxhOBTYUCF5tsBA4fLK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMfxI/IN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMfxI/IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793105; x=1811329105;
  h=date:from:to:cc:subject:message-id;
  bh=fzy5UWolQilpCQpI3ULJKMV2x5BLJI8UekUd+AJJonU=;
  b=IMfxI/INJUdP/ldIsRAlL02CNs7JUlnxfJBgfuc+cCr2uwIu8otoW0Sv
   OhpPQOqITwL4MtyyYMlvLCt6JjYTLiufKtoruSD26pb4quR5GJv+juUMc
   rN2H2LLbpcfOWgpeTFRJG3ILVX2qkPyYT5Ut6kstK+9LZc9ouQWizVrSg
   HOdRUuGskjaALj8Zvok8HkL/2J3TJ9agMQ7u00Q7uq8NVzvwWL+BeEmoN
   Q9PO2IilrMo9aJFEAw1YlevWRzkABGfXWhz4SIvzEqL0JzMqxb99dmNLu
   AYwB39Eu+QBQGtUG7dl7NptaM/pEOPPyEBrag6zmj/taq5a/vmbc9Meuf
   g==;
X-CSE-ConnectionGUID: qOTzDQSvTyS+RG29+FqG5Q==
X-CSE-MsgGUID: iTWfWIwbTPumukZm3MFyDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98026856"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98026856"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:58:24 -0700
X-CSE-ConnectionGUID: UIRDjLmFT26Xh1mc3xUo2g==
X-CSE-MsgGUID: x3cedhVxRWKNwhLpa89J0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246853675"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 May 2026 03:58:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpUK-000000002NM-0Eug;
	Tue, 26 May 2026 10:58:20 +0000
Date: Tue, 26 May 2026 18:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 266/266]
 kernel/../mm/internal.h:848:26: warning: implicit conversion from 'unsigned
 long long' to 'u32' (aka 'unsigned int') changes value from 17179869184 to 0
Message-ID: <202605261830.cs4K3Bw4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   b8e454c3f0322874b0c14f3641e4ff1d8e3c421e
commit: b383f5713e1df5a93b91d438097dde9b98934b55 [266/266] Merge 334fbe734e68 ("Merge tag 'mm-stable-2026-04-13-21-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm") into android-mainline
config: x86_64-buildonly-randconfig-001-20260526 (https://download.01.org/0day-ci/archive/20260526/202605261830.cs4K3Bw4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261830.cs4K3Bw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261830.cs4K3Bw4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:106:
   include/linux/iommu.h:1628:17: error: incomplete definition of type 'struct iommu_mm_data'
    1628 |         return iommu_mm->pasid;
         |                ~~~~~~~~^
   include/linux/mm_types.h:1171:8: note: forward declaration of 'struct iommu_mm_data'
    1171 | struct iommu_mm_data;
         |        ^
   In file included from kernel/fork.c:121:
>> kernel/../mm/internal.h:848:26: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 17179869184 to 0 [-Wconstant-conversion]
     848 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   include/linux/mmzone.h:85:33: note: expanded from macro 'MAX_FOLIO_ORDER'
      85 | #define MAX_FOLIO_ORDER         (ilog2(SZ_16G) - PAGE_SHIFT)
         |                                  ~~~~~~^~~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                                  ^~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +848 kernel/../mm/internal.h

904d58578fce53 Kefeng Wang             2023-05-16  832  
3c605096d31582 Joonsoo Kim             2014-11-13  833  extern int __isolate_free_page(struct page *page, unsigned int order);
624f58d8f46396 Alexander Duyck         2020-04-06  834  extern void __putback_isolated_page(struct page *page, unsigned int order,
624f58d8f46396 Alexander Duyck         2020-04-06  835  				    int mt);
58e3e5265484a1 Shengming Hu            2025-12-29  836  extern void memblock_free_pages(unsigned long pfn, unsigned int order);
13c526540b3169 David Hildenbrand       2024-06-07  837  extern void __free_pages_core(struct page *page, unsigned int order,
13c526540b3169 David Hildenbrand       2024-06-07  838  		enum meminit_context context);
9420f89db2dd61 Mike Rapoport (IBM      2023-03-21  839) 
1e3be4856f49d5 Tarun Sahu              2023-06-12  840  /*
1e3be4856f49d5 Tarun Sahu              2023-06-12  841   * This will have no effect, other than possibly generating a warning, if the
1e3be4856f49d5 Tarun Sahu              2023-06-12  842   * caller passes in a non-large folio.
1e3be4856f49d5 Tarun Sahu              2023-06-12  843   */
1e3be4856f49d5 Tarun Sahu              2023-06-12  844  static inline void folio_set_order(struct folio *folio, unsigned int order)
1e3be4856f49d5 Tarun Sahu              2023-06-12  845  {
1e3be4856f49d5 Tarun Sahu              2023-06-12  846  	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
1e3be4856f49d5 Tarun Sahu              2023-06-12  847  		return;
99132d24d76511 David Hildenbrand       2025-09-01 @848  	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
1e3be4856f49d5 Tarun Sahu              2023-06-12  849  
ebc1baf5c9b46c Matthew Wilcox (Oracle  2023-08-16  850) 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
4996fc547f5b49 David Hildenbrand       2025-03-03  851  #ifdef NR_PAGES_IN_LARGE_FOLIO
4996fc547f5b49 David Hildenbrand       2025-03-03  852  	folio->_nr_pages = 1U << order;
1e3be4856f49d5 Tarun Sahu              2023-06-12  853  #endif
1e3be4856f49d5 Tarun Sahu              2023-06-12  854  }
1e3be4856f49d5 Tarun Sahu              2023-06-12  855  

:::::: The code at line 848 was first introduced by commit
:::::: 99132d24d76511f0f6ded2e25448765b632794aa mm: sanity-check maximum folio size in folio_set_order()

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
