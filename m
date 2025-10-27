Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002ED31A572
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588014; cv=none; b=kFRbcb/yaFltCpz2iWw4gq/pNU0wDs2iRtU/JtlbvcBkVvNaVbBU9AFCqBJBVbhxYXQ09xe3nKDfbAZ4AJXK9O7dEZ7aEIK/XbluYBGy9fEaQWUVOFPN6bg7JhZ+2AYupLcHUEAimmCJuiqXaXlwEKheS4pEpi6sZJX0+zEIXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588014; c=relaxed/simple;
	bh=Z/olMphaZrljDawVUmgBh8IDNKm868terAUwVBdcZ84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzsTUYT3iaTuX0FOkyC+dXnKAd40g1qJmlOoX5QL1pKsXA3Lz2snVoGIj0Mg406r1RKU3BvbjHbJ43uvcin1Z2PKu1blJqiWotlxwomB0zuoPWZDpjPAAywN03D9jTfI8I8Ujut+5ctu1FadBWVlArsGZe7coaIPDaUYPsl+ADk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvzPqPoR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvzPqPoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761588013; x=1793124013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/olMphaZrljDawVUmgBh8IDNKm868terAUwVBdcZ84=;
  b=FvzPqPoR7GWX+2y1FCyTaEopP1j/AVge+iLZ6LnwN/DltJZN3Ers98XD
   VcKcIebRygk138S6tfrzPawMiL8/1QVntqFeVNGzJNIrh5ymSskr9nGY9
   VBdPSIarpGbR6jldIAM3dhqVMfsvlBrd9YIK/vYOImmvT2YOfC7kUFjXh
   uh8HLttrqbPUM3m4CWk7zhY3EpBNlSYAToJZg78laBWzaUWvCisUIaXTW
   RD9OvUC9mjy5heAehI0jrIi4SYR/KoS/oFDtP/ioalL+MampWdw0ZU2wP
   c4KgeL6MLe8zdLZZxnnBjC/ARCwqlpMEFbVlsgxQwuO9JIavfexbjzZEC
   g==;
X-CSE-ConnectionGUID: +APEpWE2QGqcaiqaqB0Rqg==
X-CSE-MsgGUID: uH1HUtdhRE23aIcw2ABpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63566310"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63566310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 11:00:12 -0700
X-CSE-ConnectionGUID: l2fb+iAsTICMeRejOUdiQw==
X-CSE-MsgGUID: MP++c+aVToSAJ0hxbhilwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184813041"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 11:00:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDRTJ-000H45-2B;
	Mon, 27 Oct 2025 17:58:15 +0000
