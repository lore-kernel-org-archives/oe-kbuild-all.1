Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743752EAD09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763523354; cv=none; b=qP74n6LPnkVQ7X4qjgpzMiaE/2tg9wCm46BqqDwlJa0Nzr5DK0/lx3KKFN5d9DpakKefG1YTKrca4IY0+27SkOQfMYYeZeyptg+1AYQkL2oXAuNZi5o12ls2gE6pXq/8DFGhez1AcvUDmaY3H9dmnvBx0uIuxkN/tFb8h+6XOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763523354; c=relaxed/simple;
	bh=ZPy2sog4IdP2Ttc9u7WJqMHGUVHXxiiF7GfOhBKkw3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YU9qc1HXved08L4FQA4BvrlMWj7WH6kYMoLHzbrx1X3KlLOYvU73pNIrRw3Yr/U8JbyvQwRap6tYv75x5pgha5paAlcUQL2TdXJix/3a5qDXgMRM7nzjs+roddAIJ2oXhhbeyNRntboCzz5fGYI+IyxPdqoFShnEUxKDCQ0er14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/SmZeoX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/SmZeoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763523352; x=1795059352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPy2sog4IdP2Ttc9u7WJqMHGUVHXxiiF7GfOhBKkw3I=;
  b=c/SmZeoXNvFs73RnGnTt66RgiWcloLCgtU0aKL0XC3N1SBjOxZjSn+/6
   MJZpJo387x+5UOmKA86sVIDj2GeL+yLzPeWt1JekFHq/xCoedKlemItTg
   vyB+SGKJN1OvA+rNEAVeScC+jtM57qVsvzQ9R1p10Ujb2ugcunmY6I+N3
   Oz1l9vWForpVjsRYQKUVHPce24D55B+c59bmDyQtwKDODRYZmlGLgW4xl
   HLN0HCcSxmbqFdV8OjErKRMJA5VWGe2cT98PPNW/MPxty5FDjY+IyUbaE
   E6som+Uu4Qa84RoDCR83a3MRmeA6XEGciJpDvAHaBcnOYPQBNDSQdDDHc
   A==;
X-CSE-ConnectionGUID: WVZP6tm3RsqosH/1gj0udw==
X-CSE-MsgGUID: nSgKHG/GSX2KLNtIZjwCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76911150"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76911150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 19:35:52 -0800
X-CSE-ConnectionGUID: moJYmCzvTo+ix54cn+RRXA==
X-CSE-MsgGUID: Uezg++OcQ+CIfDoA2FDZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196070146"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2025 19:35:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLYyy-0002PR-27;
	Wed, 19 Nov 2025 03:35:48 +0000
Date: Wed, 19 Nov 2025 11:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 1/1]
 include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' pointer
 overflow between offset 36 and size
Message-ID: <202511191155.iz8ejDXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   8647dfd625bda3d0f030fb149a498c3684332b26
commit: d673099085ddf1c28a6c0c1a245480919b5fe9e5 [1/1] wifi: cfg80211: fix CQM for non-range use
config: arm64-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191155.iz8ejDXR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191155.iz8ejDXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191155.iz8ejDXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/if.h:25,
                    from net/wireless/nl80211.c:11:
   In function 'nl80211_set_cqm_rssi.isra.55',
       inlined from 'nl80211_set_cqm' at net/wireless/nl80211.c:12994:10:
>> include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' pointer overflow between offset 36 and size [-1, 9223372036854775807] [-Warray-bounds]
    #define __underlying_memcpy __builtin_memcpy
                                ^
   include/linux/fortify-string.h:648:2: note: in expansion of macro '__underlying_memcpy'
     __underlying_##op(p, q, __fortify_size);   \
     ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
    #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,   \
                             ^~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:12933:3: note: in expansion of macro 'memcpy'
      memcpy(cqm_config->rssi_thresholds, thresholds,
      ^~~~~~
>> include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' specified size 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
    #define __underlying_memcpy __builtin_memcpy
                                ^
   include/linux/fortify-string.h:648:2: note: in expansion of macro '__underlying_memcpy'
     __underlying_##op(p, q, __fortify_size);   \
     ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
    #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,   \
                             ^~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:12933:3: note: in expansion of macro 'memcpy'
      memcpy(cqm_config->rssi_thresholds, thresholds,
      ^~~~~~


vim +/__builtin_memcpy +57 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
