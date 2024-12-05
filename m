Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B918C33C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733379838; cv=none; b=Hsh1fB5BIwiM4Xm9u4wxQFSOqo2DOk9LC8+ZUU8GUKzcfvpq8ypLonoBD1wlFKFgoIevBNqT0WQITZyienFC55WSY/iaEsIjdm3riExtuGHBEtR5K2jAKur3ukBOBDFUoURqtZWRTiTvDCCL3n0041aSIqtksBZFlc1WUM16PwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733379838; c=relaxed/simple;
	bh=2+SvWuD6bBP4pOFCR1bUldTohj5Up/VY9Eo8a9A6MqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlyYAvZ9cxhAp/lsf3u2BHpui7uLfKjp2UutC9/8OVVuUsbN0s+DPUzntfeGqaEQy2hdGIcL8qwT+6UPWhn3PZc3CbdY6PsejQHzTFb0U5JUdKucBveEdyRrjFieXqoyDPLnUJeOuvI3gHpPjDWTq1saKM+4hhCBjxVmLuZcvYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUtYk3Mx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUtYk3Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733379836; x=1764915836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+SvWuD6bBP4pOFCR1bUldTohj5Up/VY9Eo8a9A6MqQ=;
  b=fUtYk3MxiimFu2ciQEcwXL7W63095Eoli3j8oPLugpPNIZR9SQeMfslP
   lhpymE+6SFVnH0jaq6m8Dp6HZ18rnVEnEH3emYrHISOB1xKA65wjGwexB
   MF7MZxS6bLA9GfGbvH0KQE62a2Jj6g9AYScrepzkNXGRUtm1D9JoaXE4C
   BiJXdo/p1ROZCV6LKWeTrsxk71nwfNWVUq+IiPgdmsoyoBeNoOVcz7osK
   NIZ16FREdAIkNMtQAee3hNDzwztceJFwlLG7Rh2QHoYCCjPiiT3Ti/EhD
   v1ZsoCcov+nx400Iv2h1imhJQTI+6cgZlL6kdBD1dyRNIfYNPFj7nFoGL
   g==;
X-CSE-ConnectionGUID: VLyE8FyoTaKPWC8gzi+9YQ==
X-CSE-MsgGUID: KChVGhn8TRip4yAlEv5abg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33592111"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33592111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 22:23:55 -0800
X-CSE-ConnectionGUID: UYTzBa7KQjq5g60QElaDVQ==
X-CSE-MsgGUID: rweaPgWlQs+WDNob4fQHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94078308"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 22:23:55 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5HA-0003sh-0T;
	Thu, 05 Dec 2024 06:23:49 +0000
Date: Thu, 5 Dec 2024 14:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 14987/30000] crypto/internal.h:66:2:
 error: implicit declaration of function 'static_key_enable'
Message-ID: <202412051455.mjzVXFzf-lkp@intel.com>
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
head:   06a0756a038bab21da780e524fb569610b4227a0
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [14987/30000] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-003-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051455.mjzVXFzf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051455.mjzVXFzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051455.mjzVXFzf-lkp@intel.com/

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
   <scratch space>:59:1: note: expanded from here
      59 | trace_android_vh_sha256
         | ^
>> crypto/fips140-module.c:483:8: error: implicit declaration of function 'register_trace_android_vh_aes_expandkey' [-Werror,-Wimplicit-function-declaration]
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
   <scratch space>:62:1: note: expanded from here
      62 | trace_android_vh_aes_expandkey
         | ^
>> crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


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
