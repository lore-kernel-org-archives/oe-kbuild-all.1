Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1546F258EC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966964; cv=none; b=tRfRtvOkVNcYsdNII4aFWAlC596280KxqcqRMq2FEz8B6w7fxVxEj67grhSb5CsFC7ypf8I4EjGQtNIqHVRG+NicpD+SpTCoNfS6m2xv9FH4eaWVhEgSZHnBvTXJ47Pu55WH3R5CFh0ZlmvL0q1+mCfBBHBaZsTZjcFfUVKRlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966964; c=relaxed/simple;
	bh=5aoNDVUEEWXb1kNiHvs0LvXGdkYQKrC1S/6zzKaoWNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fqzY4RU6xJeqONJRMj9poOwGpHdY+vDm6Go1//VNoqSkjKfC0WRvx0CiHDtThzul9wKTC412oP6uEby0bMluF7h958ymDIlmFO1E09g9MaJ83AEAyGe6NhBnkURYiIOtJ5kWNAquKs8+yHdQVz6/ztKs6/3/rXd3szMuOh2v52c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVCSwCxX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVCSwCxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966963; x=1806502963;
  h=date:from:to:cc:subject:message-id;
  bh=5aoNDVUEEWXb1kNiHvs0LvXGdkYQKrC1S/6zzKaoWNg=;
  b=hVCSwCxXwUc6tW4l4V6BpeR7fdxm2Vqx8tgBdNtZnJRGJovLBAUIInz9
   qwE1KbzybM7JSwWBThTNsmDRWMPwxmS3VI9lNvK4Cj3SmAA472tq/6LYc
   IQcFJwTZGb95NYJlOCniEKFmIC/2a9GBom7Fr/TcG7II65hEABBh2dVHw
   UHTJ+jCP62oKBe324sOc5ehMSmblRAFX29iNuSR2MPJ/s7+WzaxbbRJ0U
   Iu5cuMAb7E5slNEEIL8v9I8KcddRsCzZTwdh/TslB+BvBxmroorecIFJy
   IBSA+LfMobtBQEaTAAGgWwCedMjGpIZON6x+Q+uLQVyFp1hjZLo7KrDDg
   A==;
X-CSE-ConnectionGUID: aXC+9y3mRtypHbmAaZQe+A==
X-CSE-MsgGUID: 0cd67OPCTOGMHt4PjJVUIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87058017"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87058017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:22:42 -0700
X-CSE-ConnectionGUID: SaaPcUIoSxSCSHvatcPtaQ==
X-CSE-MsgGUID: Zxq0qTc6RyuXLilctfZ7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223500012"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 07:22:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ZzK-000000002l3-3Aup;
	Tue, 31 Mar 2026 14:22:38 +0000
Date: Tue, 31 Mar 2026 22:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202603312223.BUJBFlUk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   19c7b4b3480e0330addb0c3975aaf967070b2431
commit: 453cb76c605cfc3405a95bee4888782c7218b92a [2/2] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312223.BUJBFlUk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312223.BUJBFlUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312223.BUJBFlUk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/shmem.c: note: in included file:
>> mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> mm/../drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long
--
   mm/memfd-ashmem-shim.c: note: in included file:
>> mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> mm/../drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long

vim +19 mm/../drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
