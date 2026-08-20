Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DCE419FDA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224420; cv=none; b=fnsUDpqu9ceZQvVReY89xtXaZ0hvkDtM51eSitr0v0618FHduK1NmLQK2wuBu4zp20qF8s0+92Ll/s2RqjegMbHsX0QbHwJssob4LHQK81KJc7vj+qaGFhpFF6SzjUV/qwtyNRq0ys6wOW6RO4f21hzoBFTTr1HdmrfBi0FZDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224420; c=relaxed/simple;
	bh=3IWyi1Ma+ppFwD0Z3DXqR992ZEKekLKkyP7zs32sb2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZX8ArZcGg4m2YHXK1tO6V1TJcW8jjP4J4D2QdRVUTDY46eSWOoP7HanNpiKzgS06l1flWkUC5oaJ0Nqub/yeq8ENz2UWEZYX5OYBK8/nhgc62wFPLU5dPR+eRBFzd+qeX/gMdwTWYApUIlMG4GR300Te0roiFWtJtsxl10uXVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP0CViRC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP0CViRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787224419; x=1818760419;
  h=date:from:to:cc:subject:message-id;
  bh=3IWyi1Ma+ppFwD0Z3DXqR992ZEKekLKkyP7zs32sb2Q=;
  b=WP0CViRC162jHEOBIJw4kYlp2eUCZPHbICea0TgpSu2WNMk2Vo1+64/s
   g2iW7C3zHaw9CUl3yOl3pzxqOISTSy8agpFxnOR/gAPoHz5/ZqYd4iwE7
   CjOEpn1H7Pux1VtjU1T62Ze7+fLDs9n3ByelWBkyZFfPzS3LsgVzX+pGz
   fcOEzmxN6+n4OaHcNjEdRPLmZuBkvX6+J34EFRIB5iVFIJcuTONmwxrwI
   GJJOW1N8Et56f734lbvfRF5opKdwSRPZQyL8zeLYo9GPRer2nk/gDfmNo
   uiVnZmdapp+JiLC52qO+q/G/bgORWn+qQLAlL5TUe5wOpDiOKDklh2sE2
   w==;
X-CSE-ConnectionGUID: qjnhag8zT8GltcloaHmgYQ==
X-CSE-MsgGUID: qVqo0VgKRQymFK1vCAqQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87877685"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87877685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:13:38 -0700
X-CSE-ConnectionGUID: yS9glbhQQziB3eizBcql0w==
X-CSE-MsgGUID: pQaEHOVxTm+OPWs20Ck3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="265493359"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2026 04:13:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx0iE-00000000imb-0ks2;
	Thu, 20 Aug 2026 11:13:34 +0000
Date: Thu, 20 Aug 2026 19:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 19/37]
 include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from
 constant value (fffffffffffe0 becomes ffffffe0)
Message-ID: <202608201925.v1ShtOtY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   ec570e1cdbc0f03b5f4f9940802c7579d913e1ce
commit: c5d3121e6ad2a22ea8059b1ef203c86fd1649625 [19/37] iommupt/armv8: Implement the iommu specific components
config: um-randconfig-r134-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201925.v1ShtOtY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201925.v1ShtOtY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201925.v1ShtOtY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_armv8.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:284:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
>> include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:284:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)

vim +279 include/linux/bitops.h

c320592f3f2a1e6 Wolfram Sang       2025-01-07  267  
952043ac12a117d Steven Whitehouse  2009-04-23  268  /**
952043ac12a117d Steven Whitehouse  2009-04-23  269   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  270   * @word: The 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  271   *
4945cca232ce8bc Geert Uytterhoeven 2021-02-25  272   * On 64 bit arches this is a synonym for __ffs
952043ac12a117d Steven Whitehouse  2009-04-23  273   * The result is not defined if no bits are set, so check that @word
952043ac12a117d Steven Whitehouse  2009-04-23  274   * is non-zero before calling this.
952043ac12a117d Steven Whitehouse  2009-04-23  275   */
6606c8c7e818865 Kees Cook          2025-08-04  276  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117d Steven Whitehouse  2009-04-23  277  {
952043ac12a117d Steven Whitehouse  2009-04-23  278  #if BITS_PER_LONG == 32
952043ac12a117d Steven Whitehouse  2009-04-23 @279  	if (((u32)word) == 0UL)
952043ac12a117d Steven Whitehouse  2009-04-23  280  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117d Steven Whitehouse  2009-04-23  281  #elif BITS_PER_LONG != 64
952043ac12a117d Steven Whitehouse  2009-04-23  282  #error BITS_PER_LONG not 32 or 64
952043ac12a117d Steven Whitehouse  2009-04-23  283  #endif
952043ac12a117d Steven Whitehouse  2009-04-23  284  	return __ffs((unsigned long)word);
952043ac12a117d Steven Whitehouse  2009-04-23  285  }
952043ac12a117d Steven Whitehouse  2009-04-23  286  

:::::: The code at line 279 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
