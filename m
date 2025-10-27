Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B6D1DB377
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761542244; cv=none; b=D9J+NXGDLLWyR6rh11AMFYyoSvwBPDHHv2UgRMOq4LeqfLDPVXVHMuLAoaAAAnnmiDTx8fX4q2jy2eYYVDy9WVmIibOYi+PylYwbVh3by/4yhI55YEJyi6sQo96WoNuLv1RrEsA8kOncmGIzXoQgGQ8Ox6uKEfONmfzWD3G5eM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761542244; c=relaxed/simple;
	bh=LJLaiasq4pjqMzdfSWnqxJrilbeQQIFZnPRLvp4Mp4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeYRST8BYe81gyWnG+cg7bjX+xmSI0kFy+IaOHbt+NxzpHs/keGMG9WG4MKZzEiCdja3uzL8kwc+eEXbWpYEo4Wji5VTBb3j66h/nWSt3UOPckDVcbD+hwwF6omYR0nU4fVz7tVqqIRB+V2GwCtO5cN4dpPp52uwpBYY3x2rFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alSuAoVq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alSuAoVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761542243; x=1793078243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJLaiasq4pjqMzdfSWnqxJrilbeQQIFZnPRLvp4Mp4Y=;
  b=alSuAoVqBGpVGK/AN79bE6C8Z326DzsWLpMSxBzFUSUxaNF+5jYx+xqO
   nV9TLGmpyUNAygJb6Yr+5V/6IlJWJDPYTWpbD6Ckl2EXZNSqKrxPyOKGh
   ZViHk4CDMXqzqsXWZRW/5AAnUpAj7g6DFTZifA1Y5YdHp7tRqsRDABOvg
   7eCWfJYJKRjk6AexP/GOv5QsbQxMxaRaIfvVlMNrXe2py47KUH+EZP1PQ
   4h6kUlMBXQea0R1p4a0AMgpA6WwziQly/32Zmtb+vrtUeP+qN4O1HoRVO
   7lOP9QwOEgFxmAc8Nf/T7S3SJ4oBb4oB0y2DCkqwU3oPMCfiH9FdfEAZw
   A==;
X-CSE-ConnectionGUID: r6q/DRquTeKusxT8swIYjw==
X-CSE-MsgGUID: uJg5r1akQBm/QgMpMBFiCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63522196"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63522196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 22:17:22 -0700
X-CSE-ConnectionGUID: qw9tJhYlSZeWZ3hoJO7Gfg==
X-CSE-MsgGUID: psfKwya2RsyxYgMdPJnFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184841515"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2025 22:17:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDFbS-000GWn-2o;
	Mon, 27 Oct 2025 05:17:14 +0000
Date: Mon, 27 Oct 2025 13:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 35/59] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffffe0
 becomes ffffffe0)
Message-ID: <202510271312.GR9RL4G2-lkp@intel.com>
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
commit: c81deeda70f69e63f6bab10a2acfcc65691893d2 [35/59] iommupt: Add the 64 bit ARMv8 page table format
config: i386-randconfig-063-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271312.GR9RL4G2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271312.GR9RL4G2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271312.GR9RL4G2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)

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
