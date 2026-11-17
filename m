Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898372;
	b=Q2/Ur5ekZuxR2RKkTQNngKVnnQzQwWO8Ypw8rToJxTYv8cSU2iM0t0klmd85+a9grT5f
	 /OU7PWeCoaMzvLZeUx9H+0ZTOehNU1DdNog0X7akofHLzmz+EC90v/RO9iSfi54ul7cpw
	 M03gycWm8gOUW29vzTZYKb6S0p6n3ZL2QCHX1uAhMXK87rFWrhmZAu5dfLrBpslE8jITQ
	 IjlxqZx2gRUpvj2pyKPKQ+eqEm2dT12DrJN5avESMrHN0dUtmmq2Ed3Btlr1L4I01ECMJ
	 jujjp+K77AhJDZleo9QQGuSf2tq7+Id+4QlL42YHjR0MHL4A+om4NKnuKJaWksGePPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=b9RtOVhJ0aYz264UQ4U9o8kmE2pwerMdgMvbjJ/dVzk=;
	b=S9vQGFSmilB0hr393CA76HXKGFTAWbSPNt1XjHAZxQjaXI8Rm6kSLJvRgj715W1KhNBX
	 RE1HxVL+s3JGUGJt76BE9iwYQ3tqyWE3tdAt0S/i/FfqqXtwtq64mGxYanpW8qpNbpC6J
	 TAw86paCTitReckHCrp/78QQ4XCnKlfhpihF4o/RPPWQ9oza6h0sdw26SAvRRMcGdzFBr
	 E4Rgi2mdV+u8agksM0zTxP0sFrunWADYWIaQ1dbbtBgnTFY4eJqqr1f5YN6+zREWMnM1B
	 Dm3nkBu9b5BJeiyhkmCckXRIW3xoihBKOSgr95vJkVAjOTb6YQX0bQbcjCT0Ej3qHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzJMIXMC;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31611606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 06:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31611606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzJMIXMC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794898372; x=1826434372;
  h=date:from:to:cc:subject:message-id;
  bh=2hvFp4fJTvPAv/rPiFHVhChL6L2ahatOyCqNZXfgsE8=;
  b=lzJMIXMCSOWsoeHOVifO91yTLJehVpByo/lAQ6SaHi9mrMVLPAtiNm1G
   1g6x16xIJU5P7qDxV1TLnxQTq+weSXBRkF9EQaCifprogKKs8PoKHUTgD
   ke699qbrIHCiGpDKItA7RUZN9n9vOEoeCS0QuKv8KruVSV31Eb/HX1BAv
   sfpCZJT7X9JJC+rJBfuggl+hnPWXyX/T5V23jkq3PX9kU95LrwqBSapLw
   kccxnIXITkG9EJDJFTiIPMdCQr1rfVlYx+ile69+XlzWOsrARf7FKOfeS
   RBa7BWQCltuzZheKWekIvo1qHlTFXbK/ALib96kwlWgWL9/itUNtEeBHu
   Q==;
X-CSE-ConnectionGUID: Hfra/mIbTeufQENYyUcGbw==
X-CSE-MsgGUID: nioENVdpS2699PEDJHER/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3665728"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3665728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:49:28 -0800
X-CSE-ConnectionGUID: gSXAM9kQRvSMDQeRw+z70w==
X-CSE-MsgGUID: iDOoPaN+Tb+ImHTtRgFN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9925817"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 22:49:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTD0N-0000000030A-0dP7;
	Tue, 17 Nov 2026 06:49:23 +0000
Date: Tue, 17 Nov 2026 07:49:13 +0100
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 11/29]
 include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from
 constant value (fffffffffffe0 becomes ffffffe0)
Message-ID: <202611170712.5q1fLePG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   09e964858d505e5bef1d8a8ff5bbdd3b86a626f9
commit: 045aed2844f081e887e791538d61044b6b0e590b [11/29] iommupt/armv8: Implement the iommu specific components
config: i386-randconfig-r2306-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170712.5q1fLePG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170712.5q1fLePG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170712.5q1fLePG-lkp@intel.com/

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
