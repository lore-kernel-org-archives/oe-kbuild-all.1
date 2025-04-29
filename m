Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC651B3934
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889584; cv=none; b=LldypkKOr+oi/SkWqHQvQh/eGMcE6lJZn0YAvsGxjySp5nlG8MYe/bQmRS3s7BM8JEo6fHeqmPkR8+UfNpjqWNANfeF8Yye0zFjUDo2FkKrKPrtvGOvvscSo1Et2cXxJM0DQ2dUTZikmxdu2H4ceRQPIWtg/WUhYx+QSoIVt+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889584; c=relaxed/simple;
	bh=DdcFrm9EQLQ6nKNobVzB6N7BygsLQZ7MaQ3m2AozUX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XclzORq54xftSTMQrQDkhRpqnz17ctpPej9g10RWv7gwJnQqP+tVYKGTj3LDl+t62ecTJNSkP60n08U90nuEwmJn+4Ap9PWY+tStMkmBpzAGL1SppRCzdFgH6HVvJ/ohqSeNEQdZ5pI7sgPnTxYqOFzf1YZVeHyBTDNHo9uYrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gkr3KTZB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gkr3KTZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889583; x=1777425583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdcFrm9EQLQ6nKNobVzB6N7BygsLQZ7MaQ3m2AozUX0=;
  b=Gkr3KTZBdDYUeziTUUctdJOdsarcKSsV1O5u7sO0k2WUiTx7l3W+kCpN
   oaDtaQbhThX7owOo4NDFimYTUglaKJfJItxByXWJFj8NUhRFNngNE8DxN
   /adpcd8hLdRregLgF5ViGIych5VsdeCvWJx9G4dT6J3URVvHRRLq8qMbl
   3SXNegVopwEEQskjF3EOVp8Tj6h2RDEN94aVkyIVt/YakD17MdBhK0CcS
   7+A8b2p6PyC9N0KLoQEVCbRpfElMwOaCYOty9WgUYCLDLgB+PCH4l7etI
   yRgirl+qI3zbc9YARgHH3psV+QiTXqapKlkIhRbyo1xmYraSYH2Pgt8s9
   A==;
X-CSE-ConnectionGUID: xv1i+p8dSwe9a3coUeMdVQ==
X-CSE-MsgGUID: rZmsTO/uTLybLmasgMfULw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154552"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:36 -0700
X-CSE-ConnectionGUID: Q1XxORm4SGaagF/fQdeDAg==
X-CSE-MsgGUID: f90z3URrRRGEe97UVBGMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561626"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Fu-32;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 08:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used
Message-ID: <202504290804.SFjtS4nf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   230c2b30f879859ac3e9d3cc46407a9dbb103160
commit: 1811840c2cdebd0820818392a8217ffbd1be5c67 [1597/1597] mm/sharepool: Fix sharepool node id invalid when using sp_alloc
config: arm64-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290804.SFjtS4nf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290804.SFjtS4nf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290804.SFjtS4nf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shmem_fs.h:7,
                    from mm/truncate.c:23:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   mm/mmap.c: In function 'acct_stack_growth':
   mm/mmap.c:2584:16: warning: variable 'new_start' set but not used [-Wunused-but-set-variable]
    2584 |  unsigned long new_start;
         |                ^~~~~~~~~
   In file included from include/linux/shmem_fs.h:7,
                    from mm/mmap.c:28:
   At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   mm/vmscan.c: In function 'kernel_swap_check':
   mm/vmscan.c:3264:21: error: implicit declaration of function 'kernel_swap_enabled'; did you mean 'kernfs_ns_enabled'? [-Werror=implicit-function-declaration]
    3264 |  if (sc != NULL && !kernel_swap_enabled())
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     kernfs_ns_enabled
   mm/vmscan.c: In function 'try_to_free_mem_cgroup_pages':
   mm/vmscan.c:3360:6: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    3360 |  int nid;
         |      ^~~
   mm/vmscan.c: In function 'get_swapcache_reclaim_num':
   mm/vmscan.c:4683:33: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
    4683 |  return total_swapcache_pages() >
         |                                 ^
   In file included from mm/vmscan.c:39:
   At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/page_counter.h:6,
                    from mm/memcontrol.c:34:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:884:39: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
     884 | #define min(x, y) __careful_cmp(x, y, <)
         |                                       ^
   include/linux/kernel.h:867:30: note: in definition of macro '__cmp'
     867 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:884:19: note: in expansion of macro '__careful_cmp'
     884 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   mm/memcontrol.c:1506:14: note: in expansion of macro 'min'
    1506 |   swap_max = min(swap_max, (unsigned long)total_swap_pages);
         |              ^~~
   In file included from include/linux/shmem_fs.h:7,
                    from mm/memcontrol.c:39:
   At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   mm/memcontrol.c:6306: warning: bad line:                | 0, otherwise.
--
   mm/page_alloc.c:1489:6: warning: no previous prototype for 'set_zone_contiguous' [-Wmissing-prototypes]
    1489 | void set_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1511:6: warning: no previous prototype for 'clear_zone_contiguous' [-Wmissing-prototypes]
    1511 | void clear_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:43:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   mm/page_alloc.c:3083: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'
--
   mm/workingset.c: In function 'unpack_shadow':
   mm/workingset.c:187:15: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
     187 |  int memcgid, nid;
         |               ^~~
   In file included from include/linux/shmem_fs.h:7,
                    from mm/workingset.c:10:
   At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   mm/memory.c: In function 'vm_insert_page':
   mm/memory.c:1554:10: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did you mean 'hugetlb_insert__hugepage_pte_by_pa'? [-Werror=implicit-function-declaration]
    1554 |   return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          hugetlb_insert__hugepage_pte_by_pa
   In file included from mm/memory.c:72:
   mm/memory.c: In function 'clear_huge_page':
   include/linux/ktask.h:123:21: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct cgp_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |   .kc_thread_func = (ktask_thread_func)(thread_func),      \
         |                     ^
   include/linux/ktask.h:139:3: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |   KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |   ^~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4754:3: note: in expansion of macro 'DEFINE_KTASK_CTL'
    4754 |   DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
         |   ^~~~~~~~~~~~~~~~
   In file included from include/linux/migrate.h:6,
                    from mm/memory.c:65:
   At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from mm/oom_kill.c:35:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   mm/oom_kill.c:328: warning: Function parameter or member 'task' not described in 'oom_next_task'
   mm/oom_kill.c:328: warning: Function parameter or member 'oc' not described in 'oom_next_task'
   mm/oom_kill.c:328: warning: Function parameter or member 'points' not described in 'oom_next_task'
--
   In file included from include/linux/shmem_fs.h:7,
                    from mm/khugepaged.c:20:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   mm/khugepaged.c:1348: warning: Function parameter or member 'mm' not described in 'collapse_shmem'
   mm/khugepaged.c:1348: warning: Function parameter or member 'mapping' not described in 'collapse_shmem'
   mm/khugepaged.c:1348: warning: Function parameter or member 'start' not described in 'collapse_shmem'
   mm/khugepaged.c:1348: warning: Function parameter or member 'hpage' not described in 'collapse_shmem'
   mm/khugepaged.c:1348: warning: Function parameter or member 'node' not described in 'collapse_shmem'
   mm/khugepaged.c:1348: warning: Function parameter or member 'reliable' not described in 'collapse_shmem'


vim +/__do_mbind +329 include/linux/mempolicy.h

   328	
 > 329	static long __do_mbind(unsigned long start, unsigned long len,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
