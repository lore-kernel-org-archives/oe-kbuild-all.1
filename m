Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A381863F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731861721; cv=none; b=K7MgInrRIB7iuVmpJ7Ex/W3KfsB67tKsH5nTUuqd1uDbJ16ls8/IsCzOfmZLh8gdTCHrY1u+BcxFHT4ilap5DBVflq+r3MzEcg5mJ/WKpVGMwFePaoMKfKyWhN1MiqhRF0E36787zKITeEH+9qfP+u8vnW9gK8pJDfbA+RPfcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731861721; c=relaxed/simple;
	bh=Ru1hsl6jKXEx5tHjqOF/XItC5ZwDZuh0CVSVZhtQD8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ci9gqL11FHy8GJFd6PJ9Hl5TM8pB3/nLdqHWHQOWIyLkW8+fMCOhONMYqPZxFs17PlIsTK7OBWyrvSIS5t/TJynRTZG/3s/s2+B1zYPQ+hsobOFDngmTSrc9MaNtEWzYMnHhULwJmhWpdJFfNZCDuMm08oIwow6DNeYVjIt98Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLTZr1Jr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLTZr1Jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731861720; x=1763397720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ru1hsl6jKXEx5tHjqOF/XItC5ZwDZuh0CVSVZhtQD8w=;
  b=MLTZr1JrbIH6UbaRkD6yBq7wAeyfppKbMidrWulgMaRz6QnvtZhyy1cH
   ZX2jm2HqxkK2+L9Wt/5/bGVGU7PxH1mnsSUVVJdSckHtGV7qe/qYBvkGw
   Mwu773gOZ/Rn6mVTu6ajwCqDqt6KAFTuPxPBaqXH+yPT7C41sb8Gepk/p
   C8a3wuNO6/B1L4I79UB7c3lTayj3q1PR9UxnYfCu/o331xhw5XJy9mTc8
   uIODbuic3q33tKDGKUwhR6AfNo+kwpM+KebxJSJ1uvNHghjFx2KReZsfC
   VkRbKy2+cGUt95Uwewy6yn11aVRYJE8qla1nue2nXwyawOG9MXu25cGbD
   g==;
X-CSE-ConnectionGUID: gEa3zFq5SV6f1bdYgAxlIg==
X-CSE-MsgGUID: l9oOGU8wRS+WvP85y5Nb9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43202937"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="43202937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:41:57 -0800
X-CSE-ConnectionGUID: 8reX+PMTQ0SJFK4ma8YQxw==
X-CSE-MsgGUID: Hlz2Gtq6Tve2wBGB0NNPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="94103677"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2024 08:41:55 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCiLQ-0001vP-1D;
	Sun, 17 Nov 2024 16:41:52 +0000
Date: Mon, 18 Nov 2024 00:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] mm/debug.c:174:3: warning:
 format specifies type 'void *' but the argument has type 'int'
Message-ID: <202411180058.QxW4RRZo-lkp@intel.com>
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
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: 2d2fe6b40444bd8f84f674930ac5f98a6314702e [1297/1297] ascend: mm: add an owner for mm_struct
config: x86_64-randconfig-r121-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180058.QxW4RRZo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180058.QxW4RRZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180058.QxW4RRZo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/debug.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/debug.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/debug.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   In file included from mm/debug.c:14:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/debug.c:174:3: warning: format specifies type 'void *' but the argument has type 'int' [-Wformat]
     137 |                 atomic_read(&mm->tlb_flush_pending),
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
   5 warnings generated.


vim +174 mm/debug.c

