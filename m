Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B13E51FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834393; cv=none; b=E8pscFsyHObu3PtUOCfBEzoESk911vSJXd6/ODs9IDQIcihIEDlh2fXXEVNyU+IIPWu3lqsnxH73uAlwBpvdivwoYzaT8n37N8ByXaXTJ/2VAVYvy3WSKyuYvNecJauUCrJhCYcOB6/8aIWapSdoRGLdkTtf8mjW65m0Xnv6W2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834393; c=relaxed/simple;
	bh=g5CY6UBg//2eFtsoNCQodyTOuaU+01cSm6kRj2Orj4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C+7QQh5/zVaLBX+9Ay7uiqGMOSl1Se/7yA8128xeUKi+JXSA5fjhcub+HpJXv8BUgU/ULz2CxJ30lUYW2b83ewGuH7miNbyyjLFH7boGvATbbWHsKcwRmCuayU5GQ7S+eVKtnmY5h3mRqKAEfwPkH7igg7OhaunZ08Vu4RCFwDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fz2CrzNa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fz2CrzNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775834392; x=1807370392;
  h=date:from:to:cc:subject:message-id;
  bh=g5CY6UBg//2eFtsoNCQodyTOuaU+01cSm6kRj2Orj4o=;
  b=Fz2CrzNaO6TV6aBwMvD7FhWQwhBUyPHtjTHyt4onNvm/895UqY47WOBA
   EmdXoDRgMTDvbnINeuqQVUShChL5KCYeZW5hjMwiYPLjl3W85FmTfLA+b
   SHXISRxO4LYlCzC6vv2ThY3KDt3rKeJw2p50cOtqAWDh/ShQ1zYRhdXVM
   igCyCGctTxLGBHL17yWk+D2b+ateVokfEiwbLUJm578989KV/MZxAeHHQ
   u2BaeNNb7pTmluBvj/R2Gre7nah618nKIl7bkzsqVzS/7rCf7ITU4TLtJ
   N73wksl2gOpwgFn06Fj4DREZpUTbWRUgQFhmM0IIrZoopsdrZJTDPS7mm
   g==;
X-CSE-ConnectionGUID: vr/6AH10To6PqfIEt8uSgw==
X-CSE-MsgGUID: TthB2djFQEuYom6o5XhqHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76928097"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76928097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 08:19:51 -0700
X-CSE-ConnectionGUID: v0v3RNN9T/2F+L0XhHaywA==
X-CSE-MsgGUID: t65hF926TmCMRJiU6BqdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="222623609"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 08:19:50 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBDe7-000000003sE-2H8A;
	Fri, 10 Apr 2026 15:19:47 +0000
Date: Fri, 10 Apr 2026 23:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasant Hegde <vasant.hegde@amd.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202604102319.MLQpUK0I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: aef5de756ea871ab44e3a1a87be6c944e6587c51 iommupt: Add the x86 64 bit page table format
date:   5 months ago
config: i386-randconfig-062-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102319.MLQpUK0I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102319.MLQpUK0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aef5de756ea8 ("iommupt: Add the x86 64 bit page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102319.MLQpUK0I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_x86_64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
6606c8c7e81886 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
