Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85527602B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612941; cv=none; b=Cs4BmgipGQq+8kcn4bLJsksxnhX6NsXM9y9Epwx9NO1L7UIJ7mO3oL78HR2DyLfwoXvAhAujd60dxtkoMDYH8Ro+dBcfP+j7L20lfQ8o8iVNyG4Yun1BT7GZu1Y9gSy+9dGbScM7s9s7MDsRz6ZKp+x1ZUX0PgqKjmey/WqirM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612941; c=relaxed/simple;
	bh=xyctu7u4ZYlR/hpaCArpo/tGynoQYqADzUR7WiPLBXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPj/FME7UZL3YjOdYuLhKHUpguNJXymUMSzsIDC5vuAGlYY5A/e+Rhas2XvsXdBrtsVFKjqYy/BuIqOtcf/cuRQP4nHsw6Rn4RPYw9kHB4KvVhRviGCQwrvvmSIBD7qzYHbLp7BfmnRG32Riw5HoWsfqjHi2pOfAlpQjDACIntw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXlRofj6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXlRofj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752612940; x=1784148940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyctu7u4ZYlR/hpaCArpo/tGynoQYqADzUR7WiPLBXc=;
  b=eXlRofj6tAomdUAVgZsjDikFYA4ehJcQPnEmluotMVgSrpNlP9RDHgqv
   kzJmljOuvXxLaOJ4Y8r1Ovl9NAjSwNnh9wkUHoI7gKRykr6GQcCkaOm5c
   Ej4bIeejfTJsCDatIITt5dYWNEJI1AaRTljFsFjMMIZVPepxKT4qoyzQU
   1DW9Chz9lXkReqdzzT8lHpZy1CTrX2GyVNRbM7UKD+5Hoye6fLJq0+wWx
   LV6TItHVULklJwMDLmpCttGfiqG9RlT3nG8tHM9GJCoUONPZbkk0BS3nU
   KJiB4nBJ7aOPwILXQw5I0NrADAHTYp51/xK+4CV7bAOEj9wnQ7BJm1J2P
   Q==;
X-CSE-ConnectionGUID: UFUokPCQSrS+9JaxBi5o5w==
X-CSE-MsgGUID: Q3Ci6HUxSTiPMNZpy+4gSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58660536"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="58660536"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 13:55:39 -0700
X-CSE-ConnectionGUID: OJRtTmX/SEyrSKFUXtV3/Q==
X-CSE-MsgGUID: jmM0n8wHTaykCUfJK5h2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="157428717"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2025 13:55:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubmgZ-000BXf-0y;
	Tue, 15 Jul 2025 20:55:35 +0000
Date: Wed, 16 Jul 2025 04:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] include/linux/hugetlb.h:261:1:
 warning: no return statement in function returning non-void
Message-ID: <202507160416.YUstHxc1-lkp@intel.com>
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
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: ae1584fe66d0d69c4ae034d6afa8abc3c8948614 [0/92] hugetlb: simplify hugetlb handling in follow_page_mask
config: x86_64-buildonly-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160416.YUstHxc1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160416.YUstHxc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160416.YUstHxc1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from mm/debug.c:14:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
--
   In file included from include/linux/migrate.h:8,
                    from mm/memory_hotplug.c:28:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^
   In file included from mm/memory_hotplug.c:40:
   mm/hugetlb_background_clean.h: In function 'hugetlb_clear_huge_page':
   mm/hugetlb_background_clean.h:86:9: error: implicit declaration of function 'clear_huge_page'; did you mean 'clear_highpage'? [-Werror=implicit-function-declaration]
      86 |         clear_huge_page(page, addr_hint, pages_per_huge_page);
         |         ^~~~~~~~~~~~~~~
         |         clear_highpage
   cc1: some warnings being treated as errors
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
     568 | #define get_total_swap_pages()                  0L
         | 
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
