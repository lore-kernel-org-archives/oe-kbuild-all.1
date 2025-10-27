Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA31A9F97
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 00:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761526795; cv=none; b=TGompljii9DGONV4eOSrAtXqnjj0EsHN3Kimbd9u9Q6GWorRoErmrJEf2X7B3Kol4wBd+7eUbdX7dkWJzLD8kArFWNT17+bMErB8JnWPyNuvKl4wFiCE90MuqEmSdaKXiDYlvMuHlDITyC3H4BhjM7H6vpDOY8KqQFZA7f17kG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761526795; c=relaxed/simple;
	bh=UXNMA64/cPH7/YXW7odYbefMwXMgahaR8/0zFtU/LP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+M1X6XfFhSegYQWfK1IehgAfNYed632jaQEnNBlW6dH4B/65XBAJVAPzS9jQggeE9lJSCd5yWVhcIg5YI7M6fcyOMDcuM59ppWxYmNGA0IJKMal91vEH9h8TRBPyGvSQiKiB+j5FbjFVmphAqTRTYlux69exWQm0KE+HLJEu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDlLjKxC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDlLjKxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761526793; x=1793062793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UXNMA64/cPH7/YXW7odYbefMwXMgahaR8/0zFtU/LP0=;
  b=kDlLjKxCgOKU6WAMpjEoc7Z06l+XTfFh3RMrWtO5/dtcoTAi6fkJPCwF
   1SxCir6WPuQqz+92FAlfHphn5mCEHWRMFaCzGq12VFYyzDWt05TfDQFvG
   3PcQY2u1fwMpcemBETis+9hZrKyj3QzrRKiPzPNig+7klJdEMRZWhNsUz
   Ln38fd5dQPgAJS9gzGbQVR/HA8nohd3pze5qknHfAVpf+4j3VEbKIL+Gi
   ZJInRAcOidfFrLeCBcLH4FuiQDo2Jh2OGmf66hFZrpkZ0yqOEAFTvl8/A
   HMIDa+BHHrPcqS135k4CPyDlAOsasPyHZmxECHgHuDyLoINjzhLoX96SL
   Q==;
X-CSE-ConnectionGUID: C1+iTTgAS5yAt1LeS4ZQTw==
X-CSE-MsgGUID: zsNJwdQ8QsO5CEFhf7b4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63644922"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63644922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 17:59:50 -0700
X-CSE-ConnectionGUID: KqXXrUmpTaaRZAccvRO8BQ==
X-CSE-MsgGUID: tD2LRidJRjGFNdGTP7xcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184609909"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2025 17:59:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDBaM-000GQv-0u;
	Mon, 27 Oct 2025 00:59:46 +0000
Date: Mon, 27 Oct 2025 08:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>
Subject: [jgunthorpe:iommu_pt_vtd 5/34] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (ffffffffff000
 becomes fffff000)
Message-ID: <202510270828.EI7UdFLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   fc8efb6fe1bb8f3526bfca99a3928d5526604695
commit: e20a89b735a6fcb7519fafb6944070355bb0d681 [5/34] iommupt: Add the AMD IOMMU v1 page table format
config: i386-randconfig-063-20251027 (https://download.01.org/0day-ci/archive/20251027/202510270828.EI7UdFLH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270828.EI7UdFLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270828.EI7UdFLH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_amdv1.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
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
