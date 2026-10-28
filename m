Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174020;
	b=XJ7c6POd6Pv8r0sgUFT4Al+sp/AnWIKMJSnJzS5gcGzLGq21Yj+Bv0yLyKx9yEWMmesn
	 5e8zaHWzrwHVZSlZ/20DjxIdUPaHZeSEvpZvPCpXoNDIdtmkSB+qI1t6myWH2PuWFeUt4
	 dFYNVO1yqkGflTNoANyjFKHhy8SO2BtLdJS7dswTkQooC7wJPXhCEvg6dEH01+Bt1SPEt
	 6j0uEq4PO3eu770RdtBZ+nFP+bQPZTDf/d9vRgiAQA7/oAQMRRJLi2yBUYvUbTBs/dMFx
	 iaBDlRy9W9sFWOxDFVkfUFGorCoTCh5RwZjJ2p+Q2Wbh+adSVK1xhuWtEyZnvds4iTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=e1ZMaac7vELdskiR5NZLEjg363j1hIwhJG2Atf6XaiA=;
	b=lnwk7yB04PrMyppVNjBbTT9SHI3ZJohBhhZQPqdAUMmou6twFlzfPNsdBtZORREQD5Ld
	 +yeFFkWRctw+OvOFu3kdf2Dyofx8Yg9KwL1tVpHcOWppABU2V5wLVsNp8B3UnmcIfZRwF
	 I4KhW6YJmVQzqXVicpCs0JCDVcWfyl02XHjpulaEYu1HFO65uZfYOuTF50exT68Qiz+/O
	 /nTw0S3p8Yo173m2uUw5vVU5VxfQHbHqwSFMeZZWDp359LrKuAek++SnYbsk6Ke5rIzBS
	 U0oEldXzAu8dA9TXcX/fYAr+GXvM0uwg44vxe8QinD8A8/P4NTFOA5a2bAuddJqyFzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAI+O83D;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA42606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 07:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAI+O83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793174018; x=1824710018;
  h=date:from:to:cc:subject:message-id;
  bh=Wzfr1zfNaQn9XL67chmi9ydPP7J0qRub9rhM6ODDWHI=;
  b=nAI+O83D8nolpgZCdTvOHKI9dQIEjadQFKPArR9QFoAFu3NH3SBlHoQ5
   gP45fs1t4QH9jQJCrCYay+GCd5F/drK2uoHn7QtOmrbw1lBt1dpL2CpCe
   8l46pkvlJhqBZ7In9qyJKBbs4eLiTLkM7gz+nciRvxFLTGCyuxQtdOsXu
   rZmp3bxS9BBWuwJRrjfL9qLmwpUvnt3lJZy+6U3ByIiZhBvm2C45Sq7QA
   h4ZajmRYSN4TGsTxvPW2u+0iEoZYThvQFNyPGYy8rDrXPUgxoAUaEd7fg
   VMy6yW67dCQBqf0qBMNtA2sZx/sDIFZ0N0zR970k6xQyWIrcDu7fQeXI8
   g==;
X-CSE-ConnectionGUID: DVrib8IURCSY/xBp7n42TQ==
X-CSE-MsgGUID: ory8ISw2T0mW2oa0bLmFeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1903481"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1903481"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:53:38 -0700
X-CSE-ConnectionGUID: aCiD/0RPScO5k6Y7u/llQA==
X-CSE-MsgGUID: uTDOlMjBRp6SCl7PxNZMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4813950"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 00:53:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLyTW-000000004nr-1KTw;
	Wed, 28 Oct 2026 07:53:34 +0000
Date: Wed, 28 Oct 2026 08:52:56 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 4/6] kernel/bpf/arena.c:319:3:
 error: call to undeclared function 'set_pte'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610280826.GwNDVYsO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 71ddc46be0a854bf80bacf6c588aefd04049b95e [4/6] bpf: arena: Add the scratch PTE table and PMD-level fault recovery
config: sparc64-randconfig-2000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280826.GwNDVYsO-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280826.GwNDVYsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280826.GwNDVYsO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/arena.c:319:3: error: call to undeclared function 'set_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |                 set_pte(&arena->scratch_pt[i], pteval);
         |                 ^
   kernel/bpf/arena.c:319:3: note: did you mean 'set_ptes'?
   arch/sparc/include/asm/pgtable_64.h:921:20: note: 'set_ptes' declared here
     921 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                    ^
   1 error generated.


vim +/set_pte +319 kernel/bpf/arena.c

   309	
   310	static int arena_alloc_scratch_pt(struct bpf_arena *arena)
   311	{
   312		pte_t pteval = mk_pte(arena->scratch_page, PAGE_KERNEL);
   313		unsigned long i;
   314	
   315		arena->scratch_pt = arena_alloc_pt(arena, true);
   316		if (!arena->scratch_pt)
   317			return -ENOMEM;
   318		for (i = 0; i < PTRS_PER_PTE; i++)
 > 319			set_pte(&arena->scratch_pt[i], pteval);
   320		/*
   321		 * The table is published much later, by the atomic PMD install in the
   322		 * fault handler, which orders these stores before the entry becomes
   323		 * visible. Make that explicit here, where the table is filled.
   324		 */
   325		smp_wmb();
   326		return 0;
   327	}
   328	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
