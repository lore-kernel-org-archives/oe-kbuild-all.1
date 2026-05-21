Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023E1FC7C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346978; cv=none; b=hGB6yNoHK1eAsAgeAT3E2vk1HPU3+Spw7F9iyelAYm6P36jGIpU/RGCDj/219tJKMJ0ZBDcDefpnCxTt2U2LKcEFaXl80ojbioytK2iquJQSXMUgbQRghGHT7YC3gEKE+NH6xkgjos5iQsMz3VerWQ9lDCSM+V1dPA+d8Ei+NeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346978; c=relaxed/simple;
	bh=n8IIK9P8/51nAPvSXzeEIgffemwWrLiS5KEVpbhQ8n8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FLBkaRqeZlZdU6cii9WeNh5PaCdteoVwdqk/OkKi//q8nRq8F5CaD2Gozt+X8zx5J9Pbu3xEQC9HGpGBeLE3mYrtsEHKDrWn78snBpV6r0tMflbPDAzM5rkIrDd/6IY+AxuxBvysZGGgZWQht6ekRqVqUSkLUArAFXFfTkdmZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjYu15s3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjYu15s3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779346976; x=1810882976;
  h=date:from:to:cc:subject:message-id;
  bh=n8IIK9P8/51nAPvSXzeEIgffemwWrLiS5KEVpbhQ8n8=;
  b=hjYu15s3GpHJiBZQOQJdkB+8Z+YRzoA2S4I2cGjUchBJeTG0CDDu2+nH
   XB2tAU69QQHeNOpuxD4H4gbUpUvVeFkkMJVNJ6j9eXfSzUXXWAYjPqH7C
   yfKfV/EFwjoXBUF5SIza3jkIGC/a7+4e9sz3goQWK26nw9S8FL5dYyPCb
   rKWUttE1/WMGLneVH7tNGeD2LsJdzgTL12g/fje6+0XQ33nj5e+1SoKjG
   27541twnD2eGCxpidgfro0VcAYF1iVdCFC72T7/y2jMRbc0I34+Bkk5Me
   bzyL8q++VQffJ96R7hKUD2MzS02Ylt2IWAGMtDyxi6a6fULAT4osJX6EZ
   A==;
X-CSE-ConnectionGUID: bvaQwPjMTmmlVS9bI6INJw==
X-CSE-MsgGUID: KEcRMfKESm+ZaLFfA1+lpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90953886"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90953886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:02:55 -0700
X-CSE-ConnectionGUID: HyZ6ntKASAG+ruO+HkPGrg==
X-CSE-MsgGUID: I3SqkVATRZe6I/HLgQeLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="245478154"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2026 00:02:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPxQh-00000000Ant-0fwf;
	Thu, 21 May 2026 07:02:51 +0000
Date: Thu, 21 May 2026 09:02:12 +0200
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Rik van Riel <riel@surriel.com>
Subject: mm/page_alloc.c:380:44: error: invalid use of undefined type
 'const struct pageblock_data'
Message-ID: <202605210818.YDtxpWKs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260520-231340
head:   f078b5654577f53b34108d1196286629a290924b
commit: 7eff0903e179ba6ea6f3deef47feebeeb893d7ae mm: page_alloc: per-cpu pageblock buddy allocator
date:   16 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605210818.YDtxpWKs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210818.YDtxpWKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210818.YDtxpWKs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
   mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
   mm/page_alloc.c:329:44: error: invalid use of undefined type 'struct pageblock_data'
     329 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
   In file included from <command-line>:
   mm/page_alloc.c: In function 'pbd_migratetype':
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:635:53: note: in definition of macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   ./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from ./include/linux/compiler.h:369,
                    from ./include/asm-generic/bug.h:5,
                    from ./arch/x86/include/asm/bug.h:193,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./include/linux/mm.h:7,
                    from mm/page_alloc.c:18:
