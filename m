Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57E1A9FB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542365; cv=none; b=E8aoRDYu0ambapYcqOsWivRkwVL4AYMKzCbIbrXXtr+6GmijFWFZxgRYwMzIlIqzEs3Jp7/fQTzRuseX2xKMsbHx56pbY7KpLifqjs8ngCASYhEivWOE6yakrlzol3eNGNKzIUu0cCXaXWa6Kg/qS71j+IRYPI9k5dKWZ1pvt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542365; c=relaxed/simple;
	bh=pA0hwt2hSpeieHuSCZPlbbrUEhazN9oNIEA2cKVp11Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTH6uOfziqQqQa5jZ8YIVuJW78U3JHDwWyg2thc5+T5hjbU1GDTVnJEYeCPSaZnAOPpzOno82sSX6ySa0oANXlraA42dHZ9YOFOS0PrEk5pYyKftDuV/iogtQc6D1RkfMcGtZ4TO7X8qv9yU1ZFTFAIqhDl5SeQx43Ef2AHgXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPujPgil; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPujPgil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542364; x=1790078364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pA0hwt2hSpeieHuSCZPlbbrUEhazN9oNIEA2cKVp11Y=;
  b=hPujPgilP/inwrQ9Hc7PxnwDng+55ZePJJqUeesfyoaRWrp1AWG94xBT
   Jwz85VDwkJgY5ZFa7kBoEkttp1Qu1ACtTMNNxxk34B4HcYhQ8qKetuMbK
   1Lo6OCIgn1razDiO4Cbnv0SPz81I22E5/fwQj2p/gAIwjOrrSAQ2F9/8R
   XhA9FhZDoJw9W8jA40wZj6sdYmVHarvnBxJvj74wbuzXrB690Zm9P+J3B
   Lp+QNlKNrFja8IpDguLyL15ypiKLWHX65vDlE3IcLIgALLj0vxP511bMU
   ZiP1axCLigIoj2t/pp8snZQ2IoGMU6eEckKrADjQQbvOvbgwR2GSF9tCC
   w==;
X-CSE-ConnectionGUID: 85+binxYTlqwhP9BhDgXeA==
X-CSE-MsgGUID: Os/upFabRKW+4XLVzEgRNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72166311"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="72166311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:59:23 -0700
X-CSE-ConnectionGUID: xfqmU1hAToifjyt/iYs9DQ==
X-CSE-MsgGUID: fTJzNvCAToK9fwqKt/o22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="213609756"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2025 04:59:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0fCR-0001dN-0X;
	Mon, 22 Sep 2025 11:59:19 +0000
Date: Mon, 22 Sep 2025 19:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 146/146] include/linux/hugetlb.h:261:1:
 warning: no return statement in function returning non-void
Message-ID: <202509221934.gXK2C3RR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: ae1584fe66d0d69c4ae034d6afa8abc3c8948614 [146/146] hugetlb: simplify hugetlb handling in follow_page_mask
config: arm64-randconfig-003-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221934.gXK2C3RR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221934.gXK2C3RR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221934.gXK2C3RR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mincore.c:19:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
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
   include/linux/swap.h:568: note: macro "get_total_swap_pages" defined here
     568 | #define get_total_swap_pages()   0L
         | 
   mm/vmscan.c:192:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     192 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:778:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     778 |  int err;
         |      ^~~
--
   In file included from include/linux/migrate.h:8,
                    from mm/compaction.c:13:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   At top level:
   mm/compaction.c:56:27: warning: 'HPAGE_FRAG_CHECK_INTERVAL_MSEC' defined but not used [-Wunused-const-variable=]
      56 | static const unsigned int HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
--
   In file included from include/linux/migrate.h:8,
                    from mm/memory_hotplug.c:28:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   In file included from mm/memory_hotplug.c:40:
   mm/hugetlb_background_clean.h: In function 'hugetlb_clear_huge_page':
   mm/hugetlb_background_clean.h:86:2: error: implicit declaration of function 'clear_huge_page'; did you mean 'clear_highpage'? [-Werror=implicit-function-declaration]
      86 |  clear_huge_page(page, addr_hint, pages_per_huge_page);
         |  ^~~~~~~~~~~~~~~
         |  clear_highpage
   cc1: some warnings being treated as errors
--
   In file included from fs/proc/meminfo.c:6:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   fs/proc/meminfo.c: At top level:
   fs/proc/meminfo.c:22:28: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      22 | void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
         |                            ^~~~~~~~~~~~~~~~~~~


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
