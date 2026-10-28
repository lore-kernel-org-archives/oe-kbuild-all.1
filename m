Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181947;
	b=1yEIb86hePo4CdyIWunLHwTZG09Dw9CY5GXNIcyQofyJFKhghiTnpC5XBPt3ggVG93Xc
	 Z4FKghUGIbPIedBQ5Lyqm4qmoTGihU7BfSOmh2QmtUxC9ItK/TunfcLaRp88plE5xelC7
	 H2KL9ZDnr5jRgp/dHgdDg9BoRnnProjfOvRH2/M9uZTKFo4oiGZqCnBkWcGpTP1RDydoe
	 w2z39ZmABxCXosXKOz7fCsmnpBCpEb9Q+rnSe3dlJNuCtHs172j97pL3jo8glsnFa7WV7
	 iYQueVwElXrwcJsL35I7T7qXV8JT7/0PS4ghYVKgmNIirSVHhhdxGuVec3kUcYXXfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181947;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Z1ir+i7+moQy4Z6pH8xH0TqAJ/77M/1+LjnH9x2bing=;
	b=gruh45/go/9utMFz9lb8gMP21CfTw/I/ivsVd2gKDFTicZijC+HNAhtw6iOfLpracvSz
	 uWx/4kKBa9Ordzv4eqA/EQaRqOOx7DyHYfRvlQpSDStZ/JFUlAUKNH7DTrxz4aupxBW3C
	 turWdb+LD0MRm6HlpaqRbBBua2uyGfU1zBwQzOWR9W4cOA3GSFwgeXOgPl3wFOku1VNN3
	 If5EqID4UD9jMBWxrVdhXfRBgc3hxTg2WAquRBNrG1KgME1WaZbMZeKLWj92ZzMheEGsd
	 B+V5DqcvTH41P57oKJkAtZzu4D7i7rhn/r9N++2pg46SawNy0RZ8dtuCqFQbcsoH9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8ZYVjVQ;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BFB606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 10:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8ZYVjVQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793181945; x=1824717945;
  h=date:from:to:cc:subject:message-id;
  bh=l6uIIYFHgkq/At/W+d8drh67ssTrsTeHoOr1+5apqDY=;
  b=O8ZYVjVQu72CE/QMSFaqp8XyyZr7OYrSVRjrNWrSjEyaT3UeSeByyl8r
   KNNSdNH+t/uy+E4e3yfXEWlG8/bnqntgo9WxEjpZ2J7pYIM4ECE6mjrfG
   NyKZ82ocFvyFBRr/wVtBHtbp3SaKhFn2FIsWRZ2s0W2oW0AW8CZ16j9Vo
   hUQ+pTkljvNrqK3G+qcDsJCPpmlUlmPRzi65BVfD+Fxg2zdqiLjMcku5P
   TK37MlaywfS6H5QWlHUXwULrQQsdz9A3UUvt3KUnkWw0ExotBgbW6K0A3
   yDJmOtFsBWCFb9e6AMiVP81qYlti/xHEISZAreBIRWdKwc9SKwM3utBcS
   g==;
X-CSE-ConnectionGUID: qQvNyp7tTyma/ajiqItJnA==
X-CSE-MsgGUID: EDmgNZOlT26lsBj24/+3AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1790814"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1790814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:05:44 -0700
X-CSE-ConnectionGUID: 9zrllDT7RFuetDBEpPc/ZQ==
X-CSE-MsgGUID: /yRZ59EPSayrocbfYvc5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4766952"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2026 03:05:43 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM0XM-000000004pr-1uYX;
	Wed, 28 Oct 2026 10:05:40 +0000
Date: Wed, 28 Oct 2026 11:05:23 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 4/6] kernel/bpf/arena.c:319:17:
 error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'?
Message-ID: <202610281110.hVOgGluS-lkp@intel.com>
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
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610281110.hVOgGluS-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281110.hVOgGluS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281110.hVOgGluS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_pmd_is_scratch':
>> kernel/bpf/arena.c:307:36: warning: comparison between pointer and integer
     307 |         return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
         |                                    ^~
   kernel/bpf/arena.c: In function 'arena_alloc_scratch_pt':
>> kernel/bpf/arena.c:319:17: error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'? [-Wimplicit-function-declaration]
     319 |                 set_pte(&arena->scratch_pt[i], pteval);
         |                 ^~~~~~~
         |                 set_ptes


vim +319 kernel/bpf/arena.c

   294	
   295	/*
   296	 * A PMD slot of the band is in one of three states: none, holding the arena's
   297	 * scratch table, or holding a real table. The scratch table maps every page of
   298	 * its slot to the scratch page. Kernel-fault recovery installs it into a none
   299	 * slot, which keeps that path allocation-free: it runs from any context,
   300	 * including NMI, under memory exhaustion and with the arena lock held, and must
   301	 * never oops. The price is that one stray kernel access to an empty slot now
   302	 * backs 2 MB with scratch rather than one page; nothing real can live there,
   303	 * because a real page is only ever installed into a real table.
   304	 */
   305	static bool arena_pmd_is_scratch(struct bpf_arena *arena, pmd_t pmd)
   306	{
 > 307		return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
   308	}
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
