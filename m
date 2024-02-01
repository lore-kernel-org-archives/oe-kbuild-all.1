Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C753371
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706795821; cv=none; b=nZDXsG8zMvXGDeXbIPTf+1gQLUuwFzJtxL1VzMxvJXB2AujjUB2ovrhRwNjiT/jy6pSgUy9A/LnA/xTBMLp1EfWF3nsf9db5avJ6LwQgn5KQhDaidaK9sGaae+p7UEi+T2qXLOqkm1DrDOGx7MAI1FLEzzSrUFGMsU9v+I0EAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706795821; c=relaxed/simple;
	bh=MeIwhbU7RdeKNQ2I71iqVFsmHLqbf4g5xTYiB3md5f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CyoVWsUtopORkOAYMM1bTqcX2bkI/BNI5ESKy71T7VdXQ1DLteLljKRR1MPWQ6j6X7MbPK/UWu19T5JPmoh5jwF35KmwNsK/VBLEB/ka/vaMLGEhNiFPZJhS9UBsg67T8B9icrgFxkT+Y2KVEpRyEwPlHmz0j0ycHCYTmuB/uv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIIMSscv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIIMSscv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706795819; x=1738331819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeIwhbU7RdeKNQ2I71iqVFsmHLqbf4g5xTYiB3md5f4=;
  b=lIIMSscvHO7O2SPAH6WH5B2wslXrdFdILh6O5L0aeoMEnkhFXnrDnPMP
   oOdwzoMIEiqOR3MP99OvhXk7voObnn5K2r81mvEhHlnJ8/QKFkXfAXoak
   L80ANGAsoyJkmwrSwpR4OWXsGy2ZH8fbGKVlS7k+vW354+H4g0jzxx187
   GcO50re+vf423IwcEUiwdKfm0TyiT0P3lQLPEQHp+flAevFmRNJc2xGnq
   tFB6USlDMXFw8MVSYsaNwhmMd2a4AF/APevsC4GfpRi3dN+/HUxYjhD/Y
   hTgK2AdPv1mCJXA1h2uW/m1nWCJiT2EpdAX9/CR+aoF2LL4T9Kh3XTDE0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3763863"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3763863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4388921"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Feb 2024 05:56:56 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVXYk-0002pW-1z;
	Thu, 01 Feb 2024 13:56:54 +0000
Date: Thu, 1 Feb 2024 21:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommu_cache_flush_refactor 5/8]
 include/linux/limits.h:25:25: warning: conversion from 'long long unsigned
 int' to 'long unsigned int' changes value from '18446744073709551615' to
 '4294967295'
Message-ID: <202402012159.JVcN8QDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/yiliu1765/iommufd.git wip/iommu_cache_flush_refactor
head:   f2fec66c24236299f6cd347135ac7b39ee5cc555
commit: 409be2dd13f01025d30d24b78287beaf85a02eed [5/8] iommu/vt-d: Use U64_MAX instead of -1
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402012159.JVcN8QDF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402012159.JVcN8QDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402012159.JVcN8QDF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/overflow.h:6,
                    from include/linux/string.h:11,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/user_32.h:5,
                    from arch/x86/include/asm/user.h:6,
                    from include/linux/user.h:1,
                    from include/linux/elfcore.h:5,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   drivers/iommu/intel/iommu.c: In function 'intel_flush_iotlb_all':
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1450:73: note: in expansion of macro 'U64_MAX'
    1450 |                         domain_flush_pasid_iotlb(iommu, dmar_domain, 0, U64_MAX, 0);
         |                                                                         ^~~~~~~
--
   In file included from include/linux/overflow.h:6,
                    from include/linux/string.h:11,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/cpufeature.h:12,
                    from drivers/iommu/intel/pasid.c:13:
   drivers/iommu/intel/pasid.c: In function 'intel_pasid_tear_down_entry':
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:257:55: note: in expansion of macro 'U64_MAX'
     257 |                 qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |                                                       ^~~~~~~
   drivers/iommu/intel/pasid.c: In function 'pasid_flush_caches':
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:279:55: note: in expansion of macro 'U64_MAX'
     279 |                 qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |                                                       ^~~~~~~
   drivers/iommu/intel/pasid.c: In function 'intel_pasid_setup_page_snoop_control':
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:569:47: note: in expansion of macro 'U64_MAX'
     569 |         qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |                                               ^~~~~~~


vim +25 include/linux/limits.h

3c9d017cc283df Andy Shevchenko 2023-08-04  14  
54d50897d544c8 Masahiro Yamada 2019-03-07  15  #define U8_MAX		((u8)~0U)
54d50897d544c8 Masahiro Yamada 2019-03-07  16  #define S8_MAX		((s8)(U8_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  17  #define S8_MIN		((s8)(-S8_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  18  #define U16_MAX		((u16)~0U)
54d50897d544c8 Masahiro Yamada 2019-03-07  19  #define S16_MAX		((s16)(U16_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  20  #define S16_MIN		((s16)(-S16_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  21  #define U32_MAX		((u32)~0U)
3f50f132d8400e John Fastabend  2020-03-30  22  #define U32_MIN		((u32)0)
54d50897d544c8 Masahiro Yamada 2019-03-07  23  #define S32_MAX		((s32)(U32_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  24  #define S32_MIN		((s32)(-S32_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07 @25  #define U64_MAX		((u64)~0ULL)
54d50897d544c8 Masahiro Yamada 2019-03-07  26  #define S64_MAX		((s64)(U64_MAX >> 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  27  #define S64_MIN		((s64)(-S64_MAX - 1))
54d50897d544c8 Masahiro Yamada 2019-03-07  28  

:::::: The code at line 25 was first introduced by commit
:::::: 54d50897d544c874562253e2a8f70dfcad22afe8 linux/kernel.h: split *_MAX and *_MIN macros into <linux/limits.h>

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
