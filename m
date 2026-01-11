Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C243ABC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 04:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768104766; cv=none; b=qJ4LkIvE9eDZC5W5LWMdtpQTrhauPHkjDUwxFcaIyPUUdQmSl3m2WZu1TPvsyUFJ/CGLLPd6phM3AjDM22u4JngGYkFmFcCLALxVIEUIRzQr12qfLn40Dkz8Ho1OE3o6M1Bstjt1hV1a67tHDEu3VIgUPR/kwATHER+7NsoWxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768104766; c=relaxed/simple;
	bh=EcTMCoKmLHdOEugPG6iZ749ws/PdpObZq1PCEr19cY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VRdMQHoRayiCf4zwgssVEho1ox4Ul28w/9EsWBzKqwhPsVtwvrrVsuZiBGV1/NS5O0JSNdmiaRx73J06CddPXAkYLC1z6NuS7vTuPFdBStDtbkC2zMnjB3vTnjZiLn0+i+s/SsPyjM8Akkhzs61jh/942iqVB4h1dn3eKeFrgFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkkR8PvT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkkR8PvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768104764; x=1799640764;
  h=date:from:to:cc:subject:message-id;
  bh=EcTMCoKmLHdOEugPG6iZ749ws/PdpObZq1PCEr19cY0=;
  b=VkkR8PvTEuP0OdzFWTmnyve7vxpX08Y5AdHkXLc+0WutFJsRBBY6fHbR
   NlX9OA2k2V2y6ITXmLLvQqTzRmN0Eeaa/s53aV3nyYG1tn+sN4WExg8gm
   O35h8qggK198CoMbtdty0CkKRyiNOHFUUi1yOFKZTdCPT2RUtMxCtG83K
   AzEEf8ZOZUL2hFpl1ZYQ+QtreCG5I8gR96YRXTE18GHtDYZoA9eFKbRUy
   1Szq9QTfFLOVLMRAeDV1En0lRrSHiqlC1DcdzBKGoSErSN5KN2FcxGq2m
   +NxlPW8DXESTUbIjkf24sXjDUdsByIbV5xXLSTd7TwVVsJ/VXcXIp1cYi
   Q==;
X-CSE-ConnectionGUID: gaQ2rDa7R52XmDeA59eCKA==
X-CSE-MsgGUID: R+faEBo8TfWwxyLYJ5wtSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69499606"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69499606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 20:12:43 -0800
X-CSE-ConnectionGUID: juxkN8DWSzuKV/qo7tZk2Q==
X-CSE-MsgGUID: UbTdq/NrRHKtUz4OjupBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="208848696"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2026 20:12:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vemoh-000000009ZU-3GG5;
	Sun, 11 Jan 2026 04:12:39 +0000
Date: Sun, 11 Jan 2026 12:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from
 constant value (ffffffffff000 becomes fffff000)
Message-ID: <202601111214.97kmnuop-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   d1ec28ccbb7a3c86b11e03944d9231500dad60ae
commit: d1ec28ccbb7a3c86b11e03944d9231500dad60ae [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: i386-randconfig-061-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111214.97kmnuop-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111214.97kmnuop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111214.97kmnuop-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_x86_64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
--
   drivers/iommu/generic_pt/fmt/iommu_amdv1.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   drivers/iommu/generic_pt/fmt/iommu_amdv1.c: note: in included file (through drivers/iommu/generic_pt/fmt/iommu_template.h):
   drivers/iommu/generic_pt/fmt/amdv1.h:220:26: sparse: sparse: shift too big (4294967295) for type unsigned long long

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