>> mm/page_alloc.c:380:44: error: invalid use of undefined type 'const struct pageblock_data'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/page_alloc.c:380:31: note: in expansion of macro 'READ_ONCE'
     380 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   mm/page_alloc.c: In function 'init_pageblock_migratetype':
   mm/page_alloc.c:509:12: error: invalid use of undefined type 'struct pageblock_data'
     509 |         pbd->block_pfn = pfn;
         |            ^~
   mm/page_alloc.c:510:28: error: invalid use of undefined type 'struct pageblock_data'
     510 |         INIT_LIST_HEAD(&pbd->cpu_node);
         |                            ^~
   mm/page_alloc.c: In function 'clear_pcpblock_owner':
   mm/page_alloc.c:679:12: error: invalid use of undefined type 'struct pageblock_data'
     679 |         pbd->cpu = 0;
         |            ^~
   mm/page_alloc.c:680:27: error: invalid use of undefined type 'struct pageblock_data'
     680 |         list_del_init(&pbd->cpu_node);
         |                           ^~
   mm/page_alloc.c: In function 'set_pcpblock_owner':
   mm/page_alloc.c:685:50: error: invalid use of undefined type 'struct pageblock_data'
     685 |         pfn_to_pageblock(page, page_to_pfn(page))->cpu = cpu + 1;
         |                                                  ^~
   mm/page_alloc.c: In function 'get_pcpblock_owner':
   mm/page_alloc.c:690:57: error: invalid use of undefined type 'struct pageblock_data'
     690 |         return pfn_to_pageblock(page, page_to_pfn(page))->cpu - 1;
         |                                                         ^~
   mm/page_alloc.c: In function 'free_pcppages_bulk':
   mm/page_alloc.c:1583:52: error: invalid use of undefined type 'struct pageblock_data'
    1583 |                                 if (list_empty(&pbd->cpu_node))
         |                                                    ^~
   mm/page_alloc.c:1584:54: error: invalid use of undefined type 'struct pageblock_data'
    1584 |                                         list_add(&pbd->cpu_node, &pcp->owned_blocks);
         |                                                      ^~
   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:31:
   mm/page_alloc.c: In function 'rmqueue_bulk':
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:17:
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/kernel.h:22,
                    from ./include/linux/random.h:7,
                    from ./include/linux/nodemask.h:94,
                    from ./include/linux/numa.h:6,
                    from ./include/linux/cpumask.h:15,
                    from ./arch/x86/include/asm/paravirt.h:19,
                    from ./arch/x86/include/asm/irqflags.h:100,
                    from ./include/linux/irqflags.h:18,
                    from ./include/linux/spinlock.h:59,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:8:
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/random.h:8:
>> ./include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:773:26: error: invalid use of undefined type 'struct pageblock_data'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   ./include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2698:9: note: in expansion of macro 'list_for_each_entry_safe'
    2698 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2702:31: error: invalid use of undefined type 'struct pageblock_data'
    2702 |                 base_pfn = pbd->block_pfn;
         |                               ^~
   mm/page_alloc.c:2723:35: error: invalid use of undefined type 'struct pageblock_data'
    2723 |                 list_del_init(&pbd->cpu_node);
         |                                   ^~
   mm/page_alloc.c: In function '__free_frozen_pages':
   mm/page_alloc.c:3261:24: error: invalid use of undefined type 'struct pageblock_data'
    3261 |         owner_cpu = pbd->cpu - 1;
         |                        ^~
   mm/page_alloc.c: In function 'free_unref_folios':


vim +380 mm/page_alloc.c

   372	
   373	/*
   374	 * Extract migratetype from a pageblock_data pointer. Callers that
   375	 * already have the pbd can avoid a redundant pfn_to_pageblock().
   376	 */
   377	static __always_inline enum migratetype
   378	pbd_migratetype(const struct pageblock_data *pbd)
   379	{
 > 380		unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
