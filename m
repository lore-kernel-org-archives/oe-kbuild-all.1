Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5E21ADDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736765887; cv=none; b=MXCKaVp8q0wckZ+cy/pqua9eFw3yOlyzl3ZeihR8Wq7pj1TOZ2h67IxDeAqIJZfpTEJAduoPRU5qh6pfBk5PG0yxFQSsIB6BWaZE7zFgLgsydmqydYPN4PfDPsggo00nqm1G5RzMUf2pk0m07/A760RM5iUoRBHmAd4vaCLQcLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736765887; c=relaxed/simple;
	bh=EyR4khx3gI4ET7hy43jjfkgkziXG+ZH1qMhlczvl43U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reWgfLSsUYqRvtNno1KKJLR23nvrqLiJkD057eZ6ZQLRc+SmVndHQUIPTsHCzXv9oJYU/EYZX+Qj6JM/QkUP/40GjwIzUIx7k1m2hHYFGDGLlXSMQnmA17iGCd4jRVI7XySB+L9Nyu4Ruk/sAiLsCSlZitNkojapjj31x6WO1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y77VOsUf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y77VOsUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736765884; x=1768301884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EyR4khx3gI4ET7hy43jjfkgkziXG+ZH1qMhlczvl43U=;
  b=Y77VOsUfjqph9Askjdby8UIDEZedpD3YO6qLsVPrMQAr0EtiAkRlaDsK
   C/0fkrBwekfr5hSE3u7QnvwwN9IwYJ6BgFH7cb6nUYV4qGpmxhS3j3nL4
   nMkjt+QNi5BFTxz7elb8L3WkjqjpRrW2eMi77rnWgVsucoRGckvfCu9MV
   9eYc171cP78PAcievf8nOLpzTzk5SK4OWaqFt7RaEbFX6Jt1hBg85Rxrj
   YnvFrWakiq5v2vdIthaF7c0NFFlIsyBBTGNCk5OPDsNOkBrHbt2+5fZLM
   iuF7JyRogQco9PAONYpFSaelywnaiXbtW0xoBmliqdqZb5nLj/Ky634yy
   w==;
X-CSE-ConnectionGUID: sZYJjhv9QfyOUZVT4v6cWA==
X-CSE-MsgGUID: nh93vrRrS8uFVTPhlCVmug==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40960004"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40960004"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:58:04 -0800
X-CSE-ConnectionGUID: C5poffb1SZ2uGMHtMVekVg==
X-CSE-MsgGUID: AveLgqzkRLOP+4O1PUUiKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104232262"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2025 02:58:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXI8t-000N3f-0w;
	Mon, 13 Jan 2025 10:57:59 +0000
Date: Mon, 13 Jan 2025 18:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 7269/8485] arch/um/include/asm/pgtable.h:225:16:
 error: invalid use of undefined type 'struct mm_struct'
