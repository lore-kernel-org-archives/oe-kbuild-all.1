Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824A2749D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455685; cv=none; b=nqD+7cZV5L/qFo4rm6h/cTv5xw/xFjbF6CqSDA5rptDR6n7LRIGZwm/Cda4Lf/ZvAESfvBAaVuJt3cAUv5pXNs5dp9JG9H02gLoLUvbtWwlEGoXzEaBiX/MiS4zQkiCo1FmoR2PZBDU1wBXqTfdXgRfY0+8c3BtDpFHYtPwk4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455685; c=relaxed/simple;
	bh=tehmiTZc+r7ODN2cFQWTJv/BF7TKpXrppM50Qsc2GNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPrbfGCdOBfegWs1pJewJk3LX58z13hK1klOXwwrf4hTL3chPlOo8u+0pcfWB6CjLRFRx05Fs0eY53WTsI8Y4enxO2nevLDequi2Nabh+a1yA2K+pZM7R+20TZQMygUmPET7X2DpU7rAwnHI/+/1bx1/bnNtod05jOOWparJXO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lT7oCnyG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lT7oCnyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763455683; x=1794991683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tehmiTZc+r7ODN2cFQWTJv/BF7TKpXrppM50Qsc2GNo=;
  b=lT7oCnyGuQBGGkGnKHFZ48/xFg+SLyjtQ7NPxflpVl4vukVRKEVrgjvz
   8DYsFx1jEIQiNVasq1Mkad13y2Wx0D1IENahseZSydOY9Kj5b9UPssnhY
   XG3kwuZ5X/PZg9Ehx6GV9voAZczRFAmE1LLq9HwABv9c9RzGH7LUyJ3GJ
   coS4V2DPXEky1JctlUvdX3mrnY+vKv1+5EaqQEeAgzMRjnvatvnUU9pu5
   jREpq/DEbA/nUctzIIIxuYZDYSDQSl9LENcHw9/l1C7peIajJKkVpC+NS
   Uxkw4ILMZriwAJMmu2WHpMq22pALfjUoe+U5iy1k+S0nBI6RFh33OceFg
   w==;
X-CSE-ConnectionGUID: T4bMQNyYRWGTbzxE1QaGPQ==
X-CSE-MsgGUID: XKJwFiJGRGCLtm+EAq0W0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76573725"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76573725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:48:02 -0800
X-CSE-ConnectionGUID: loXugM1aTtiO0ws+GTy9nQ==
X-CSE-MsgGUID: NEzwHYFdQ6qTGupQwJQ1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195615241"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2025 00:48:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLHNX-0001W3-1r;
	Tue, 18 Nov 2025 08:47:59 +0000
Date: Tue, 18 Nov 2025 16:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] crypto/internal.h:66:2: error:
 implicit declaration of function 'static_key_enable'
Message-ID: <202511181656.1hdRjCam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   a9ee5509a0c552cb7bd7846b03b538dc2cba7585
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [1/1] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181656.1hdRjCam-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181656.1hdRjCam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181656.1hdRjCam-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/fips140-module.c:36:
>> crypto/internal.h:66:2: error: implicit declaration of function 'static_key_enable' [-Werror,-Wimplicit-function-declaration]
      66 |         static_branch_enable(&__crypto_boot_test_finished);
         |         ^
   include/linux/jump_label.h:550:35: note: expanded from macro 'static_branch_enable'
     550 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                 ^
   crypto/internal.h:66:2: note: did you mean 'static_key_false'?
   include/linux/jump_label.h:550:35: note: expanded from macro 'static_branch_enable'
     550 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                 ^
   include/linux/jump_label.h:210:29: note: 'static_key_false' declared here
     210 | static __always_inline bool static_key_false(struct static_key *key)
         |                             ^
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
   <scratch space>:106:1: note: expanded from here
     106 | trace_android_vh_sha256
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
   <scratch space>:109:1: note: expanded from here
     109 | trace_android_vh_aes_expandkey
         | ^
   crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
   crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/static_key_enable +66 crypto/internal.h

5cb1454b862ab3 Herbert Xu   2005-11-05  49  
118fe0a09c8a6e Eric Biggers 2022-11-13  50  #ifdef CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
118fe0a09c8a6e Eric Biggers 2022-11-13  51  static inline bool crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  52  {
118fe0a09c8a6e Eric Biggers 2022-11-13  53  	return true;
118fe0a09c8a6e Eric Biggers 2022-11-13  54  }
118fe0a09c8a6e Eric Biggers 2022-11-13  55  static inline void set_crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  56  {
118fe0a09c8a6e Eric Biggers 2022-11-13  57  }
118fe0a09c8a6e Eric Biggers 2022-11-13  58  #else
118fe0a09c8a6e Eric Biggers 2022-11-13  59  DECLARE_STATIC_KEY_FALSE(__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  60  static inline bool crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  61  {
118fe0a09c8a6e Eric Biggers 2022-11-13  62  	return static_branch_likely(&__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  63  }
118fe0a09c8a6e Eric Biggers 2022-11-13  64  static inline void set_crypto_boot_test_finished(void)
118fe0a09c8a6e Eric Biggers 2022-11-13  65  {
118fe0a09c8a6e Eric Biggers 2022-11-13 @66  	static_branch_enable(&__crypto_boot_test_finished);
118fe0a09c8a6e Eric Biggers 2022-11-13  67  }
118fe0a09c8a6e Eric Biggers 2022-11-13  68  #endif /* !CONFIG_CRYPTO_MANAGER_DISABLE_TESTS */
9a70f42d4782c0 Herbert Xu   2021-09-17  69  

:::::: The code at line 66 was first introduced by commit
:::::: 118fe0a09c8a6e59cf6ce97627818bee25f1f3e6 UPSTREAM: crypto: api - compile out crypto_boot_test_finished when tests disabled

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
