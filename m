Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE34224CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743126035; cv=none; b=uLiOuXimtKirdorU5aq5QcyWKGYvw9i+rjOOm5w/em9eyhfA+vwoDFdYZWHu4sD9cBNKP3wTI4Ah9xuaSbpM2xj6s0BvJ/e6/a/od2zV5Iw8scO9QxDfnxw4xahB/Jdz/HnYnmSXvmcScXncW4/XX0SMdLBX9LOnAP0/V5PmRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743126035; c=relaxed/simple;
	bh=VEfL0vPeGfnKhpKoBEiCC1gkXEfNqytprvdgN15tH90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFlGT6BbbaN8f8qyMlc7nzLiC4UkFe3qQAsgzQmOaJKHfDpOFiqgaeUS0bVIKD2wTIQZ5cDcEOs7fNo0EYxeOQKKn0EpEidUap6ddTx2v5isbxlRNuMpAb1qVzt4uaNN6UahmjP0k+SXzMoyJOT2KkK0ek7bjfO8kzTBbYU5gbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBJjihz4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBJjihz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743126033; x=1774662033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEfL0vPeGfnKhpKoBEiCC1gkXEfNqytprvdgN15tH90=;
  b=LBJjihz4KGNT1kTHNFqJ+lg6t4QKVAaXDrnuymOg2590TRzUw03bS6S0
   dPCyod2LbQ5F7Fcwlc7lVDobevScr8bHuW3NbjXTZNcDA3MGo8Ey+nvvs
   YBxttS/wyR3RDopwK+PP8/EHnYmgoXAqmfSkMHG2qel3RMTook0KixzYm
   KMvYbbTBoWiVBkM6iGqOaoHT7/wECCKyyHDWFVUaINGyU6k0iUclys03e
   SSaOFSdZBpDUQn0IB9o3yGKvw4Wx8LGOVvZPahEBF/RRyjW0b4bFLIZhd
   z6eqMyj3WPPeo2jUzGg59I3+PtyF7ABneIe10i/W9GWhTRg36YkIgpeqA
   w==;
X-CSE-ConnectionGUID: SGTfzN5zRKmyVj+FUUuBHg==
X-CSE-MsgGUID: qSwZA4aFT52qCFo+5qHRlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32084926"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="32084926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 18:40:31 -0700
X-CSE-ConnectionGUID: lI1BvDiBSVi94Pj/5wgpcg==
X-CSE-MsgGUID: d/eoDIvLQqGEUxge62vJaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125763909"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2025 18:40:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txyhw-00074Q-1W;
	Fri, 28 Mar 2025 01:40:28 +0000
Date: Fri, 28 Mar 2025 09:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 2/2]
 crypto/fips140-module.c:575:8: error: call to undeclared function
 'register_trace_android_vh_sha256'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503280934.8FaK7wHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   da759a1462b23348c55a6399190d67bd1d1051b9
commit: 8a99ad0b72e2f0a56d72221a9a20f4f261dfa3c7 [2/2] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280934.8FaK7wHJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280934.8FaK7wHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280934.8FaK7wHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/fips140-module.c:37:
   crypto/internal.h:85:2: error: call to undeclared function 'static_key_enable'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           static_branch_enable(&__crypto_boot_test_finished);
           ^
   include/linux/jump_label.h:553:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   crypto/internal.h:85:2: note: did you mean 'static_key_false'?
   include/linux/jump_label.h:553:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   include/linux/jump_label.h:207:29: note: 'static_key_false' declared here
   static __always_inline bool static_key_false(struct static_key *key)
                               ^
>> crypto/fips140-module.c:575:8: error: call to undeclared function 'register_trace_android_vh_sha256'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
                 ^
   crypto/fips140-module.c:575:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:18:1: note: 'trace_android_vh_sha256' declared here
   DECLARE_HOOK(android_vh_sha256,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:16:1: note: expanded from here
   trace_android_vh_sha256
   ^
>> crypto/fips140-module.c:576:8: error: call to undeclared function 'register_trace_android_vh_aes_expandkey'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
                 ^
   crypto/fips140-module.c:576:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:25:1: note: 'trace_android_vh_aes_expandkey' declared here
   DECLARE_HOOK(android_vh_aes_expandkey,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:19:1: note: expanded from here
   trace_android_vh_aes_expandkey
   ^
>> crypto/fips140-module.c:577:8: error: call to undeclared function 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
                 ^
>> crypto/fips140-module.c:578:8: error: call to undeclared function 'register_trace_android_vh_aes_decrypt'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
                 ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/register_trace_android_vh_sha256 +575 crypto/fips140-module.c

   570	
   571	static bool update_fips140_library_routines(void)
   572	{
   573		int ret;
   574	
 > 575		ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
 > 576		      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
 > 577		      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
 > 578		      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
   579	
   580		return ret == 0;
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
