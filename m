Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A98B644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735351100; cv=none; b=JgCyEc7NGgSlT2yJqCSjso3R08cn+Dd4eeIxG6LGKQHEeb7nfSKhF4+VnEjIXBcpMV/yC3bT4xBeRuckfMoYjeardLjy+ewUjvQxBjcMUPLWmV+E/Ug5Xrf5LLIY6eZSYd4LMxwtIm7Z4Ros4a3RIYJHttrTommKyv8HXrrbLA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735351100; c=relaxed/simple;
	bh=mTbFpfOAM6TRtiQJFRTyK/YD9jxg3VAZeuh0ufHc2n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuDb6ArlV21dG0a2ENOSRRd8ZG2DiAVZop8LscTMVSD1Oznb8KwSg8qUvRpA4TzwVmC9aoqeF+bcOrrOB+TT2r4z68HVJC/QnBBRBU1/LsmF2VIuBN0gi+eWdEBdGJzqw1vJFDlcP8arARKmcvQzcH722e9vsXKbFv2AwFNzEaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR+9C63W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR+9C63W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735351099; x=1766887099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mTbFpfOAM6TRtiQJFRTyK/YD9jxg3VAZeuh0ufHc2n4=;
  b=fR+9C63WIPRU/by2odVq1VkZIkgBhlbK3xRlp/fa+0n1g5F0fZFlLw9R
   84yIqQ3DoK1ED3dwzEJUAskm6qKPVFVLwp/mq8gSAPp5/y0SWZfbQYMaO
   xXMW9FALEtVWSQip26hlwDKI742atOS/YSYX5GmCYBwwxKsIxxUlqZV8U
   WS9KCJYvPYculQ1V39z6+m2ZPjCMabaNoCYhVgSUXTT8V9K5DMlE5u5mE
   i2WwZ0QF4p0g/wo37NQHP3waeJ1oP27e/tNL8RBuulyWqQ30/n22ciEth
   ARV4GT5qt0711OiElbRhGdJhL9kHMEd9UiYVKX75P/CPRf1ldh3wP6dgZ
   A==;
X-CSE-ConnectionGUID: 30mrIDgBRCC6X72xsOLVhg==
X-CSE-MsgGUID: k7s2I/HAQwS1eRHvzIEW5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39517209"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="39517209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 17:58:18 -0800
X-CSE-ConnectionGUID: INb3/ffRTrmC/O5XDaNY2A==
X-CSE-MsgGUID: MPnlAG2WQyipK01yXQBwBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100766520"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 17:58:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRM5m-0003o2-26;
	Sat, 28 Dec 2024 01:58:14 +0000
Date: Sat, 28 Dec 2024 09:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355] mm/pin_mem.c:1075:12:
 sparse: sparse: symbol 'reserve_idr' was not declared. Should it be static?
Message-ID: <202412280946.xMuoN3LG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a8a9daf97ebc8e303e039402fe784e7bd4e5a9bb
commit: 892de178c180d2924ad5f3dcf55baa3b8ab2272d [1355/1355] pid: add pid reserve method for checkpoint and restore
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280946.xMuoN3LG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280946.xMuoN3LG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280946.xMuoN3LG-lkp@intel.com/

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
