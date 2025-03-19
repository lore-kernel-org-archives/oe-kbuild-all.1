Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B891DE899
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409104; cv=none; b=ujB4azlh/XoosFCwjvrTI7JDEqtzlhEts9L0lYtsmsMfYMbXeP6kWcsGhRafB0rC6HyCejLSgrQknno7x87UT5qqKLZTAy97kAEtzf1L9VneZvX65A9SXrFh9gkZ2srfmp6Fbj/aDK4BzHW6I+2yFZK/lTv7brhyCsDfSYV+hl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409104; c=relaxed/simple;
	bh=Kce3GGb3Pa1Q2fGmsP1UY+I/4sH3dztxeUpREze6QHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCEvNVbMaH1aMiW4NW5ktDJP7cFB51/rlYUzFn1c/G2VgRP36Kxla6p8OswwljFrJ5UPadBvS6Ld2AdfibozNUKj9CZUIYfwmLESyIblpSYUpvkxieV7YWyBOQi/rjUsJHRx+q8Jj+aU87JO5Bm/oZKRgQCOGZbGbtwqwk+WV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR7BKrM6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR7BKrM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742409103; x=1773945103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kce3GGb3Pa1Q2fGmsP1UY+I/4sH3dztxeUpREze6QHs=;
  b=CR7BKrM6u2HZCU/lfibKhvvC0GdRvuk+9O6alBy6FBfWN15+d5p+f/p+
   JJ38dbGs/hh9s0MrS1foEYpdYxllTNXt2txoXdPvgAojEj+YXu/RYEoOr
   4/Sml+lfneNV08w054fpL3MsKxHvXmyvXSlzeA+6T2n4CFEoIkY44cnfi
   jmFPNpg0/EjYoD6E9ACxXOzT5gvp41XTeO/ZC0EGRPVhmHiLH3snK8pcJ
   vDDkFXDHqAolXJT855RM8+XbqDXxMhfyH7UTVULWkpuN8/tDxFY1v0JzU
   XODZmheQGuIWDCBUweE3tQkt8HphwH9H1zxKNJYR8QbQGwvaxQAnIda/g
   w==;
X-CSE-ConnectionGUID: gDP0c+3SShOdUJR3QCMPOQ==
X-CSE-MsgGUID: lRp/CGQVTUyNNL5MRuYVNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="61010910"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="61010910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 11:31:42 -0700
X-CSE-ConnectionGUID: RbCuXZfsS92qysDw1GoozQ==
X-CSE-MsgGUID: bYwkwrTTSpmGww0d4rGkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127824688"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2025 11:31:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuyCY-000FbE-1G;
	Wed, 19 Mar 2025 18:31:38 +0000
Date: Thu, 20 Mar 2025 02:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' pointer
 overflow between offset 28 and size [4294967295, 2147483647]
Message-ID: <202503200203.JXuWjyUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   fade384491efe8973552b7b1c77e2586b6ce4226
commit: d673099085ddf1c28a6c0c1a245480919b5fe9e5 [1/1] wifi: cfg80211: fix CQM for non-range use
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200203.JXuWjyUQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200203.JXuWjyUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200203.JXuWjyUQ-lkp@intel.com/

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
   In function 'nl80211_set_cqm_rssi',
       inlined from 'nl80211_set_cqm' at net/wireless/nl80211.c:12994:10:
>> include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' pointer overflow between offset 28 and size [4294967295, 2147483647] [-Warray-bounds]
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
>> include/linux/fortify-string.h:57:29: warning: '__builtin_memcpy' specified size 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
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