7cd12b4abfd2f8f Vlastimil Babka       2016-03-15  @14  #include <linux/migrate.h>
4e462112e98f9ad Vlastimil Babka       2016-03-15   15  #include <linux/page_owner.h>
82742a3a5152195 Sasha Levin           2014-10-09   16  
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   17  #include "internal.h"
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   18  
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   19  char *migrate_reason_names[MR_TYPES] = {
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   20  	"compaction",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   21  	"memory_failure",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   22  	"memory_hotplug",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   23  	"syscall_or_cpuset",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   24  	"mempolicy_mbind",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   25  	"numa_misplaced",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   26  	"cma",
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   27  };
7cd12b4abfd2f8f Vlastimil Babka       2016-03-15   28  
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   29  const struct trace_print_flags pageflag_names[] = {
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   30  	__def_pageflag_names,
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   31  	{0, NULL}
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   32  };
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   33  
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   34  const struct trace_print_flags gfpflag_names[] = {
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   35  	__def_gfpflag_names,
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   36  	{0, NULL}
420adbe9fc1a451 Vlastimil Babka       2016-03-15   37  };
420adbe9fc1a451 Vlastimil Babka       2016-03-15   38  
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   39  const struct trace_print_flags vmaflag_names[] = {
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   40  	__def_vmaflag_names,
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   41  	{0, NULL}
82742a3a5152195 Sasha Levin           2014-10-09   42  };
82742a3a5152195 Sasha Levin           2014-10-09   43  
ff8e81163889ac4 Vlastimil Babka       2016-03-15   44  void __dump_page(struct page *page, const char *reason)
82742a3a5152195 Sasha Levin           2014-10-09   45  {
fc36def997cfd6c Pavel Tatashin        2018-07-03   46  	bool page_poisoned = PagePoisoned(page);
fc36def997cfd6c Pavel Tatashin        2018-07-03   47  	int mapcount;
fc36def997cfd6c Pavel Tatashin        2018-07-03   48  
fc36def997cfd6c Pavel Tatashin        2018-07-03   49  	/*
fc36def997cfd6c Pavel Tatashin        2018-07-03   50  	 * If struct page is poisoned don't access Page*() functions as that
fc36def997cfd6c Pavel Tatashin        2018-07-03   51  	 * leads to recursive loop. Page*() check for poisoned pages, and calls
fc36def997cfd6c Pavel Tatashin        2018-07-03   52  	 * dump_page() when detected.
fc36def997cfd6c Pavel Tatashin        2018-07-03   53  	 */
fc36def997cfd6c Pavel Tatashin        2018-07-03   54  	if (page_poisoned) {
fc36def997cfd6c Pavel Tatashin        2018-07-03   55  		pr_emerg("page:%px is uninitialized and poisoned", page);
fc36def997cfd6c Pavel Tatashin        2018-07-03   56  		goto hex_only;
fc36def997cfd6c Pavel Tatashin        2018-07-03   57  	}
fc36def997cfd6c Pavel Tatashin        2018-07-03   58  
9996f05eac09815 Kirill A. Shutemov    2016-10-07   59  	/*
9996f05eac09815 Kirill A. Shutemov    2016-10-07   60  	 * Avoid VM_BUG_ON() in page_mapcount().
9996f05eac09815 Kirill A. Shutemov    2016-10-07   61  	 * page->_mapcount space in struct page is used by sl[aou]b pages to
9996f05eac09815 Kirill A. Shutemov    2016-10-07   62  	 * encode own info.
9996f05eac09815 Kirill A. Shutemov    2016-10-07   63  	 */
fc36def997cfd6c Pavel Tatashin        2018-07-03   64  	mapcount = PageSlab(page) ? 0 : page_mapcount(page);
4d35427ad7641cb Kirill A. Shutemov    2016-09-19   65  
152a2d199e1385c Matthew Wilcox        2018-01-04   66  	pr_emerg("page:%px count:%d mapcount:%d mapping:%px index:%#lx",
4d35427ad7641cb Kirill A. Shutemov    2016-09-19   67  		  page, page_ref_count(page), mapcount,
4d35427ad7641cb Kirill A. Shutemov    2016-09-19   68  		  page->mapping, page_to_pgoff(page));
53f9263baba69fc Kirill A. Shutemov    2016-01-15   69  	if (PageCompound(page))
53f9263baba69fc Kirill A. Shutemov    2016-01-15   70  		pr_cont(" compound_mapcount: %d", compound_mapcount(page));
53f9263baba69fc Kirill A. Shutemov    2016-01-15   71  	pr_cont("\n");
edf14cdbf9a0e5a Vlastimil Babka       2016-03-15   72  	BUILD_BUG_ON(ARRAY_SIZE(pageflag_names) != __NR_PAGEFLAGS + 1);
ff8e81163889ac4 Vlastimil Babka       2016-03-15   73  
b8eceeb99014cf5 Vlastimil Babka       2016-03-15   74  	pr_emerg("flags: %#lx(%pGp)\n", page->flags, &page->flags);
b8eceeb99014cf5 Vlastimil Babka       2016-03-15   75  
fc36def997cfd6c Pavel Tatashin        2018-07-03   76  hex_only:
46e8a3a08c23d07 Vlastimil Babka       2016-12-12   77  	print_hex_dump(KERN_ALERT, "raw: ", DUMP_PREFIX_NONE, 32,
46e8a3a08c23d07 Vlastimil Babka       2016-12-12   78  			sizeof(unsigned long), page,
46e8a3a08c23d07 Vlastimil Babka       2016-12-12   79  			sizeof(struct page), false);
46e8a3a08c23d07 Vlastimil Babka       2016-12-12   80  
82742a3a5152195 Sasha Levin           2014-10-09   81  	if (reason)
82742a3a5152195 Sasha Levin           2014-10-09   82  		pr_alert("page dumped because: %s\n", reason);
b8eceeb99014cf5 Vlastimil Babka       2016-03-15   83  
9edad6ea0f14164 Johannes Weiner       2014-12-10   84  #ifdef CONFIG_MEMCG
fc36def997cfd6c Pavel Tatashin        2018-07-03   85  	if (!page_poisoned && page->mem_cgroup)
152a2d199e1385c Matthew Wilcox        2018-01-04   86  		pr_alert("page->mem_cgroup:%px\n", page->mem_cgroup);
9edad6ea0f14164 Johannes Weiner       2014-12-10   87  #endif
82742a3a5152195 Sasha Levin           2014-10-09   88  }
82742a3a5152195 Sasha Levin           2014-10-09   89  
82742a3a5152195 Sasha Levin           2014-10-09   90  void dump_page(struct page *page, const char *reason)
82742a3a5152195 Sasha Levin           2014-10-09   91  {
ff8e81163889ac4 Vlastimil Babka       2016-03-15   92  	__dump_page(page, reason);
4e462112e98f9ad Vlastimil Babka       2016-03-15   93  	dump_page_owner(page);
82742a3a5152195 Sasha Levin           2014-10-09   94  }
82742a3a5152195 Sasha Levin           2014-10-09   95  EXPORT_SYMBOL(dump_page);
82742a3a5152195 Sasha Levin           2014-10-09   96  
82742a3a5152195 Sasha Levin           2014-10-09   97  #ifdef CONFIG_DEBUG_VM
82742a3a5152195 Sasha Levin           2014-10-09   98  
82742a3a5152195 Sasha Levin           2014-10-09   99  void dump_vma(const struct vm_area_struct *vma)
82742a3a5152195 Sasha Levin           2014-10-09  100  {
152a2d199e1385c Matthew Wilcox        2018-01-04  101  	pr_emerg("vma %px start %px end %px\n"
152a2d199e1385c Matthew Wilcox        2018-01-04  102  		"next %px prev %px mm %px\n"
152a2d199e1385c Matthew Wilcox        2018-01-04  103  		"prot %lx anon_vma %px vm_ops %px\n"
152a2d199e1385c Matthew Wilcox        2018-01-04  104  		"pgoff %lx file %px private_data %px\n"
b8eceeb99014cf5 Vlastimil Babka       2016-03-15  105  		"flags: %#lx(%pGv)\n",
82742a3a5152195 Sasha Levin           2014-10-09  106  		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_next,
82742a3a5152195 Sasha Levin           2014-10-09  107  		vma->vm_prev, vma->vm_mm,
82742a3a5152195 Sasha Levin           2014-10-09  108  		(unsigned long)pgprot_val(vma->vm_page_prot),
82742a3a5152195 Sasha Levin           2014-10-09  109  		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
b8eceeb99014cf5 Vlastimil Babka       2016-03-15  110  		vma->vm_file, vma->vm_private_data,
b8eceeb99014cf5 Vlastimil Babka       2016-03-15  111  		vma->vm_flags, &vma->vm_flags);
82742a3a5152195 Sasha Levin           2014-10-09  112  }
82742a3a5152195 Sasha Levin           2014-10-09  113  EXPORT_SYMBOL(dump_vma);
82742a3a5152195 Sasha Levin           2014-10-09  114  
31c9afa6db122a5 Sasha Levin           2014-10-09  115  void dump_mm(const struct mm_struct *mm)
31c9afa6db122a5 Sasha Levin           2014-10-09  116  {
7a9cdebdcc17e42 Linus Torvalds        2018-09-12  117  	pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  118  #ifdef CONFIG_MMU
152a2d199e1385c Matthew Wilcox        2018-01-04  119  		"get_unmapped_area %px\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  120  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  121  		"mmap_base %lu mmap_legacy_base %lu highest_vm_end %lu\n"
152a2d199e1385c Matthew Wilcox        2018-01-04  122  		"pgd %px mm_users %d mm_count %d pgtables_bytes %lu map_count %d\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  123  		"hiwater_rss %lx hiwater_vm %lx total_vm %lx locked_vm %lx\n"
84638335900f199 Konstantin Khlebnikov 2016-01-14  124  		"pinned_vm %lx data_vm %lx exec_vm %lx stack_vm %lx\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  125  		"start_code %lx end_code %lx start_data %lx end_data %lx\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  126  		"start_brk %lx brk %lx start_stack %lx\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  127  		"arg_start %lx arg_end %lx env_start %lx env_end %lx\n"
152a2d199e1385c Matthew Wilcox        2018-01-04  128  		"binfmt %px flags %lx core_state %px\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  129  #ifdef CONFIG_AIO
152a2d199e1385c Matthew Wilcox        2018-01-04  130  		"ioctx_table %px\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  131  #endif
2d2fe6b40444bd8 Ding Tianhong         2021-10-30  132  #ifdef CONFIG_MM_OWNER
152a2d199e1385c Matthew Wilcox        2018-01-04  133  		"owner %px "
31c9afa6db122a5 Sasha Levin           2014-10-09  134  #endif
152a2d199e1385c Matthew Wilcox        2018-01-04  135  		"exe_file %px\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  136  #ifdef CONFIG_MMU_NOTIFIER
152a2d199e1385c Matthew Wilcox        2018-01-04  137  		"mmu_notifier_mm %px\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  138  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  139  #ifdef CONFIG_NUMA_BALANCING
31c9afa6db122a5 Sasha Levin           2014-10-09  140  		"numa_next_scan %lu numa_scan_offset %lu numa_scan_seq %d\n"
31c9afa6db122a5 Sasha Levin           2014-10-09  141  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  142  		"tlb_flush_pending %d\n"
b8eceeb99014cf5 Vlastimil Babka       2016-03-15 @143  		"def_flags: %#lx(%pGv)\n",
31c9afa6db122a5 Sasha Levin           2014-10-09  144  
7a9cdebdcc17e42 Linus Torvalds        2018-09-12  145  		mm, mm->mmap, (long long) mm->vmacache_seqnum, mm->task_size,
31c9afa6db122a5 Sasha Levin           2014-10-09  146  #ifdef CONFIG_MMU
31c9afa6db122a5 Sasha Levin           2014-10-09  147  		mm->get_unmapped_area,
31c9afa6db122a5 Sasha Levin           2014-10-09  148  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  149  		mm->mmap_base, mm->mmap_legacy_base, mm->highest_vm_end,
31c9afa6db122a5 Sasha Levin           2014-10-09  150  		mm->pgd, atomic_read(&mm->mm_users),
31c9afa6db122a5 Sasha Levin           2014-10-09  151  		atomic_read(&mm->mm_count),
af5b0f6a09e42c9 Kirill A. Shutemov    2017-11-15  152  		mm_pgtables_bytes(mm),
31c9afa6db122a5 Sasha Levin           2014-10-09  153  		mm->map_count,
53f4e528406789b Daniel Jordan         2019-08-14  154  		mm->hiwater_rss, mm->hiwater_vm, mm->total_vm,
53f4e528406789b Daniel Jordan         2019-08-14  155  		atomic_long_read(&mm->locked_vm),
84638335900f199 Konstantin Khlebnikov 2016-01-14  156  		mm->pinned_vm, mm->data_vm, mm->exec_vm, mm->stack_vm,
31c9afa6db122a5 Sasha Levin           2014-10-09  157  		mm->start_code, mm->end_code, mm->start_data, mm->end_data,
31c9afa6db122a5 Sasha Levin           2014-10-09  158  		mm->start_brk, mm->brk, mm->start_stack,
31c9afa6db122a5 Sasha Levin           2014-10-09  159  		mm->arg_start, mm->arg_end, mm->env_start, mm->env_end,
31c9afa6db122a5 Sasha Levin           2014-10-09  160  		mm->binfmt, mm->flags, mm->core_state,
31c9afa6db122a5 Sasha Levin           2014-10-09  161  #ifdef CONFIG_AIO
31c9afa6db122a5 Sasha Levin           2014-10-09  162  		mm->ioctx_table,
31c9afa6db122a5 Sasha Levin           2014-10-09  163  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  164  #ifdef CONFIG_MEMCG
31c9afa6db122a5 Sasha Levin           2014-10-09  165  		mm->owner,
31c9afa6db122a5 Sasha Levin           2014-10-09  166  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  167  		mm->exe_file,
31c9afa6db122a5 Sasha Levin           2014-10-09  168  #ifdef CONFIG_MMU_NOTIFIER
31c9afa6db122a5 Sasha Levin           2014-10-09  169  		mm->mmu_notifier_mm,
31c9afa6db122a5 Sasha Levin           2014-10-09  170  #endif
31c9afa6db122a5 Sasha Levin           2014-10-09  171  #ifdef CONFIG_NUMA_BALANCING
31c9afa6db122a5 Sasha Levin           2014-10-09  172  		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
31c9afa6db122a5 Sasha Levin           2014-10-09  173  #endif
16af97dc5a89753 Nadav Amit            2017-08-10 @174  		atomic_read(&mm->tlb_flush_pending),
b8eceeb99014cf5 Vlastimil Babka       2016-03-15 @175  		mm->def_flags, &mm->def_flags
31c9afa6db122a5 Sasha Levin           2014-10-09  176  	);
31c9afa6db122a5 Sasha Levin           2014-10-09  177  }
31c9afa6db122a5 Sasha Levin           2014-10-09  178  

:::::: The code at line 174 was first introduced by commit
:::::: 16af97dc5a8975371a83d9e30a64038b48f40a2d mm: migrate: prevent racy access to tlb_flush_pending

:::::: TO: Nadav Amit <nadav.amit@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