Date: Tue, 28 Oct 2025 01:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 38/59]
 drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:220: undefined reference to
 `__udivdi3'
Message-ID: <202510280106.UcLDCKra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   d4768a400064639375c4c316056e902153b69c94
commit: 13b23d009d112bee57f9bad029b05886e4640e76 [38/59] iommupt: Add the 32 bit ARMv7s page table format
config: microblaze-randconfig-r131-20251026 (https://download.01.org/0day-ci/archive/20251028/202510280106.UcLDCKra-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280106.UcLDCKra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280106.UcLDCKra-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv7s.o: in function `test_map_table_to_oa':
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:220: undefined reference to `__udivdi3'


vim +220 drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h

ab019a8791e23e Jason Gunthorpe 2024-06-28  186  
ab019a8791e23e Jason Gunthorpe 2024-06-28  187  /*
ab019a8791e23e Jason Gunthorpe 2024-06-28  188   * Test to convert a table pointer into an OA by mapping something small,
ab019a8791e23e Jason Gunthorpe 2024-06-28  189   * unmapping it so as to leave behind a table pointer, then mapping something
ab019a8791e23e Jason Gunthorpe 2024-06-28  190   * larger that will convert the table into an OA.
ab019a8791e23e Jason Gunthorpe 2024-06-28  191   */
ab019a8791e23e Jason Gunthorpe 2024-06-28  192  static void test_map_table_to_oa(struct kunit *test)
ab019a8791e23e Jason Gunthorpe 2024-06-28  193  {
ab019a8791e23e Jason Gunthorpe 2024-06-28  194  	struct kunit_iommu_priv *priv = test->priv;
ab019a8791e23e Jason Gunthorpe 2024-06-28  195  	pt_vaddr_t limited_pgbitmap =
ab019a8791e23e Jason Gunthorpe 2024-06-28  196  		priv->info.pgsize_bitmap % (IS_32BIT ? SZ_2G : SZ_16G);
ab019a8791e23e Jason Gunthorpe 2024-06-28  197  	struct pt_range range = pt_top_range(priv->common);
ab019a8791e23e Jason Gunthorpe 2024-06-28  198  	unsigned int pgsz_lg2;
ab019a8791e23e Jason Gunthorpe 2024-06-28  199  	pt_vaddr_t max_pgsize;
ab019a8791e23e Jason Gunthorpe 2024-06-28  200  	pt_vaddr_t cur_va;
ab019a8791e23e Jason Gunthorpe 2024-06-28  201  
ab019a8791e23e Jason Gunthorpe 2024-06-28  202  	max_pgsize = 1ULL << (vafls(limited_pgbitmap) - 1);
ab019a8791e23e Jason Gunthorpe 2024-06-28  203  	KUNIT_ASSERT_TRUE(test, priv->info.pgsize_bitmap & max_pgsize);
ab019a8791e23e Jason Gunthorpe 2024-06-28  204  
ab019a8791e23e Jason Gunthorpe 2024-06-28  205  	for (pgsz_lg2 = 0; pgsz_lg2 != PT_VADDR_MAX_LG2; pgsz_lg2++) {
ab019a8791e23e Jason Gunthorpe 2024-06-28  206  		pt_oaddr_t paddr = log2_set_mod(priv->test_oa, 0, pgsz_lg2);
ab019a8791e23e Jason Gunthorpe 2024-06-28  207  		u64 len = log2_to_int(pgsz_lg2);
ab019a8791e23e Jason Gunthorpe 2024-06-28  208  		pt_vaddr_t offset;
ab019a8791e23e Jason Gunthorpe 2024-06-28  209  
ab019a8791e23e Jason Gunthorpe 2024-06-28  210  		if (!(priv->info.pgsize_bitmap & len))
ab019a8791e23e Jason Gunthorpe 2024-06-28  211  			continue;
ab019a8791e23e Jason Gunthorpe 2024-06-28  212  		if (len > max_pgsize)
ab019a8791e23e Jason Gunthorpe 2024-06-28  213  			break;
ab019a8791e23e Jason Gunthorpe 2024-06-28  214  
ab019a8791e23e Jason Gunthorpe 2024-06-28  215  		cur_va = ALIGN(range.va + priv->smallest_pgsz * 256,
ab019a8791e23e Jason Gunthorpe 2024-06-28  216  			       max_pgsize);
ab019a8791e23e Jason Gunthorpe 2024-06-28  217  		for (offset = 0; offset != max_pgsize; offset += len)
ab019a8791e23e Jason Gunthorpe 2024-06-28  218  			do_map(test, cur_va + offset, paddr + offset, len);
ab019a8791e23e Jason Gunthorpe 2024-06-28  219  		check_iova(test, cur_va, paddr, max_pgsize);
ab019a8791e23e Jason Gunthorpe 2024-06-28 @220  		KUNIT_ASSERT_EQ(test, count_valids_single(test, len),
ab019a8791e23e Jason Gunthorpe 2024-06-28  221  				max_pgsize / len);
ab019a8791e23e Jason Gunthorpe 2024-06-28  222  
ab019a8791e23e Jason Gunthorpe 2024-06-28  223  		if (len == max_pgsize) {
ab019a8791e23e Jason Gunthorpe 2024-06-28  224  			do_unmap(test, cur_va, max_pgsize);
ab019a8791e23e Jason Gunthorpe 2024-06-28  225  		} else {
ab019a8791e23e Jason Gunthorpe 2024-06-28  226  			do_unmap(test, cur_va, max_pgsize / 2);
ab019a8791e23e Jason Gunthorpe 2024-06-28  227  			for (offset = max_pgsize / 2; offset != max_pgsize;
ab019a8791e23e Jason Gunthorpe 2024-06-28  228  			     offset += len)
ab019a8791e23e Jason Gunthorpe 2024-06-28  229  				do_unmap(test, cur_va + offset, len);
ab019a8791e23e Jason Gunthorpe 2024-06-28  230  		}
ab019a8791e23e Jason Gunthorpe 2024-06-28  231  
ab019a8791e23e Jason Gunthorpe 2024-06-28  232  		KUNIT_ASSERT_EQ(test, count_valids(test), 0);
ab019a8791e23e Jason Gunthorpe 2024-06-28  233  	}
ab019a8791e23e Jason Gunthorpe 2024-06-28  234  }
ab019a8791e23e Jason Gunthorpe 2024-06-28  235  

:::::: The code at line 220 was first introduced by commit
:::::: ab019a8791e23e51aa8c6a4d407661235e24bc3a iommupt: Add a kunit test for the IOMMU implementation

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
