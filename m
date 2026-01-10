Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C2C30F923
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040812; cv=none; b=UAbMTQ0Y7Z0FCDdWmlsyv8LsEhwo5hHTP0uS4F91drWgOXQLrTv68rsl+LvEJprNutv22aqp2aNQhKxJCIbbLoBTl6COZ05N0sNqQvus0vx0sYTZuGddUq47yg9noJsHWgceT9jZgfzK+M/ZZHTItQK4qiFQFTTy3nQvFIbpGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040812; c=relaxed/simple;
	bh=HTJIu7mBiBPsBIUEVr5Pf7LgvxTlHFHVbBZpwWdZf5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Opf/E1dl8Vw4kCONC5pCF/rMjiM2J7hFChnyYqNcreBgZZnSULLoeUn9T0WhCqMPtJnEffuzfy7lI6DTmpv+PvfrBh99OxCbMlFFX1Nl4cHq+9vcaYcGHneKXcRbhWQLKG9yYTdvpF616A5JZsn4ERKWLHaAdD+rFuO/rxnJN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNu7MMli; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNu7MMli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768040811; x=1799576811;
  h=date:from:to:cc:subject:message-id;
  bh=HTJIu7mBiBPsBIUEVr5Pf7LgvxTlHFHVbBZpwWdZf5w=;
  b=RNu7MMliI46u4wrMrqrPXODtKXEHmbQaTCH+yin49GQN2pOpbMo7Kp8N
   KZ8aD9yFKTG6PJnstamI+rVABB+eKGTllch5iCBFWgtyEUEQZ+l8K0ARC
   nSbekNrjWltDJZEa+JS06VI06CICyc8yPr/5utxer4Q4m4Ly0/YVehH6Y
   +4A5iHxVR3OFF+GJFS5Btnzeidm2SK0DH97uezi8ppX0E8yejXckWwW4a
   jUZgmKQYh5yYDvpF3Gh31kcIyXjSd64mEO9cxfDfRvLfzABdOSJHC9rdq
   ZwZaiIMUxvhACzWaXeCcwmFEQUZBPbezbdhvp2k4g+yt9KNGFztrOa3oZ
   Q==;
X-CSE-ConnectionGUID: 0hxkP3SBQjiZDnGPJ4WU3w==
X-CSE-MsgGUID: pKv5qgSfRtqZqSSK42CYDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315848"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69315848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:26:47 -0800
X-CSE-ConnectionGUID: kHfCtGcaRfKtX7CnH49I6g==
X-CSE-MsgGUID: YgwiPDPESpK9BR6kcPt+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204433163"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jan 2026 02:26:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWBA-000000008Ww-0o3L;
	Sat, 10 Jan 2026 10:26:44 +0000
Date: Sat, 10 Jan 2026 18:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' specified
 bound 4294967295 exceeds maximum object size 2147483647
Message-ID: <202601101800.lE2YoeRy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ab8dd06cde55677f939e0642df31f06126d507d4
commit: d673099085ddf1c28a6c0c1a245480919b5fe9e5 [4/4] wifi: cfg80211: fix CQM for non-range use
config: arm-randconfig-004-20260109 (https://download.01.org/0day-ci/archive/20260110/202601101800.lE2YoeRy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101800.lE2YoeRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101800.lE2YoeRy-lkp@intel.com/

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
   net/wireless/nl80211.c: In function 'nl80211_set_cqm_rssi':
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:12933:17: note: in expansion of macro 'memcpy'
   12933 |                 memcpy(cqm_config->rssi_thresholds, thresholds,
         |                 ^~~~~~


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
