Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052721CA03
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 05:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906694; cv=none; b=KvJuJF+n5c/vAe0AvI8FkvnXJXdrPZZUOUF+56lIab8zcWQCpjxgoySxX+8iUThXmq5I0S7R7ALPw806u5m8gZF9elmwsjEL/2AdZ1gEvntw2ib27PDRSDXGbkkm3i0/4gLwsPby9stj69++USpd1rGBJ+BHfAlHL6br3nghANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906694; c=relaxed/simple;
	bh=JS2KSIWGNYTJtMP/iNeq8GRzib12Cs4xl/XCAM/pMgI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dZgCrLC3lSFdIlO0XTulMlZCHZ1f1hrLFjCVQB87V3epd9pBoXa5fB1b7/5BLZsBS1DSUUFU5noCcOXByaCj3BeHn35/LJQxN/oyxo+j0HhRBvqGZdTK9ZnnbnDB6qlPnd9hjwvnB+eryehHEfFT6o7UxxxrxQULYGqgSqRaQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNLOd/aP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNLOd/aP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906692; x=1817442692;
  h=date:from:to:cc:subject:message-id;
  bh=JS2KSIWGNYTJtMP/iNeq8GRzib12Cs4xl/XCAM/pMgI=;
  b=BNLOd/aP+a2XyZYasRHV+Qr2nn8QQK4wgjzbvUXB/ecYMRr/G8iSxAEa
   r0d/VDJGuq3g2+OJzjz1HFCq0ZekBV2SRRjmZsglwlu2pP0oHqbFHaxXw
   w1IxUh0bjbzAku/QrknvcbT5sBaixDtJrbhFEopJ+xi9hAom9AaoAw8Il
   Lc7vGIToG2sHeYzbs1Xu8UjrlYM8TWqtKYXuDgmEanFPjghckJBbaBFfS
   psoku2NNo3xsm2xtCDPPFNL6KHgaiTXYWEfXv/3LWwG2ALVbnvemM8H1e
   kCYflJQf6MmgcZnos3KEWu4XecUL3Ier65+s4WPJJJdNdGAddX+GYH1NV
   g==;
X-CSE-ConnectionGUID: 9rTlYQYYTWq7tAfNtyS0HA==
X-CSE-MsgGUID: pT2WhJjfQJORroZ04OgVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="74007174"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="74007174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:11:32 -0700
X-CSE-ConnectionGUID: QIR1W+4MSQWFx59/BwJL3w==
X-CSE-MsgGUID: puyY1toxRkyoAW9+WWPrLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="265950764"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2026 22:11:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTua-00000000Bbn-24aJ;
	Wed, 05 Aug 2026 05:11:28 +0000
Date: Wed, 05 Aug 2026 13:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 crypto/fips140-module.c:485:8: error: implicit declaration of function
 'register_trace_android_vh_aes_decrypt'
Message-ID: <202608051327.e2l9Eh1j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9ed6d24476a19dbfb33c7d2b53c623b054bb285f
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [1/1] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-001-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051327.e2l9Eh1j-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051327.e2l9Eh1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051327.e2l9Eh1j-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/fips140-module.c:482:8: error: implicit declaration of function 'register_trace_android_vh_sha256' [-Werror,-Wimplicit-function-declaration]
     482 |         ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
         |               ^
   crypto/fips140-module.c:482:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:19:1: note: 'trace_android_vh_sha256' declared here
      19 | DECLARE_HOOK(android_vh_sha256,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:20:1: note: expanded from here
      20 | trace_android_vh_sha256
         | ^
   crypto/fips140-module.c:483:8: error: implicit declaration of function 'register_trace_android_vh_aes_expandkey' [-Werror,-Wimplicit-function-declaration]
     483 |               register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
         |               ^
   crypto/fips140-module.c:483:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:26:1: note: 'trace_android_vh_aes_expandkey' declared here
      26 | DECLARE_HOOK(android_vh_aes_expandkey,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:23:1: note: expanded from here
      23 | trace_android_vh_aes_expandkey
         | ^
   crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/register_trace_android_vh_aes_decrypt +485 crypto/fips140-module.c

2db9143a1b5a70e Ard Biesheuvel 2021-03-23  477  
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  478  static bool update_fips140_library_routines(void)
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  479  {
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  480  	int ret;
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  481  
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  482  	ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  483  	      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  484  	      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
2db9143a1b5a70e Ard Biesheuvel 2021-03-23 @485  	      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  486  
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  487  	return ret == 0;
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  488  }
2db9143a1b5a70e Ard Biesheuvel 2021-03-23  489  

:::::: The code at line 485 was first introduced by commit
:::::: 2db9143a1b5a70edaa69a5e1b12acfef490c6d38 ANDROID: fips140: add kernel crypto module

:::::: TO: Ard Biesheuvel <ardb@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
