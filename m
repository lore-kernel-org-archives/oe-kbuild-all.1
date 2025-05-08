Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCC2163BD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728854; cv=none; b=VD4LlGP751CNQJeIOQ8ZiYWUydg9WwEtTa4D+Cj0oTDduGiVWNn7/IqVqRPSJbB3CA3bzEJlBOBvlSs8tOwm+TpmPyhMorUsWEm2osdxssqFI5KngJqE3RzanGpSgqU7XlzOv8pxrQQjjYFr/c9VkqvvzuNyM95xQ3MhQ+fdzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728854; c=relaxed/simple;
	bh=HB6t+GrrNAb7kM5sg5F+P4zPh/AW+yuT9oLrE8utq6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7qiKWzbG+XubSs/wqc4Hu6nDrteAD0sP76su8PfgnZ2LIpQY40HrEWeF83lSh2ePtdUHJcQsWgzGbZVAuukSYhpu7eGjSz7KVvZPPWS8WbIt23GNL+f7qI3Jd8JAR08zaFYtdqAJFZ1DDVRpKHH/fSGqyvMJPUVYme5+yKJq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wirf0Bk2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wirf0Bk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746728853; x=1778264853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HB6t+GrrNAb7kM5sg5F+P4zPh/AW+yuT9oLrE8utq6I=;
  b=Wirf0Bk2GlJt806yLxXXQWyU29kV1DcpzJmBE5BvEnrlRJZtdn6kSb6x
   FnmdjahegAm3z4LVHJeP+n2AYVupaZdD5c5o1S2Qz2IxvOpejSJuCz+tb
   M9mAAhWGQhdHGAs6NM1/WkKqQ7n9QZQ/lF7xIqOkR8CXzlm7zGB4UKyPe
   pn8usZSA08gjMyn1zZuaGDrJ/vc2SRU3/iAPkiKHAG8zo49htV4j/AKdu
   ybOFFlfnGEU+ZI0IS9II7aS+d1KrUX2e/qJ/CLI5g4b2IE/3hGYzf784g
   FkKBLpxFMte63+YmVDS+B1lsvRvcROOY9Ev8j/0kmq+SPeMsmJFaEk2tU
   w==;
X-CSE-ConnectionGUID: pO2iZd2KT4WNtmxVXZSSZQ==
X-CSE-MsgGUID: gUKxk2K+QbW9xFdt0Srbdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48447986"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48447986"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:27:32 -0700
X-CSE-ConnectionGUID: iC6pO+tUSGWFv0jZO5f8nA==
X-CSE-MsgGUID: NQ4bAr/oSE2McXz/WvCV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="173561040"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 11:27:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD5xw-000BFj-11;
	Thu, 08 May 2025 18:27:28 +0000
Date: Fri, 9 May 2025 02:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] include/linux/hugetlb.h:261:1: warning:
 no return statement in function returning non-void
Message-ID: <202505090239.IT4hYADS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: ae1584fe66d0d69c4ae034d6afa8abc3c8948614 [0/1] hugetlb: simplify hugetlb handling in follow_page_mask
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250509/202505090239.IT4hYADS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090239.IT4hYADS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090239.IT4hYADS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/mm/fault.c:27:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
--
   In file included from mm/swap.c:36:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   In file included from mm/swap.c:40:
   include/linux/dma-buf.h: At top level:
   include/linux/dma-buf.h:674:13: warning: 'is_dma_buf_pages_file' defined but not used [-Wunused-function]
     674 | static bool is_dma_buf_pages_file(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/migrate.h:8,
                    from mm/vmscan.c:43:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   mm/vmscan.c: At top level:
   mm/vmscan.c:191:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     191 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:568:9: note: macro "get_total_swap_pages" defined here
     568 | #define get_total_swap_pages()                  0L
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:192:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     192 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:778:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     778 |         int err;
         |             ^~~
--
   In file included from include/linux/migrate.h:8,
                    from mm/page_alloc.c:62:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:3986:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3986 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~


vim +261 include/linux/hugetlb.h

   256	
   257	static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
   258					unsigned long address, unsigned int flags)
   259	{
   260		BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
 > 261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
