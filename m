Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6A171AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 03:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720841223; cv=none; b=pA7v6NZWoQU9Ba9Rp55sI3IbdgqPrf5U+4AYDQOmB9nRVDnWx3/8NkcDJza84wLyHH4hgoKeXP3nLaLfwBu1NbQKSY7m0zIwZZrFG2fQ4H2fFf+3zN0Ff3y4cPiBKV+/thjMfQ8hTj0yfOChwRx8LiO8+ustqy9xsLDQCbGR/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720841223; c=relaxed/simple;
	bh=U/xeyxK/aLg0QjWDS2Qzx7VRJBBhrNEmTi85aWF2iPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKswf6/StAu7JRX5H3iYVJ5xcQ03sRBGQwCOuxgt7LWiZctIa2nJcp2kpkq2sVKO2XvQtFocH/ZB6puqaJyVrUcKxK3aoae0sAp/8l22sbJf3pHri10cOg1bpaVB6slBQcUCE4PxyCy3qdPPvUXqfChhA8wLBD3KSIRLsIr0Axc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWgAVRFa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWgAVRFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720841222; x=1752377222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/xeyxK/aLg0QjWDS2Qzx7VRJBBhrNEmTi85aWF2iPY=;
  b=RWgAVRFaNN4E9Gar5QqsVYaeFH29ZxtEhoi+p4i9n5DltuGfXgXXpky1
   2A8/rEad3Lf2RfRmlPUIpXhSTR38TV05tyIkZv5xrUSmUr8SNpz4vxF8D
   Rsi99Md+GCDgMByeJEHlNyWbHG5kDetpkJeJGzANsHjBd2kIO8NQY5awX
   UgCf+9b171F0lJfxioQk3nFdxoc7g8Hy+Rj9O24y7aZmTivzEOgXYyT97
   ifxiVB6byV0N4xEhk3zk5C9OazkGc3vZTvdpUl130mN8I2bKijO755Rzc
   2uQ9+g6aByhoTiCdvYyiIqiDI27uOaRtRHBqJZlZAE70cFKc3cNyVn2U8
   g==;
X-CSE-ConnectionGUID: 5WCJiQX/SB+yI8F8KtDFbA==
X-CSE-MsgGUID: dCgHgS+FQBOzTHTTj5yL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18412689"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18412689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 20:27:01 -0700
X-CSE-ConnectionGUID: 2P4oPq+XRAaorZB3OzRiKg==
X-CSE-MsgGUID: l5JWwV7iTwOI/Uff5536kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="79788184"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jul 2024 20:27:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSTPW-000bco-15;
	Sat, 13 Jul 2024 03:26:58 +0000
Date: Sat, 13 Jul 2024 11:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16562/23271] mm/pin_mem.c:1075:12:
 sparse: sparse: symbol 'reserve_idr' was not declared. Should it be static?
Message-ID: <202407131157.Vwc7D5kC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   07c988f00903b4f0fbf9c31cea24351fbf885b1c
commit: 892de178c180d2924ad5f3dcf55baa3b8ab2272d [16562/23271] pid: add pid reserve method for checkpoint and restore
config: arm64-randconfig-r112-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131157.Vwc7D5kC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240713/202407131157.Vwc7D5kC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131157.Vwc7D5kC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/pin_mem.c:34:14: sparse: sparse: symbol 'max_pin_pid_num' was not declared. Should it be static?
   mm/pin_mem.c:35:15: sparse: sparse: symbol 'redirect_space_size' was not declared. Should it be static?
   mm/pin_mem.c:171:6: sparse: sparse: symbol 'reserve_page_from_buddy' was not declared. Should it be static?
   mm/pin_mem.c:254:6: sparse: sparse: symbol 'free_user_map_pages' was not declared. Should it be static?
   mm/pin_mem.c:311:6: sparse: sparse: symbol 'check_redirect_end_valid' was not declared. Should it be static?
   mm/pin_mem.c:392:5: sparse: sparse: symbol 'calculate_pin_mem_digest' was not declared. Should it be static?
   mm/pin_mem.c:481:5: sparse: sparse: symbol 'collect_pmd_huge_pages' was not declared. Should it be static?
   mm/pin_mem.c:544:5: sparse: sparse: symbol 'collect_normal_pages' was not declared. Should it be static?
   mm/pin_mem.c:610:6: sparse: sparse: symbol 'free_pin_pages' was not declared. Should it be static?
   mm/pin_mem.c:770:12: sparse: sparse: symbol 'remap_normal_pages' was not declared. Should it be static?
   mm/pin_mem.c:857:12: sparse: sparse: symbol 'remap_huge_pmd_pages' was not declared. Should it be static?
>> mm/pin_mem.c:1075:12: sparse: sparse: symbol 'reserve_idr' was not declared. Should it be static?
   mm/pin_mem.c:844:63: sparse: sparse: not addressable
   mm/pin_mem.c:846:63: sparse: sparse: not addressable
   mm/pin_mem.c:848:71: sparse: sparse: not addressable
   mm/pin_mem.c:851:65: sparse: sparse: not addressable
   mm/pin_mem.c:171:6: warning: no previous prototype for 'reserve_page_from_buddy' [-Wmissing-prototypes]
     171 | void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:254:6: warning: no previous prototype for 'free_user_map_pages' [-Wmissing-prototypes]
     254 | void free_user_map_pages(unsigned int pid_index, unsigned int entry_index, unsigned int page_index)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:311:6: warning: no previous prototype for 'check_redirect_end_valid' [-Wmissing-prototypes]
     311 | bool check_redirect_end_valid(struct redirect_info *redirect_start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:392:5: warning: no previous prototype for 'calculate_pin_mem_digest' [-Wmissing-prototypes]
     392 | int calculate_pin_mem_digest(struct pin_mem_dump_info *pmdi, char *digest)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:481:5: warning: no previous prototype for 'collect_pmd_huge_pages' [-Wmissing-prototypes]
     481 | int collect_pmd_huge_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:544:5: warning: no previous prototype for 'collect_normal_pages' [-Wmissing-prototypes]
     544 | int collect_normal_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'collect_normal_pages':
   mm/pin_mem.c:549:26: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     549 |         unsigned long i, nr_pages;
         |                          ^~~~~~~~
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:610:6: warning: no previous prototype for 'free_pin_pages' [-Wmissing-prototypes]
     610 | void free_pin_pages(struct page_map_entry *pme)
         |      ^~~~~~~~~~~~~~
   mm/pin_mem.c:770:12: warning: no previous prototype for 'remap_normal_pages' [-Wmissing-prototypes]
     770 | vm_fault_t remap_normal_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'get_hugepage_gfpmask':
   mm/pin_mem.c:844:63: error: lvalue required as unary '&' operand
     844 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:846:63: error: lvalue required as unary '&' operand
     846 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:848:71: error: lvalue required as unary '&' operand
     848 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                       ^
   mm/pin_mem.c:851:65: error: lvalue required as unary '&' operand
     851 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                 ^
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:857:12: warning: no previous prototype for 'remap_huge_pmd_pages' [-Wmissing-prototypes]
     857 | vm_fault_t remap_huge_pmd_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~~~

vim +/reserve_idr +1075 mm/pin_mem.c

  1073	
  1074	#ifdef CONFIG_PID_RESERVE
> 1075	struct idr *reserve_idr;
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
