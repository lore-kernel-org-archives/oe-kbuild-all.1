Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74333C192
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563371; cv=none; b=ie1LBNFjaIztwrxYGZYBeFJJNylD+VECnrheQqa6KcSsYN6vcgNbpE8lZgnuE/hX6Lrgr/GH4jFWywQ0GHzTLBxQ39+Savzlu5p9IUJaPNfGHT1GrXzLZXlfjnW1N1mDGeQr1CQRvA6pAVDL2sOi3Yua6ar8IbnthNhe8dyurR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563371; c=relaxed/simple;
	bh=wj5hHICw5erPctwpyWKxfpDRLEeKyAa9rmoWIyUzeY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfjfPSIwDrzrNGFwX57oPu1NKuvLjAcQp7eHC3IlLuxjqm38kH7JY5ELsShD2QNkaylfSjYus+FuyhF8MMDkWm8ko2pYLHC0/okC78dlvtfxZSjKGEQHOtSFSN8BlYuPJm5wUI3mixf9nIA2f4oxSEV+b/p85NW39LvBPJFOn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPg1GxQF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPg1GxQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778563369; x=1810099369;
  h=date:from:to:cc:subject:message-id;
  bh=wj5hHICw5erPctwpyWKxfpDRLEeKyAa9rmoWIyUzeY8=;
  b=gPg1GxQFADSdYWO+it6xVdNBSrC0BaiiDU9NiBo9GhI/Epo6/5QNNmZ2
   Tst0Rkqc980ouTOwu3jM74Aex6yc/purwQvBleVxxZy7ncIjcu8R8ufcf
   yyK00hfB48vierDSeuWpE9vGZuZFI+A2CqtfPvxdri5iWJsoXu4Uh/qwW
   DwtBxPRJv5+dvTwfdih0Rd51UtPF0u8L36BYhEoO4fZIWu8dFqc95NwQF
   mia6R+HoUrbXNDlxEj6zITiSrJZeO3Semyep6BZvv4a6UNj0Rtlwv4c78
   GoY5kBbAIuXm+L5BTA5Rk8dbNsFMNrysrqTt9nnB5baLL1P9vFwTowIZR
   w==;
X-CSE-ConnectionGUID: A3DcTwxVRC28BvgrECsBig==
X-CSE-MsgGUID: TvolTeasRGubY34o2Jv1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89766074"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="89766074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:22:49 -0700
X-CSE-ConnectionGUID: dxsxqQQZQk2dTsHf20lZtg==
X-CSE-MsgGUID: g3DTN4eMQjOsMBDpYyf6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233349091"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 22:22:46 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMfZr-000000001dN-3Xax;
	Tue, 12 May 2026 05:22:43 +0000
Date: Tue, 12 May 2026 13:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, Nutty Liu <nutty.liu@hotmail.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [iommu:riscv 2/2] include/vdso/bits.h:7:40: warning: left
 shift count >= width of type
Message-ID: <202605121350.wZxB51k0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git riscv
head:   6c21eb174c6c7aebdecaf5c39e3100e6beb35faa
commit: 6c21eb174c6c7aebdecaf5c39e3100e6beb35faa [2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260512/202605121350.wZxB51k0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121350.wZxB51k0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121350.wZxB51k0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/generic_pt/common.h:10,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:33,
                    from drivers/iommu/generic_pt/fmt/iommu_riscv64.c:11:
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/iommu/generic_pt/fmt/riscv.h:67:22: note: in expansion of macro 'BIT'
      67 |         RISCVPT_NC = BIT(61),
         |                      ^~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/iommu/generic_pt/fmt/riscv.h:68:22: note: in expansion of macro 'BIT'
      68 |         RISCVPT_IO = BIT(62),
         |                      ^~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
