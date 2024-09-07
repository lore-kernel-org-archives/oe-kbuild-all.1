Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9E1DDC9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725738933; cv=none; b=HP431C1Fqj7Wh1m5SmwPs4Refo0xwR2Rti9+KWnQIZbc1FSyYeEcBtQ4LQcnkqrQR3db4Yk6NHwbYA70Qwwu6PNAQCIKTlkzigl1FwnbgjdZgNiNTpZymNlL2lN5pg92hon8TBq5mU6Q0tRHGbhfkrna9GEAk+47vdQ4S3szgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725738933; c=relaxed/simple;
	bh=A2PeFPm3eEUXTDEfTq5MiJ73B87hFZxPGsV+3Th3HHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3rig6upe3ce5TTUDWNGw7mV0J0zpQ/IfUcl+KbnXClKxgliQip0eNF9h5PSJlQmX/XZ2iqG/WXyqg6ftyMcOHosHcCVIWBCnPYbAg+SfewAxMzg2cFrBgACbSMNgrbzvvfhj61p70EK42bTQNkfS/3N+jwbtRzdzf4+4jLUGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVe1Lg0O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVe1Lg0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725738931; x=1757274931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2PeFPm3eEUXTDEfTq5MiJ73B87hFZxPGsV+3Th3HHw=;
  b=JVe1Lg0OJDjTg2Tqg/KdrEQATfbeySgPhmi3Yw6she0CM4ps+SetsfPB
   d9DF17brBGkR+PZaAaFKyS/RLkfGsuw9atnAeceyVmdwchPpNfzzR0zvI
   t2Qyr/47ceZaLh28V7LB8JJ0+JwkPOiU0yUeSyrxYRKzq80rlnovRcu2P
   RztOqVgxX2s65CRns5aZYBFeIcoOtbDDUt2UqlXkxFVX6G0ulME+fz2rn
   y7TwgjiP/xjx2kUQYf+26emy0GwiMDT24R+aGkH5c5ttCI69mwnpKAC4p
   qezxF3tea6gIN5m+XqiGaKStaiyWo2gm8Zjlt104eikjthukNgm4IvuMk
   A==;
X-CSE-ConnectionGUID: D/BwyU38TYmMwSTpvVk43g==
X-CSE-MsgGUID: qhLRRBiXSpCvZPCvZR9ylQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41983407"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="41983407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:55:30 -0700
X-CSE-ConnectionGUID: bv+6KtpuRt+VXVpOzCVhow==
X-CSE-MsgGUID: eaZ+bIIUQeCOTpkZjSZ8yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66245920"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2024 12:55:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1Wp-000Cvl-15;
	Sat, 07 Sep 2024 19:55:27 +0000
Date: Sun, 8 Sep 2024 03:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 16897/30000] crypto/internal.h:66:2:
 error: implicit declaration of function 'static_key_enable'
Message-ID: <202409080310.GOsm5PDE-lkp@intel.com>
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
head:   c61fe0085f7a1e4ccc322193feeb8006ee86c903
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [16897/30000] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-001-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080310.GOsm5PDE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080310.GOsm5PDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080310.GOsm5PDE-lkp@intel.com/

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
>> crypto/fips140-module.c:482:8: error: implicit declaration of function 'register_trace_android_vh_sha256' [-Werror,-Wimplicit-function-declaration]
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
   <scratch space>:41:1: note: expanded from here
      41 | trace_android_vh_sha256
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
   <scratch space>:44:1: note: expanded from here
      44 | trace_android_vh_aes_expandkey
         | ^
>> crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   5 errors generated.

Kconfig warnings: (for reference only)
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