Message-ID: <202501131814.E6CxjulL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
commit: 5bfc4a3a0af3dcf53516e5f0dd9a2649bcd05bad [7269/8485] um: Remove obsolete fixmap support
config: um-randconfig-001-20250113 (https://download.01.org/0day-ci/archive/20250113/202501131814.E6CxjulL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131814.E6CxjulL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131814.E6CxjulL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:37,
                    from include/linux/sched/task_stack.h:12,
                    from include/linux/elfcore.h:7,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from kernel/reboot.c:13:
   arch/um/include/asm/pgtable.h: In function 'um_tlb_mark_sync':
>> arch/um/include/asm/pgtable.h:225:16: error: invalid use of undefined type 'struct mm_struct'
     225 |         if (!mm->context.sync_tlb_range_to) {
         |                ^~
   arch/um/include/asm/pgtable.h:226:19: error: invalid use of undefined type 'struct mm_struct'
     226 |                 mm->context.sync_tlb_range_from = start;
         |                   ^~
   arch/um/include/asm/pgtable.h:227:19: error: invalid use of undefined type 'struct mm_struct'
     227 |                 mm->context.sync_tlb_range_to = end;
         |                   ^~
   arch/um/include/asm/pgtable.h:229:31: error: invalid use of undefined type 'struct mm_struct'
     229 |                 if (start < mm->context.sync_tlb_range_from)
         |                               ^~
   arch/um/include/asm/pgtable.h:230:27: error: invalid use of undefined type 'struct mm_struct'
     230 |                         mm->context.sync_tlb_range_from = start;
         |                           ^~
   arch/um/include/asm/pgtable.h:231:29: error: invalid use of undefined type 'struct mm_struct'
     231 |                 if (end > mm->context.sync_tlb_range_to)
         |                             ^~
   arch/um/include/asm/pgtable.h:232:27: error: invalid use of undefined type 'struct mm_struct'
     232 |                         mm->context.sync_tlb_range_to = end;
         |                           ^~
--
   In file included from arch/um/include/asm/pgtable-4level.h:10,
                    from arch/um/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:37,
                    from mm/kasan/common.c:14:
>> include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
>> arch/um/include/asm/pgtable-4level.h:75:32: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      75 | static inline int pgd_needsync(pgd_t pgd)
         |                                ^~~~~
         |                                p4d_t
   arch/um/include/asm/pgtable-4level.h:80:35: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      80 | static inline void pgd_mkuptodate(pgd_t pgd) { pgd_val(pgd) &= ~_PAGE_NEEDSYNC; }
         |                                   ^~~~~
         |                                   p4d_t
>> arch/um/include/asm/pgtable-4level.h:84:31: error: unknown type name 'pud_t'; did you mean 'p4d_t'?
      84 | static inline void pud_clear (pud_t *pud)
         |                               ^~~~~
         |                               p4d_t
   arch/um/include/asm/pgtable-4level.h: In function 'p4d_clear':
>> include/asm-generic/pgtable-nop4d.h:41:60: error: implicit declaration of function '__pgd' [-Werror=implicit-function-declaration]
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^~~~~
   arch/um/include/asm/pgtable-4level.h:72:47: note: in definition of macro 'set_p4d'
      72 | #define set_p4d(p4dptr, p4dval) (*(p4dptr) = (p4dval))
         |                                               ^~~~~~
   arch/um/include/asm/pgtable-4level.h:91:22: note: in expansion of macro '__p4d'
      91 |         set_p4d(p4d, __p4d(_PAGE_NEEDSYNC));
         |                      ^~~~~
   arch/um/include/asm/pgtable-4level.h: At top level:
>> arch/um/include/asm/pgtable-4level.h:100:37: error: unknown type name 'pte_t'
     100 | static inline unsigned long pte_pfn(pte_t pte)
         |                                     ^~~~~
   arch/um/include/asm/pgtable-4level.h:105:15: error: unknown type name 'pte_t'
     105 | static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
         |               ^~~~~
>> arch/um/include/asm/pgtable-4level.h:105:52: error: unknown type name 'pgprot_t'
     105 | static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
         |                                                    ^~~~~~~~
>> arch/um/include/asm/pgtable-4level.h:114:15: error: unknown type name 'pmd_t'
     114 | static inline pmd_t pfn_pmd(unsigned long page_nr, pgprot_t pgprot)
         |               ^~~~~
   arch/um/include/asm/pgtable-4level.h:114:52: error: unknown type name 'pgprot_t'
     114 | static inline pmd_t pfn_pmd(unsigned long page_nr, pgprot_t pgprot)
         |                                                    ^~~~~~~~
>> arch/um/include/asm/pgtable.h:32:8: error: unknown type name 'pgd_t'
      32 | extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
         |        ^~~~~
>> arch/um/include/asm/pgtable.h:108:28: error: unknown type name 'pte_t'
     108 | static inline int pte_none(pte_t pte)
         |                            ^~~~~
   arch/um/include/asm/pgtable.h:117:28: error: unknown type name 'pte_t'
     117 | static inline int pte_read(pte_t pte)
         |                            ^~~~~
   arch/um/include/asm/pgtable.h:123:28: error: unknown type name 'pte_t'
     123 | static inline int pte_exec(pte_t pte){
         |                            ^~~~~
   arch/um/include/asm/pgtable.h:128:29: error: unknown type name 'pte_t'
     128 | static inline int pte_write(pte_t pte)
         |                             ^~~~~
   arch/um/include/asm/pgtable.h:134:29: error: unknown type name 'pte_t'
     134 | static inline int pte_dirty(pte_t pte)
         |                             ^~~~~
   arch/um/include/asm/pgtable.h:139:29: error: unknown type name 'pte_t'
     139 | static inline int pte_young(pte_t pte)
         |                             ^~~~~
   arch/um/include/asm/pgtable.h:144:32: error: unknown type name 'pte_t'
     144 | static inline int pte_needsync(pte_t pte)
         |                                ^~~~~
   arch/um/include/asm/pgtable.h:155:15: error: unknown type name 'pte_t'
     155 | static inline pte_t pte_mkclean(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:155:33: error: unknown type name 'pte_t'
     155 | static inline pte_t pte_mkclean(pte_t pte)
         |                                 ^~~~~
   arch/um/include/asm/pgtable.h:161:15: error: unknown type name 'pte_t'
     161 | static inline pte_t pte_mkold(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:161:31: error: unknown type name 'pte_t'
     161 | static inline pte_t pte_mkold(pte_t pte)
         |                               ^~~~~
   arch/um/include/asm/pgtable.h:167:15: error: unknown type name 'pte_t'
     167 | static inline pte_t pte_wrprotect(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:167:35: error: unknown type name 'pte_t'
     167 | static inline pte_t pte_wrprotect(pte_t pte)
         |                                   ^~~~~
   arch/um/include/asm/pgtable.h:173:15: error: unknown type name 'pte_t'
     173 | static inline pte_t pte_mkread(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:173:32: error: unknown type name 'pte_t'
     173 | static inline pte_t pte_mkread(pte_t pte)
         |                                ^~~~~
   arch/um/include/asm/pgtable.h:179:15: error: unknown type name 'pte_t'
     179 | static inline pte_t pte_mkdirty(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:179:33: error: unknown type name 'pte_t'
     179 | static inline pte_t pte_mkdirty(pte_t pte)
         |                                 ^~~~~
   arch/um/include/asm/pgtable.h:185:15: error: unknown type name 'pte_t'
     185 | static inline pte_t pte_mkyoung(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:185:33: error: unknown type name 'pte_t'
     185 | static inline pte_t pte_mkyoung(pte_t pte)
         |                                 ^~~~~
   arch/um/include/asm/pgtable.h:191:15: error: unknown type name 'pte_t'
     191 | static inline pte_t pte_mkwrite_novma(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:191:39: error: unknown type name 'pte_t'
     191 | static inline pte_t pte_mkwrite_novma(pte_t pte)
         |                                       ^~~~~
   arch/um/include/asm/pgtable.h:197:15: error: unknown type name 'pte_t'
     197 | static inline pte_t pte_mkuptodate(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:197:36: error: unknown type name 'pte_t'
     197 | static inline pte_t pte_mkuptodate(pte_t pte)
         |                                    ^~~~~
   arch/um/include/asm/pgtable.h:203:15: error: unknown type name 'pte_t'
     203 | static inline pte_t pte_mkneedsync(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:203:36: error: unknown type name 'pte_t'
     203 | static inline pte_t pte_mkneedsync(pte_t pte)
         |                                    ^~~~~
   arch/um/include/asm/pgtable.h:209:28: error: unknown type name 'pte_t'
     209 | static inline void set_pte(pte_t *pteptr, pte_t pteval)
         |                            ^~~~~
   arch/um/include/asm/pgtable.h:209:43: error: unknown type name 'pte_t'
     209 | static inline void set_pte(pte_t *pteptr, pte_t pteval)
         |                                           ^~~~~
   arch/um/include/asm/pgtable.h:222:44: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
     222 | static inline void um_tlb_mark_sync(struct mm_struct *mm, unsigned long start,
         |                                            ^~~~~~~~~
   arch/um/include/asm/pgtable.h: In function 'um_tlb_mark_sync':
>> arch/um/include/asm/pgtable.h:225:16: error: invalid use of undefined type 'struct mm_struct'
     225 |         if (!mm->context.sync_tlb_range_to) {
         |                ^~
   arch/um/include/asm/pgtable.h:226:19: error: invalid use of undefined type 'struct mm_struct'
     226 |                 mm->context.sync_tlb_range_from = start;
         |                   ^~
   arch/um/include/asm/pgtable.h:227:19: error: invalid use of undefined type 'struct mm_struct'
     227 |                 mm->context.sync_tlb_range_to = end;
         |                   ^~
   arch/um/include/asm/pgtable.h:229:31: error: invalid use of undefined type 'struct mm_struct'
     229 |                 if (start < mm->context.sync_tlb_range_from)
         |                               ^~
   arch/um/include/asm/pgtable.h:230:27: error: invalid use of undefined type 'struct mm_struct'
     230 |                         mm->context.sync_tlb_range_from = start;
         |                           ^~
   arch/um/include/asm/pgtable.h:231:29: error: invalid use of undefined type 'struct mm_struct'
     231 |                 if (end > mm->context.sync_tlb_range_to)
         |                             ^~
   arch/um/include/asm/pgtable.h:232:27: error: invalid use of undefined type 'struct mm_struct'
     232 |                         mm->context.sync_tlb_range_to = end;
         |                           ^~
   arch/um/include/asm/pgtable.h: At top level:
   arch/um/include/asm/pgtable.h:238:29: error: unknown type name 'pte_t'
     238 |                             pte_t *ptep, pte_t pte, int nr)
         |                             ^~~~~
   arch/um/include/asm/pgtable.h:238:42: error: unknown type name 'pte_t'
     238 |                             pte_t *ptep, pte_t pte, int nr)
         |                                          ^~~~~
   arch/um/include/asm/pgtable.h:255:28: error: unknown type name 'pte_t'
     255 | static inline int pte_same(pte_t pte_a, pte_t pte_b)
         |                            ^~~~~
   arch/um/include/asm/pgtable.h:255:41: error: unknown type name 'pte_t'
     255 | static inline int pte_same(pte_t pte_a, pte_t pte_b)
         |                                         ^~~~~
   arch/um/include/asm/pgtable.h:274:15: error: unknown type name 'pte_t'
     274 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:274:32: error: unknown type name 'pte_t'
     274 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                ^~~~~
>> arch/um/include/asm/pgtable.h:274:43: error: unknown type name 'pgprot_t'
     274 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                           ^~~~~~~~
   arch/um/include/asm/pgtable.h:289:8: error: unknown type name 'pte_t'
     289 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |        ^~~~~
   arch/um/include/asm/pgtable.h:316:37: error: unknown type name 'pte_t'
     316 | static inline int pte_swp_exclusive(pte_t pte)
         |                                     ^~~~~
   arch/um/include/asm/pgtable.h:321:15: error: unknown type name 'pte_t'
     321 | static inline pte_t pte_swp_mkexclusive(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:321:41: error: unknown type name 'pte_t'
     321 | static inline pte_t pte_swp_mkexclusive(pte_t pte)
         |                                         ^~~~~
   arch/um/include/asm/pgtable.h:327:15: error: unknown type name 'pte_t'
     327 | static inline pte_t pte_swp_clear_exclusive(pte_t pte)
         |               ^~~~~
   arch/um/include/asm/pgtable.h:327:45: error: unknown type name 'pte_t'
     327 | static inline pte_t pte_swp_clear_exclusive(pte_t pte)
         |                                             ^~~~~
   In file included from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/pgtable.h:14:
   include/linux/pgtable.h: In function 'pud_offset':
>> arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   arch/um/include/asm/page.h:87:49: note: in definition of macro '__va'
      87 | #define __va(phys) uml_to_virt((unsigned long) (phys))
         |                                                 ^~~~
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/um/include/asm/pgtable-4level.h:98:42: note: in expansion of macro 'p4d_val'
      98 | #define p4d_pgtable(p4d) ((pud_t *) __va(p4d_val(p4d) & PAGE_MASK))
         |                                          ^~~~~~~
   include/linux/pgtable.h:154:16: note: in expansion of macro 'p4d_pgtable'
     154 |         return p4d_pgtable(*p4d) + pud_index(address);
         |                ^~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
>> include/linux/pgtable.h:186:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pud_offset'? [-Werror=implicit-function-declaration]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pud_offset
   include/linux/pgtable.h:186:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/linux/pgtable.h:152:40: note: expected 'p4d_t *' but argument is of type 'int'
     152 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:191:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     191 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/linux/pgtable.h:152:40: note: expected 'p4d_t *' but argument is of type 'int'
     152 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'ptep_test_and_clear_young':
>> include/linux/pgtable.h:377:14: error: implicit declaration of function 'pte_young'; did you mean 'pmd_young'? [-Werror=implicit-function-declaration]
     377 |         if (!pte_young(pte))
         |              ^~~~~~~~~
         |              pmd_young
>> arch/um/include/asm/pgtable.h:236:18: error: implicit declaration of function 'set_ptes' [-Werror=implicit-function-declaration]
     236 | #define set_ptes set_ptes
         |                  ^~~~~~~~
   include/linux/pgtable.h:301:41: note: in expansion of macro 'set_ptes'
     301 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                         ^~~~~~~~
   include/linux/pgtable.h:380:17: note: in expansion of macro 'set_pte_at'
     380 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                 ^~~~~~~~~~
>> include/linux/pgtable.h:380:55: error: implicit declaration of function 'pte_mkold' [-Werror=implicit-function-declaration]
     380 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
     301 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h: In function 'clear_young_dirty_ptes':
>> include/linux/pgtable.h:520:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
     520 |                                 pte = pte_mkold(pte);
         |                                       ^~~~~~~~~
>> include/linux/pgtable.h:522:39: error: implicit declaration of function 'pte_mkclean'; did you mean 'pte_clear'? [-Werror=implicit-function-declaration]
     522 |                                 pte = pte_mkclean(pte);
         |                                       ^~~~~~~~~~~
         |                                       pte_clear
   include/linux/pgtable.h:522:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'get_and_clear_full_ptes':
>> include/linux/pgtable.h:710:21: error: implicit declaration of function 'pte_dirty'; did you mean 'pmd_dirty'? [-Werror=implicit-function-declaration]
     710 |                 if (pte_dirty(tmp_pte))
         |                     ^~~~~~~~~
         |                     pmd_dirty
>> include/linux/pgtable.h:711:31: error: implicit declaration of function 'pte_mkdirty'; did you mean 'pmd_dirty'? [-Werror=implicit-function-declaration]
     711 |                         pte = pte_mkdirty(pte);
         |                               ^~~~~~~~~~~
         |                               pmd_dirty
   include/linux/pgtable.h:711:31: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h:713:31: error: implicit declaration of function 'pte_mkyoung'; did you mean 'pmd_young'? [-Werror=implicit-function-declaration]
     713 |                         pte = pte_mkyoung(pte);
         |                               ^~~~~~~~~~~
         |                               pmd_young
   include/linux/pgtable.h:713:31: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'pte_mkwrite':
   include/linux/pgtable.h:834:16: error: implicit declaration of function 'pte_mkwrite_novma'; did you mean 'pte_mkwrite'? [-Werror=implicit-function-declaration]
     834 |         return pte_mkwrite_novma(pte);
         |                ^~~~~~~~~~~~~~~~~
         |                pte_mkwrite
   include/linux/pgtable.h:834:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
     834 |         return pte_mkwrite_novma(pte);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'ptep_set_wrprotect':
   include/linux/pgtable.h:850:39: error: implicit declaration of function 'pte_wrprotect'; did you mean 'ptep_set_wrprotect'? [-Werror=implicit-function-declaration]
     850 |         set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
         |                                       ^~~~~~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
     301 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h: In function 'p4d_same':
   arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1069:16: note: in expansion of macro 'p4d_val'
    1069 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
   arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1069:34: note: in expansion of macro 'p4d_val'
    1069 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1067:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1067 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1067:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1067 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1229:13: error: implicit declaration of function 'pgd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
    1229 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             p4d_none
   In file included from include/linux/export.h:5,
                    from mm/kasan/common.c:12:
   include/linux/pgtable.h:1231:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pmd_bad'? [-Werror=implicit-function-declaration]
    1231 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'p4d_none_or_clear_bad':
   arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/um/include/asm/pgtable-4level.h:66:28: note: in expansion of macro 'p4d_val'
      66 | #define p4d_none(x)     (!(p4d_val(x) & ~_PAGE_NEEDSYNC))
         |                            ^~~~~~~
   include/linux/pgtable.h:1240:13: note: in expansion of macro 'p4d_none'
    1240 |         if (p4d_none(*p4d))
         |             ^~~~~~~~
   arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/um/include/asm/pgtable-4level.h:67:27: note: in expansion of macro 'p4d_val'
      67 | #define p4d_bad(x)      ((p4d_val(x) & (~PAGE_MASK & ~_PAGE_USER)) != _KERNPG_TABLE)
         |                           ^~~~~~~
   include/linux/pgtable.h:1242:22: note: in expansion of macro 'p4d_bad'
    1242 |         if (unlikely(p4d_bad(*p4d))) {
         |                      ^~~~~~~
   In file included from include/linux/memblock.h:12,
                    from mm/kasan/common.c:17:
   include/linux/mm.h: In function 'p4d_alloc':
   include/linux/mm.h:2850:22: warning: pointer/integer type mismatch in conditional expression
    2850 |                 NULL : p4d_offset(pgd, address);
         |                      ^
   include/linux/mm.h: In function 'pud_alloc':
   arch/um/include/asm/page.h:65:29: error: request for member 'pgd' in something not a structure or union
      65 | #define pgd_val(x)      ((x).pgd)
         |                             ^
..


vim +225 arch/um/include/asm/pgtable.h

^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   31  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  @32  extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   33  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   34  /* zero page used for uninitialized stuff */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   35  extern unsigned long *empty_zero_page;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   36  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   37  /* Just any arbitrary offset to the start of the vmalloc VM area: the
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   38   * current 8MB value just means that there will be a 8MB "hole" after the
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   39   * physical memory until the kernel virtual memory starts.  That means that
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   40   * any out-of-bounds memory accesses will hopefully be caught.
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   41   * The vmalloc() routines leaves a hole of 4kB between each vmalloced
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   42   * area for the same reason. ;)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   43   */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   44  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   45  extern unsigned long end_iomem;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   46  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   47  #define VMALLOC_OFFSET	(__va_space)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   48  #define VMALLOC_START ((end_iomem + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1))
5bfc4a3a0af3dc arch/um/include/asm/pgtable.h Tiwei Bie                      2024-11-28   49  #define VMALLOC_END	(TASK_SIZE-2*PAGE_SIZE)
c398df30d5caad arch/um/include/asm/pgtable.h Amerigo Wang                   2009-06-03   50  #define MODULES_VADDR	VMALLOC_START
c398df30d5caad arch/um/include/asm/pgtable.h Amerigo Wang                   2009-06-03   51  #define MODULES_END	VMALLOC_END
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   52  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   53  #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED | _PAGE_DIRTY)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   54  #define _KERNPG_TABLE	(_PAGE_PRESENT | _PAGE_RW | _PAGE_ACCESSED | _PAGE_DIRTY)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   55  #define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
c398df30d5caad arch/um/include/asm/pgtable.h Amerigo Wang                   2009-06-03   56  #define __PAGE_KERNEL_EXEC                                              \
c398df30d5caad arch/um/include/asm/pgtable.h Amerigo Wang                   2009-06-03   57  	 (_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   58  #define PAGE_NONE	__pgprot(_PAGE_PROTNONE | _PAGE_ACCESSED)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   59  #define PAGE_SHARED	__pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   60  #define PAGE_COPY	__pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   61  #define PAGE_READONLY	__pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   62  #define PAGE_KERNEL	__pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
c398df30d5caad arch/um/include/asm/pgtable.h Amerigo Wang                   2009-06-03   63  #define PAGE_KERNEL_EXEC	__pgprot(__PAGE_KERNEL_EXEC)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   64  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   65  /*
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04   66   * The i386 can't do page protection for execute, and considers that the same
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04   67   * are read.
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04   68   * Also, write permissions imply read permissions. This is the closest we can
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04   69   * get..
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   70   */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   71  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   72  /*
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   73   * ZERO_PAGE is a global shared page that is always zero: used
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   74   * for zero-mapped memory areas etc..
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   75   */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   76  #define ZERO_PAGE(vaddr) virt_to_page(empty_zero_page)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   77  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   78  #define pte_clear(mm, addr, xp) pte_set_val(*(xp), (phys_t) 0, __pgprot(_PAGE_NEEDSYNC))
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   79  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   80  #define pmd_none(x)	(!((unsigned long)pmd_val(x) & ~_PAGE_NEEDSYNC))
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   81  #define	pmd_bad(x)	((pmd_val(x) & (~PAGE_MASK & ~_PAGE_USER)) != _KERNPG_TABLE)
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04   82  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   83  #define pmd_present(x)	(pmd_val(x) & _PAGE_PRESENT)
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   84  #define pmd_clear(xp)	do { pmd_val(*(xp)) = _PAGE_NEEDSYNC; } while (0)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   85  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   86  #define pmd_needsync(x)   (pmd_val(x) & _PAGE_NEEDSYNC)
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   87  #define pmd_mkuptodate(x) (pmd_val(x) &= ~_PAGE_NEEDSYNC)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   88  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   89  #define pud_needsync(x)   (pud_val(x) & _PAGE_NEEDSYNC)
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   90  #define pud_mkuptodate(x) (pud_val(x) &= ~_PAGE_NEEDSYNC)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   91  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   92  #define p4d_needsync(x)   (p4d_val(x) & _PAGE_NEEDSYNC)
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11   93  #define p4d_mkuptodate(x) (p4d_val(x) &= ~_PAGE_NEEDSYNC)
e19f97ed67d8f9 arch/um/include/asm/pgtable.h Mike Rapoport                  2019-12-04   94  
7106c51ee9a1b6 arch/um/include/asm/pgtable.h Mike Rapoport                  2022-02-04   95  #define pmd_pfn(pmd) (pmd_val(pmd) >> PAGE_SHIFT)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   96  #define pmd_page(pmd) phys_to_page(pmd_val(pmd) & PAGE_MASK)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   97  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03   98  #define pte_page(x) pfn_to_page(pte_pfn(x))
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16   99  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  100  #define pte_present(x)	pte_get_bits(x, (_PAGE_PRESENT | _PAGE_PROTNONE))
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  101  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  102  /*
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  103   * =================================
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  104   * Flags checking section.
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  105   * =================================
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  106   */
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  107  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03 @108  static inline int pte_none(pte_t pte)
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  109  {
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  110  	return pte_is_zero(pte);
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  111  }
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  112  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  113  /*
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  114   * The following only work if pte_present() is true.
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  115   * Undefined behaviour if not..
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  116   */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  117  static inline int pte_read(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  118  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  119  	return((pte_get_bits(pte, _PAGE_USER)) &&
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  120  	       !(pte_get_bits(pte, _PAGE_PROTNONE)));
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  121  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  122  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  123  static inline int pte_exec(pte_t pte){
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  124  	return((pte_get_bits(pte, _PAGE_USER)) &&
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  125  	       !(pte_get_bits(pte, _PAGE_PROTNONE)));
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  126  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  127  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  128  static inline int pte_write(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  129  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  130  	return((pte_get_bits(pte, _PAGE_RW)) &&
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  131  	       !(pte_get_bits(pte, _PAGE_PROTNONE)));
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  132  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  133  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  134  static inline int pte_dirty(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  135  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  136  	return pte_get_bits(pte, _PAGE_DIRTY);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  137  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  138  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  139  static inline int pte_young(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  140  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  141  	return pte_get_bits(pte, _PAGE_ACCESSED);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  142  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  143  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  144  static inline int pte_needsync(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  145  {
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  146  	return pte_get_bits(pte, _PAGE_NEEDSYNC);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  147  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  148  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  149  /*
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  150   * =================================
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  151   * Flags setting section.
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  152   * =================================
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  153   */
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  154  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  155  static inline pte_t pte_mkclean(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  156  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  157  	pte_clear_bits(pte, _PAGE_DIRTY);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  158  	return(pte);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  159  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  160  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  161  static inline pte_t pte_mkold(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  162  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  163  	pte_clear_bits(pte, _PAGE_ACCESSED);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  164  	return(pte);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  165  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  166  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  167  static inline pte_t pte_wrprotect(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  168  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  169  	pte_clear_bits(pte, _PAGE_RW);
8892d8545f2d03 arch/um/include/asm/pgtable.h Anton Ivanov                   2018-12-05  170  	return pte;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  171  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  172  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  173  static inline pte_t pte_mkread(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  174  {
1463fdbcc797df include/asm-um/pgtable.h      Jeff Dike                      2007-02-28  175  	pte_set_bits(pte, _PAGE_USER);
2717c6b649e184 arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  176  	return pte;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  177  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  178  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  179  static inline pte_t pte_mkdirty(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  180  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  181  	pte_set_bits(pte, _PAGE_DIRTY);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  182  	return(pte);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  183  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  184  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  185  static inline pte_t pte_mkyoung(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  186  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  187  	pte_set_bits(pte, _PAGE_ACCESSED);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  188  	return(pte);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  189  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  190  
2f0584f3f4bd60 arch/um/include/asm/pgtable.h Rick Edgecombe                 2023-06-12  191  static inline pte_t pte_mkwrite_novma(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  192  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  193  	pte_set_bits(pte, _PAGE_RW);
2717c6b649e184 arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  194  	return pte;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  195  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  196  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  197  static inline pte_t pte_mkuptodate(pte_t pte)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  198  {
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  199  	pte_clear_bits(pte, _PAGE_NEEDSYNC);
2717c6b649e184 arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  200  	return pte;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  201  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  202  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  203  static inline pte_t pte_mkneedsync(pte_t pte)
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  204  {
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  205  	pte_set_bits(pte, _PAGE_NEEDSYNC);
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  206  	return(pte);
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  207  }
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  208  
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  209  static inline void set_pte(pte_t *pteptr, pte_t pteval)
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  210  {
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  211  	pte_copy(*pteptr, pteval);
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  212  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  213  	/* If it's a swap entry, it needs to be marked _PAGE_NEEDSYNC so
2717c6b649e184 arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  214  	 * update_pte_range knows to unmap it.
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  215  	 */
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  216  
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  217  	*pteptr = pte_mkneedsync(*pteptr);
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  218  }
ea70d791c16875 arch/um/include/asm/pgtable.h Bartosz Golaszewski            2019-04-11  219  
fd8132e6e9fdec arch/um/include/asm/pgtable.h Matthew Wilcox (Oracle         2023-08-02  220) #define PFN_PTE_SHIFT		PAGE_SHIFT
08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike                      2005-09-03  221  
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  222  static inline void um_tlb_mark_sync(struct mm_struct *mm, unsigned long start,
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  223  				    unsigned long end)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  224  {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03 @225  	if (!mm->context.sync_tlb_range_to) {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  226  		mm->context.sync_tlb_range_from = start;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  227  		mm->context.sync_tlb_range_to = end;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  228  	} else {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  229  		if (start < mm->context.sync_tlb_range_from)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  230  			mm->context.sync_tlb_range_from = start;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  231  		if (end > mm->context.sync_tlb_range_to)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  232  			mm->context.sync_tlb_range_to = end;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  233  	}
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  234  }
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  235  
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03 @236  #define set_ptes set_ptes
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  237  static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  238  			    pte_t *ptep, pte_t pte, int nr)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  239  {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  240  	/* Basically the default implementation */
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  241  	size_t length = nr * PAGE_SIZE;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  242  
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  243  	for (;;) {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  244  		set_pte(ptep, pte);
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  245  		if (--nr == 0)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  246  			break;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  247  		ptep++;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  248  		pte = __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  249  	}
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  250  
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  251  	um_tlb_mark_sync(mm, addr, addr + length);
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  252  }
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg                  2024-07-03  253  
f15b9000eb1d09 arch/um/include/asm/pgtable.h Richard Weinberger             2012-04-14  254  #define __HAVE_ARCH_PTE_SAME
f15b9000eb1d09 arch/um/include/asm/pgtable.h Richard Weinberger             2012-04-14 @255  static inline int pte_same(pte_t pte_a, pte_t pte_b)
f15b9000eb1d09 arch/um/include/asm/pgtable.h Richard Weinberger             2012-04-14  256  {
9b0881858c74ae arch/um/include/asm/pgtable.h Tiwei Bie                      2024-10-11  257  	return !((pte_val(pte_a) ^ pte_val(pte_b)) & ~_PAGE_NEEDSYNC);
f15b9000eb1d09 arch/um/include/asm/pgtable.h Richard Weinberger             2012-04-14  258  }
f15b9000eb1d09 arch/um/include/asm/pgtable.h Richard Weinberger             2012-04-14  259  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  260  /*
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  261   * Conversion functions: convert a page and protection to a page entry,
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  262   * and a page entry and page directory to the page they refer to.
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  263   */
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  264  
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  265  #define __virt_to_page(virt) phys_to_page(__pa(virt))
d83ecf083a2163 include/asm-um/pgtable.h      Jeff Dike                      2008-02-04  266  #define virt_to_page(addr) __virt_to_page((const unsigned long) addr)
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  267  
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  268  #define mk_pte(page, pgprot) \
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  269  	({ pte_t pte;					\
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  270  							\
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  271  	pte_set_val(pte, page_to_phys(page), (pgprot));	\
d99c4022f60a9a include/asm-um/pgtable.h      Paolo 'Blaisorblade' Giarrusso 2005-09-10  272  	pte;})
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  273  
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16 @274  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  275  {
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  276  	pte_set_val(pte, (pte_val(pte) & _PAGE_CHG_MASK), newprot);
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  277  	return pte;
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  278  }
^1da177e4c3f41 include/asm-um/pgtable.h      Linus Torvalds                 2005-04-16  279  

:::::: The code at line 225 was first introduced by commit
:::::: bcf3d957c63d8b6d718b862fea18c5f14ce803e2 um: refactor TLB update handling

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
