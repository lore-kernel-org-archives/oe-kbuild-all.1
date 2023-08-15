Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676271C13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 04:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692073185; x=1723609185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcClbbTwYJVtvejoTgPsKFn2tc9DjAMDmFUAqyBCDN0=;
  b=MSnQt9q27RaHdVLuBVO0rx7QHG2Shz9jFBq+l8yd5E2nBW7x7Rqd+0Fu
   W8VutMRrYs5RCW0U0gJ808INmbhxq960eyylNZfeYQUxHYZ7o8mL7fahj
   ryw1qS9qpQXjS9iW3M53gllBX7AJC6jDl6iXNr1SDMY/voYIgQAz4ZWBC
   8jOd3yfNGFhBc7BhfQJMHlPXzF7zJLG3qzkW7+ntnwbLsHEB4fx0oyKQk
   4D1mH+e08oNrIAUw//LZ2TWwgeSvOLLKR2hhZkm3b8VG5ZRbL0SHSni5c
   yZUWJwutaDsSlRio1yenRJXJ6cVCBYJgWZEtNSOo74zpGG3FPKIzRYXm/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="375928391"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="375928391"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 21:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710584307"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="710584307"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 21:19:43 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVlWw-0000e7-2H;
	Tue, 15 Aug 2023 04:19:42 +0000
Date: Tue, 15 Aug 2023 12:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 05/20] ARC: boot log: eliminate struct cpuinfo_arc #1: mm
Message-ID: <202308151213.qKZPMiyz-lkp@intel.com>
References: <20230815004813.555115-6-vgupta@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815004813.555115-6-vgupta@kernel.org>

Hi Vineet,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vgupta-arc/for-curr]
[also build test WARNING on linus/master v6.5-rc6]
[cannot apply to vgupta-arc/for-next next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineet-Gupta/ARC-uaccess-remove-arc-specific-out-of-line-handles-for-Os/20230815-085308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
patch link:    https://lore.kernel.org/r/20230815004813.555115-6-vgupta%40kernel.org
patch subject: [PATCH 05/20] ARC: boot log: eliminate struct cpuinfo_arc #1: mm
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230815/202308151213.qKZPMiyz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151213.qKZPMiyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151213.qKZPMiyz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arc/mm/tlb.c: In function 'arc_mmu_mumbojumbo':
>> arch/arc/mm/tlb.c:568:43: warning: variable 'sasid' set but not used [-Wunused-but-set-variable]
     568 |         unsigned int bcr, u_dtlb, u_itlb, sasid;
         |                                           ^~~~~


vim +/sasid +568 arch/arc/mm/tlb.c

   560	
   561	/* Read the Cache Build Configuration Registers, Decode them and save into
   562	 * the cpuinfo structure for later use.
   563	 * No Validation is done here, simply read/convert the BCRs
   564	 */
   565	char *arc_mmu_mumbojumbo(int c, char *buf, int len)
   566	{
   567		struct cpuinfo_arc_mmu *mmu = &mmuinfo;
 > 568		unsigned int bcr, u_dtlb, u_itlb, sasid;
   569		struct bcr_mmu_3 *mmu3;
   570		struct bcr_mmu_4 *mmu4;
   571		char super_pg[64] = "";
   572		int n = 0;
   573	
   574		bcr = read_aux_reg(ARC_REG_MMU_BCR);
   575		mmu->ver = (bcr >> 24);
   576	
   577		if (is_isa_arcompact() && mmu->ver == 3) {
   578			mmu3 = (struct bcr_mmu_3 *)&bcr;
   579			mmu->pg_sz_k = 1 << (mmu3->pg_sz - 1);
   580			mmu->sets = 1 << mmu3->sets;
   581			mmu->ways = 1 << mmu3->ways;
   582			u_dtlb = mmu3->u_dtlb;
   583			u_itlb = mmu3->u_itlb;
   584			sasid = mmu3->sasid;
   585		} else {
   586			mmu4 = (struct bcr_mmu_4 *)&bcr;
   587			mmu->pg_sz_k = 1 << (mmu4->sz0 - 1);
   588			mmu->s_pg_sz_m = 1 << (mmu4->sz1 - 11);
   589			mmu->sets = 64 << mmu4->n_entry;
   590			mmu->ways = mmu4->n_ways * 2;
   591			u_dtlb = mmu4->u_dtlb * 4;
   592			u_itlb = mmu4->u_itlb * 4;
   593			sasid = mmu4->sasid;
   594			mmu->pae = mmu4->pae;
   595		}
   596	
   597		if (mmu->s_pg_sz_m)
   598			scnprintf(super_pg, 64, "/%dM%s",
   599				  mmu->s_pg_sz_m,
   600				  IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) ? " (THP enabled)":"");
   601	
   602		n += scnprintf(buf + n, len - n,
   603			      "MMU [v%x]\t: %dk%s, swalk %d lvl, JTLB %dx%d, uDTLB %d, uITLB %d%s%s\n",
   604			       mmu->ver, mmu->pg_sz_k, super_pg, CONFIG_PGTABLE_LEVELS,
   605			       mmu->sets, mmu->ways,
   606			       u_dtlb, u_itlb,
   607			       IS_AVAIL2(mmu->pae, ", PAE40 ", CONFIG_ARC_HAS_PAE40));
   608	
   609		return buf;
   610	}
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
