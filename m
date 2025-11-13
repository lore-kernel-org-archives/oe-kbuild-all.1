Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152034DCE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036836; cv=none; b=WzCQVz5IhncPn6oU1eTXUHkN+zY3LeRME3gATAlgI9NpmMWFBiMOMLDrwG1TNsIIFIVwPmG4fio0Rvjh1vkUfYTmtTqNoeFtnOvwhadv+3B5iWICsuStsUTXKkkrAw75K6kwTZnBwEFwP9cDe2aoLgQrki+KmMwdJNQ+TM1Jyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036836; c=relaxed/simple;
	bh=9YKDJvqo43CiDTABoeX6SOfBTdvF1QGBBQkMMDUt4oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgLQdMdOvTdRubDYlJcoxkloDA5Zk7742Xr/jKB3/uXFTt3VtxBEbSp/5vrUNAd8MT9CvHX0iPbu6PaEDo8XlFXJDINbPrvfuCar6rHZqxOJQH8XBLU+TAm9JE5DcOsTAwq2smnhwVkeXz8mIbcpBaFhlqn02XOqPpHKC+rwLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQpBYnGZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQpBYnGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763036834; x=1794572834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9YKDJvqo43CiDTABoeX6SOfBTdvF1QGBBQkMMDUt4oA=;
  b=YQpBYnGZEy6o+E43IVTrqOdweQhuR7GmHN5CYPbktE8JmN8rLwjdARxo
   38zFLtBDRx6u39Xa819nMxW3XccRIyd7bDVltO9C4Fs/nLH8duGM2nw7J
   6MORVdl653SqB5Bmm79EOWKaBzjgO9UoHGdRUNTxmlehcEp5PVc4Ke7Sn
   GRTh7KEYNrNCrOcYbkmobrUUpxB/8Pe0vNb1trbwWLxlBaR5zZgJkUpp/
   J1auCSHEJWu5YpTLunop3FnGlr6hSZHalQNEuloIHXtY+8GgD4m3vpURV
   rK05ALzvzn/MbQnOLtcYm+c56aH8jxnPwyutgSlW1MvPwHYRfqb9SnY4j
   g==;
X-CSE-ConnectionGUID: PsebC7hoTB2+d6hxINeEtQ==
X-CSE-MsgGUID: h0QCvIdJSgSlW8Vu5t6n0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75793363"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="75793363"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:27:12 -0800
X-CSE-ConnectionGUID: CwEwsBPdQf+Q52xtV60pbQ==
X-CSE-MsgGUID: f5N/fGfJQ0+9LoLGf+QsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="226789280"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2025 04:27:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJWPs-0005Jn-1a;
	Thu, 13 Nov 2025 12:27:08 +0000
Date: Thu, 13 Nov 2025 20:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 36/283] include/uapi/linux/const.h:20:25:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '17179869184' to '0'
Message-ID: <202511132024.tfRZgB5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f58b4cb6b0c11172a25c2ade23477f55596d7138
commit: 2f6ff71280ffddb27ad7174d24f573e2683870cd [36/283] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
config: sh-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132024.tfRZgB5P-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132024.tfRZgB5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511132024.tfRZgB5P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/migrate.h:5,
                    from mm/migrate.c:16:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:346: Error: offset to unaligned destination
   {standard input}:9897: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/backing-dev.h:13,
                    from mm/vma_internal.h:12,
                    from mm/vma_init.c:8:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/oom.h:6,
                    from mm/oom_kill.c:21:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:6594: Error: offset to unaligned destination
   {standard input}:6866: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from mm/shmem.c:24:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:4979: Error: offset to unaligned destination
   {standard input}:5987: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/ksm.c:17:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:14481: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/mmap.c:13:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:4912: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_alloc.c:19:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'alloc_contig_range_noprof':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/page_alloc.c:6910:61: note: in expansion of macro 'MAX_FOLIO_ORDER'
    6910 |         if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
         |                                                             ^~~~~~~~~~~~~~~
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/backing-dev.h:13,
                    from mm/truncate.c:12:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:1964: Error: offset to unaligned destination
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/hugetlb.c:8:
   mm/internal.h: In function 'folio_set_order':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/internal.h:758:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |         ^~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/internal.h:758:33: note: in expansion of macro 'MAX_FOLIO_ORDER'
     758 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   In file included from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/hugetlb.c:8:
   mm/hugetlb.c: In function 'hugetlb_add_hstate':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   include/linux/mm.h:2095:43: note: in expansion of macro 'SZ_16G'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                           ^~~~~~
   mm/hugetlb.c:4753:25: note: in expansion of macro 'MAX_FOLIO_ORDER'
    4753 |         WARN_ON(order > MAX_FOLIO_ORDER);
         |                         ^~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:10762: Error: offset to unaligned destination
   {standard input}:11421: Error: offset to unaligned destination
   {standard input}:15615: Error: offset to unaligned destination
..


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
