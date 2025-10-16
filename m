Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF422068F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760644256; cv=none; b=Y55rPuTgfVSBynKF/8hqxqwLEChZBrH8gL9FkIBmxh+kTupqicf7+4pcJJoCw0dSAX6N4V4XUIDdhEeiqvf8QSFheT5aaJ8W6XG0v40G7vGcOlP6tLyGyVbBEYZf8ml7AkuwOikSMqby1UHkCkM1CGedYcfYq+TUIDBC9oHybrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760644256; c=relaxed/simple;
	bh=RS+t6YGgDPGH0QrJikpuL0YqHttAKS08N3658tleLhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIElf/Sd14FweNVhL51IFBMWL8G9RodkID+r5mSzivWVdyiZjIr4B5qmzCKnPBTPsl2d0vNK7bvUFIFuu/EyrOIhUJRw1oeEi0kMEEfJs5TSmf4DmP/RotYii9F9x4PNqtMFBJvWgD+PS0a+3KAKsDYWnxwC12qBDj49xdVjBEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdII5gRA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdII5gRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760644255; x=1792180255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS+t6YGgDPGH0QrJikpuL0YqHttAKS08N3658tleLhw=;
  b=MdII5gRAPYIsVgxbve2ZzamexQAZKas2dLC9Wk9DmKtkhcd4NkfCO4Jc
   m3knIQ6mHaC3TWID5HVybAHg7SplIgr4CIspHkOrH609UqwgZJ8WevAM+
   UTWBNwUbcrQNb93yOlCZkn8DMKrfAh+3A5b0KXf6+/b1ExC0QkqA7xZEL
   tHNLkJLnalv1/ZAEOIDfo5FTKrEwTtignCYUOnSKM5XObR0mBElOlq4n/
   FCedf6yWEdIoXePjECstO71jybh5iwA44Hbrr2EEV2nVxdFMLPK4I3vHf
   UwVmFKFoObyUw+jXZE2imAbd6BLq5tlYDiRIp3rFzpSTJ7QcReSwEBFbc
   w==;
X-CSE-ConnectionGUID: IUfhC73DQIS5qRrk4eEadQ==
X-CSE-MsgGUID: /TI1y4NvTz2nODHLNAgu+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62945676"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62945676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:50:54 -0700
X-CSE-ConnectionGUID: xRONJ1hoQFyq/QQF3OAmEg==
X-CSE-MsgGUID: 01T0xB3USC+zJIsevlUfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182478169"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2025 12:50:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9TzZ-0005C7-38;
	Thu, 16 Oct 2025 19:50:31 +0000
Date: Fri, 17 Oct 2025 03:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-07 4/4]
 crypto/fips140-module.c:482:8: error: implicit declaration of function
 'register_trace_android_vh_sha256'
Message-ID: <202510170330.oa16ixWW-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-07
head:   64f9c442f2da497a5771ed13325c0c7fe99eca39
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [4/4] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-004-20251016 (https://download.01.org/0day-ci/archive/20251017/202510170330.oa16ixWW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170330.oa16ixWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170330.oa16ixWW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:366:9: note: previous definition is here
     366 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
   <scratch space>:185:1: note: expanded from here
     185 | trace_android_vh_sha256
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
   <scratch space>:188:1: note: expanded from here
     188 | trace_android_vh_aes_expandkey
         | ^
>> crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   1 warning and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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


vim +/register_trace_android_vh_sha256 +482 crypto/fips140-module.c

2db9143a1b5a70 Ard Biesheuvel 2021-03-23  477  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  478  static bool update_fips140_library_routines(void)
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  479  {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  480  	int ret;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  481  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @482  	ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @483  	      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @484  	      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @485  	      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  486  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  487  	return ret == 0;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  488  }
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  489  

:::::: The code at line 482 was first introduced by commit
:::::: 2db9143a1b5a70edaa69a5e1b12acfef490c6d38 ANDROID: fips140: add kernel crypto module

:::::: TO: Ard Biesheuvel <ardb@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
