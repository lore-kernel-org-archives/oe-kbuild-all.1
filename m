Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387B220F3E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027883; cv=none; b=VKuH8P3Cynsrxsw+hkGJ6T1uNFPmZXPFIo3NhOnpt3JRGcVatFHMM6n8afjegsLkOOfGVCnDMtlTTIAbUzWSdxoxsxT5a70bAAbd/Z/yM4sIje0L4ijP10Pv6n9wX6g4Fwse1OjvLl0wePYWXLcy6BoCYR4AQrtUgfq9d+cNFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027883; c=relaxed/simple;
	bh=UtF/xhA3Y4+BG6VEUwdbEawkuFZBt7JIdn8+bK8Fb4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L78j8P4kZZAoPUSLE0ZrL+ghB6DMSc88J9DVx/V62GU2xJslMNvisZdsbFiy4i35zl3AYLtaxcPKP7+a6Qe1hoP8OqB4j2ndUv1TSvZaHJA1oPCShkoWxj7E3ZS5zq10TYgjLBVW4tVVvqm+mFeQhhWDJJB+BH5i5mWiHmRvzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXCZvHXN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXCZvHXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027882; x=1791563882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtF/xhA3Y4+BG6VEUwdbEawkuFZBt7JIdn8+bK8Fb4U=;
  b=SXCZvHXNMEWZOcV0t9jqL+pGvNZYz5h97hQ0oSFHacLKhBWoRZf5LBpu
   0DvQZicEpGunOVEMAHhn5+pMd5/kdBzQazOfuy7UJktZdSOt3APl159Ls
   6pGcdMEyrj3JsNwS8rQJccBnAH/E4jHOBcusv1bGWGqetSgAJPgaCc2hA
   IkMrY1S/VaYYFvyf3w6YGn0LRiWoMBKGid8qV7tO2nralWhyFOgCQixmP
   Ig81C0X2qDCKg/JlZfsmJZzhPGz5/B1K+Ucmm5WeUqslQycSirnEBf4yS
   AwVOyiZW7BFdCZ19RCzS2+HzU3cj1bnv5oOtSlu4GU74b3B1oQt0WONCm
   g==;
X-CSE-ConnectionGUID: uoHzDmEDSHuWkYMnfnyuNQ==
X-CSE-MsgGUID: kTixBeC/TqSuie6Sq48R2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65893385"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="65893385"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:38:00 -0700
X-CSE-ConnectionGUID: wLNBg/qAQXuyEoRM1YwuZQ==
X-CSE-MsgGUID: +Jk/21/hRS2aexpDoD48jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211408311"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 09:37:58 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6teN-00011F-2x;
	Thu, 09 Oct 2025 16:37:55 +0000
Date: Fri, 10 Oct 2025 00:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1480/1480] mm/debug.c:174:3: warning:
 format specifies type 'void *' but the argument has type 'int'
