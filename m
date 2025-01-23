Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1116EC19
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667828; cv=none; b=ZznCFmt8mrNGcitGOifhbA863RV0ePACz8gsFipNZ7qE+IAqqycYBA3P5mKJrUWYls1rKKpxE248gBiqsKNU/4+b2YPccWkIUVYrPm376cVvx7Y/FPW0LrhStFhxnUC4LA2qB+F2NfcC5VqBzjgahsdhvn4NDIDg/Eh0JQsgU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667828; c=relaxed/simple;
	bh=FxnA7Q4/dmo579chY4ZdOjNATyDSxIekI/spV++j/Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6EIbc0v3Xr8mDHgnrNHA97GH+gRlTw8vZ0SHGhUmsvjzzxGGy5azQEpvv/lLSntCEpiaheR9rDlDfmjPkkbB2NAiPmo04CO0CJJCe4vm7EkwN0qxnfPtOO1TZmrz0uUC8YVGhZvOuD4mFs1GwEgPPeQo3J7qWBr/ym+Kiw20UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geRQfB/h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geRQfB/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737667826; x=1769203826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxnA7Q4/dmo579chY4ZdOjNATyDSxIekI/spV++j/Ak=;
  b=geRQfB/ho06QyJas4Yw01iQzCVC6rC+Sz8GOlTkwqk9Bu38ejQd14O/M
   0Y+yUZWREjgRVnxSQH4KXvUhfxLh1v/6xvGOLlZ0nBi9EVOGjubmjyWUd
   ri8yNjRj1cA6n50894HS6ZnI3NtkAm1rYPbkW+BW/yP+cNSo4DpnpCZO0
   hJR3fFu8f9ezkMsYqI7JjwxauXVTOt3JXJaggSV4w9zK2yxrSz303co5h
   fz3w2Io+0wAkDvFIs2E7TTMtKLezi2+Tg/WElvox2prT5wyhw3utEEHpN
   UERLvZimiGLoZLZZiiDvgsZUGUe0ZZsdY/ji48hXLSQbcvUgqD4FWysNJ
   Q==;
X-CSE-ConnectionGUID: 0qtlXQqcSRCCNnHVj1ctEg==
X-CSE-MsgGUID: eiQd/tiRQ82bE+eUq2Jm2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41025557"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="41025557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 13:30:26 -0800
X-CSE-ConnectionGUID: 9pt5VfppTb6HghNhCSshAg==
X-CSE-MsgGUID: bTlIMfQ3Q2+OVFsIlb7Cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108465517"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2025 13:30:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4mL-000bjP-2M;
	Thu, 23 Jan 2025 21:30:21 +0000
Date: Fri, 24 Jan 2025 05:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 1/31] include/linux/mmzone.h:1870:27: error:
 variable length array declaration not allowed at file scope
Message-ID: <202501240530.5escs4DC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   1429a7f741a85a0115afb4e1cdbc56b8ca525f2e
commit: cb3e63129bf354a30602aa836e07fd2dd591b4dd [1/31] crypto: Harden against integer overflows in DIV_ROUND_UP()
config: arm-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240530.5escs4DC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240530.5escs4DC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240530.5escs4DC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1870:39: warning: variable length array used [-Wvla]
    1870 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/mmzone.h:1864:26: note: expanded from macro 'NR_SECTION_ROOTS'
    1864 | #define NR_SECTION_ROOTS        DIV_ROUND_UP(NR_MEM_SECTIONS, SECTIONS_PER_ROOT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:50:30: note: expanded from macro 'DIV_ROUND_UP'
      50 |         (__builtin_constant_p(d) && is_power_of_2(d)                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 |                 ? DIV_ROUND_UP_POW2(n, d)                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                 : __KERNEL_DIV_ROUND_UP(n, d))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1870:27: error: variable length array declaration not allowed at file scope
    1870 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^           ~~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:


vim +1870 include/linux/mmzone.h

802f192e4a600f Bob Picco          2005-09-03  1866  
3e347261a80b57 Bob Picco          2005-09-03  1867  #ifdef CONFIG_SPARSEMEM_EXTREME
83e3c48729d9eb Kirill A. Shutemov 2017-09-29  1868  extern struct mem_section **mem_section;
802f192e4a600f Bob Picco          2005-09-03  1869  #else
3e347261a80b57 Bob Picco          2005-09-03 @1870  extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
3e347261a80b57 Bob Picco          2005-09-03  1871  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1872  

:::::: The code at line 1870 was first introduced by commit
:::::: 3e347261a80b57df792ab9464b5f0ed59add53a8 [PATCH] sparsemem extreme implementation

:::::: TO: Bob Picco <bob.picco@hp.com>
:::::: CC: Linus Torvalds <torvalds@evo.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