Message-ID: <202510100017.B6OQmCin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b0534aa9eeb9c05e780430c051477b8eb5768330
commit: 2d2fe6b40444bd8f84f674930ac5f98a6314702e [1480/1480] ascend: mm: add an owner for mm_struct
config: x86_64-randconfig-r112-20250311 (https://download.01.org/0day-ci/archive/20251010/202510100017.B6OQmCin-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100017.B6OQmCin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100017.B6OQmCin-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/debug.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/debug.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/debug.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> mm/debug.c:174:3: warning: format specifies type 'void *' but the argument has type 'int' [-Wformat]
     135 |                 atomic_read(&mm->tlb_flush_pending),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:342:35: note: expanded from macro 'pr_emerg'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ~~~     ^~~~~~~~~~~
>> mm/debug.c:175:3: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
     142 |                 mm->def_flags, &mm->def_flags
         |                 ^~~~~~~~~~~~~
   include/linux/printk.h:342:35: note: expanded from macro 'pr_emerg'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ~~~     ^~~~~~~~~~~
>> mm/debug.c:175:18: warning: format specifies type 'unsigned long' but the argument has type 'const unsigned long *' [-Wformat]
     143 |                 mm->def_flags, &mm->def_flags
         |                                ^~~~~~~~~~~~~~
   include/linux/printk.h:342:35: note: expanded from macro 'pr_emerg'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ~~~     ^~~~~~~~~~~
>> mm/debug.c:143:21: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     143 |                 "def_flags: %#lx(%pGv)\n",
         |                                  ~^
   include/linux/printk.h:342:27: note: expanded from macro 'pr_emerg'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ^~~
   include/linux/printk.h:332:21: note: expanded from macro 'pr_fmt'
     332 | #define pr_fmt(fmt) fmt
         |                     ^~~
   4 warnings generated.


vim +174 mm/debug.c

82742a3a515219 Sasha Levin           2014-10-09  114  
31c9afa6db122a Sasha Levin           2014-10-09  115  void dump_mm(const struct mm_struct *mm)
31c9afa6db122a Sasha Levin           2014-10-09  116  {
7a9cdebdcc17e4 Linus Torvalds        2018-09-12  117  	pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
31c9afa6db122a Sasha Levin           2014-10-09  118  #ifdef CONFIG_MMU
152a2d199e1385 Matthew Wilcox        2018-01-04  119  		"get_unmapped_area %px\n"
31c9afa6db122a Sasha Levin           2014-10-09  120  #endif
31c9afa6db122a Sasha Levin           2014-10-09  121  		"mmap_base %lu mmap_legacy_base %lu highest_vm_end %lu\n"
152a2d199e1385 Matthew Wilcox        2018-01-04  122  		"pgd %px mm_users %d mm_count %d pgtables_bytes %lu map_count %d\n"
31c9afa6db122a Sasha Levin           2014-10-09  123  		"hiwater_rss %lx hiwater_vm %lx total_vm %lx locked_vm %lx\n"
84638335900f19 Konstantin Khlebnikov 2016-01-14  124  		"pinned_vm %lx data_vm %lx exec_vm %lx stack_vm %lx\n"
31c9afa6db122a Sasha Levin           2014-10-09  125  		"start_code %lx end_code %lx start_data %lx end_data %lx\n"
31c9afa6db122a Sasha Levin           2014-10-09  126  		"start_brk %lx brk %lx start_stack %lx\n"
31c9afa6db122a Sasha Levin           2014-10-09  127  		"arg_start %lx arg_end %lx env_start %lx env_end %lx\n"
152a2d199e1385 Matthew Wilcox        2018-01-04  128  		"binfmt %px flags %lx core_state %px\n"
31c9afa6db122a Sasha Levin           2014-10-09  129  #ifdef CONFIG_AIO
152a2d199e1385 Matthew Wilcox        2018-01-04  130  		"ioctx_table %px\n"
31c9afa6db122a Sasha Levin           2014-10-09  131  #endif
2d2fe6b40444bd Ding Tianhong         2021-10-30  132  #ifdef CONFIG_MM_OWNER
152a2d199e1385 Matthew Wilcox        2018-01-04  133  		"owner %px "
31c9afa6db122a Sasha Levin           2014-10-09  134  #endif
152a2d199e1385 Matthew Wilcox        2018-01-04  135  		"exe_file %px\n"
31c9afa6db122a Sasha Levin           2014-10-09  136  #ifdef CONFIG_MMU_NOTIFIER
152a2d199e1385 Matthew Wilcox        2018-01-04  137  		"mmu_notifier_mm %px\n"
31c9afa6db122a Sasha Levin           2014-10-09  138  #endif
31c9afa6db122a Sasha Levin           2014-10-09  139  #ifdef CONFIG_NUMA_BALANCING
31c9afa6db122a Sasha Levin           2014-10-09  140  		"numa_next_scan %lu numa_scan_offset %lu numa_scan_seq %d\n"
31c9afa6db122a Sasha Levin           2014-10-09  141  #endif
31c9afa6db122a Sasha Levin           2014-10-09  142  		"tlb_flush_pending %d\n"
b8eceeb99014cf Vlastimil Babka       2016-03-15 @143  		"def_flags: %#lx(%pGv)\n",
31c9afa6db122a Sasha Levin           2014-10-09  144  
7a9cdebdcc17e4 Linus Torvalds        2018-09-12  145  		mm, mm->mmap, (long long) mm->vmacache_seqnum, mm->task_size,
31c9afa6db122a Sasha Levin           2014-10-09  146  #ifdef CONFIG_MMU
31c9afa6db122a Sasha Levin           2014-10-09  147  		mm->get_unmapped_area,
31c9afa6db122a Sasha Levin           2014-10-09  148  #endif
31c9afa6db122a Sasha Levin           2014-10-09  149  		mm->mmap_base, mm->mmap_legacy_base, mm->highest_vm_end,
31c9afa6db122a Sasha Levin           2014-10-09  150  		mm->pgd, atomic_read(&mm->mm_users),
31c9afa6db122a Sasha Levin           2014-10-09  151  		atomic_read(&mm->mm_count),
af5b0f6a09e42c Kirill A. Shutemov    2017-11-15  152  		mm_pgtables_bytes(mm),
31c9afa6db122a Sasha Levin           2014-10-09  153  		mm->map_count,
53f4e528406789 Daniel Jordan         2019-08-14  154  		mm->hiwater_rss, mm->hiwater_vm, mm->total_vm,
53f4e528406789 Daniel Jordan         2019-08-14  155  		atomic_long_read(&mm->locked_vm),
84638335900f19 Konstantin Khlebnikov 2016-01-14  156  		mm->pinned_vm, mm->data_vm, mm->exec_vm, mm->stack_vm,
31c9afa6db122a Sasha Levin           2014-10-09  157  		mm->start_code, mm->end_code, mm->start_data, mm->end_data,
31c9afa6db122a Sasha Levin           2014-10-09  158  		mm->start_brk, mm->brk, mm->start_stack,
31c9afa6db122a Sasha Levin           2014-10-09  159  		mm->arg_start, mm->arg_end, mm->env_start, mm->env_end,
31c9afa6db122a Sasha Levin           2014-10-09  160  		mm->binfmt, mm->flags, mm->core_state,
31c9afa6db122a Sasha Levin           2014-10-09  161  #ifdef CONFIG_AIO
31c9afa6db122a Sasha Levin           2014-10-09  162  		mm->ioctx_table,
31c9afa6db122a Sasha Levin           2014-10-09  163  #endif
31c9afa6db122a Sasha Levin           2014-10-09  164  #ifdef CONFIG_MEMCG
31c9afa6db122a Sasha Levin           2014-10-09  165  		mm->owner,
31c9afa6db122a Sasha Levin           2014-10-09  166  #endif
31c9afa6db122a Sasha Levin           2014-10-09  167  		mm->exe_file,
31c9afa6db122a Sasha Levin           2014-10-09  168  #ifdef CONFIG_MMU_NOTIFIER
31c9afa6db122a Sasha Levin           2014-10-09  169  		mm->mmu_notifier_mm,
31c9afa6db122a Sasha Levin           2014-10-09  170  #endif
31c9afa6db122a Sasha Levin           2014-10-09  171  #ifdef CONFIG_NUMA_BALANCING
31c9afa6db122a Sasha Levin           2014-10-09  172  		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
31c9afa6db122a Sasha Levin           2014-10-09  173  #endif
16af97dc5a8975 Nadav Amit            2017-08-10 @174  		atomic_read(&mm->tlb_flush_pending),
b8eceeb99014cf Vlastimil Babka       2016-03-15 @175  		mm->def_flags, &mm->def_flags
31c9afa6db122a Sasha Levin           2014-10-09  176  	);
31c9afa6db122a Sasha Levin           2014-10-09  177  }
31c9afa6db122a Sasha Levin           2014-10-09  178  

:::::: The code at line 174 was first introduced by commit
:::::: 16af97dc5a8975371a83d9e30a64038b48f40a2d mm: migrate: prevent racy access to tlb_flush_pending

:::::: TO: Nadav Amit <nadav.amit@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
