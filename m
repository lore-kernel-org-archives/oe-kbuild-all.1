Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801202DBF66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879583; cv=none; b=sgq4guYjwOEykj1/6KL3oyDS+M8BZQ/smPY3I9suNmFckFWz1KM1fCLYGR1wYXomiT6TIm/mqqvyzsDbQQLu8qpqmgV44P+MFaQfdfY0DacanGsXmwBf+AohUfz1ooJKN/jGqwwhU8U/D5zjqf/6xk7IhUsMMBDoGu6lPIkAFjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879583; c=relaxed/simple;
	bh=yrF3zb2NRHGhBNx16U7x24UD47ot7KwHBRJEFSrGgMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ck6tfNdceH5Wi8Wx5HptsMWxJbjLHIaY4EpIBHtIUzR4/Ezs5HMn0gJfXOeFP3vy9ssfiZQYB1PxrhBw/Pcax1V3bsc3IY5XFl9CxfzIAlkK1aqHZFTxw/DOzGLySBV8Gwgu7paJNouMCi//sEuKWQ/XsIzhGFT5TDbQ5IkcyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiIxJcGz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiIxJcGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750879582; x=1782415582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrF3zb2NRHGhBNx16U7x24UD47ot7KwHBRJEFSrGgMI=;
  b=UiIxJcGzOY79lhAyKbWsH1RjBJph5FMix9wchwyQz4RcEZYl4NjHn7qZ
   ONgCPA9Paf0Zhc0M25WWhTRHHxcA/Rkm50p4SRPAAosK1Cf28KbG/LpUn
   ZtRNoYag9J4SXl6ywsAnSNB8jFCPH1FXs6FucWFSxRzjnJyj7oTcmIZKV
   n+vSMPB/6SSgCD6Rh2UzZCNRXE+alXeZll/wXlAcK+uUPhyyT7P8yIXCu
   ViPyKbEgIL3qIvM0s8lbCHX7JrYLIjTaswq/HQCMHQEdwImnQ1O1PFe2y
   VjDBbYikoaHq4taXgo/rtFwx/PZ2hRdLGkdEzR2yWux7gNtjxGm/wdv8R
   Q==;
X-CSE-ConnectionGUID: z2V7mC89RlW8tkpwR70xNQ==
X-CSE-MsgGUID: RO6At4EfRH2BxdTUCsWqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53259454"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53259454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 12:26:21 -0700
X-CSE-ConnectionGUID: rgOPv5BzR5KusK3ireOmQA==
X-CSE-MsgGUID: 9PjXsdP/Sp6UPqgWVEHa7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="156871489"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2025 12:26:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUVlB-000TQc-1A;
	Wed, 25 Jun 2025 19:26:17 +0000
Date: Thu, 26 Jun 2025 03:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2] crypto/fips140-module.c:482:8:
 error: implicit declaration of function 'register_trace_android_vh_sha256'
Message-ID: <202506260332.6ap969uC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   612eb672b1e96a39fed53ecaa9ab27fc8509d989
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [2/2] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-001-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260332.6ap969uC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260332.6ap969uC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260332.6ap969uC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/fips140-selftests.c:550:
>> crypto/fips140-generated-testvecs.h:14:47: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      14 | static const u8 fips_aes_iv[16] __initconst = "ABCDEFGHIJKLMNOP";
         |                                               ^~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:17:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      17 |         "\x4c\x3e\xeb\x38\x8d\x1f\x28\xfd\xa2\x3b\xa9\xda\x36\xf2\x99\xe2"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |         "\x84\x84\x66\x37\x0a\x53\x68\x2f\x17\x95\x8d\x7f\xca\x5a\x68\x4e";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:21:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      21 |         "\xc1\x9d\xe6\xb8\xb2\x90\xff\xfe\xf2\x77\x18\xb0\x55\xd3\xee\xa9"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |         "\xe2\x6f\x4a\x32\x67\xfd\xb7\xa5\x2f\x4b\x6e\x1a\x86\x2b\x6e\x3a";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:25:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      25 |         "\xed\x06\x2c\xd0\xbc\x48\xd1\x2e\x6a\x4e\x13\xe9\xaa\x17\x40\xca"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      26 |         "\x00\xb4\xaf\x3b\x4f\xee\x73\xd6\x6c\x41\xf6\x4c\x8b\x0d\x6a\x0f";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:28:54: warning: initializer-string for character array is too long, array size is 22 but initializer has size 23 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      28 | static const u8 fips_aes_gcm_assoc[22] __initconst = "associated data string";
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:31:2: warning: initializer-string for character array is too long, array size is 48 but initializer has size 49 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      31 |         "\x37\x88\x3e\x1d\x58\x50\xda\x10\x07\xeb\x52\xdf\xea\x0a\x54\xd4"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |         "\x44\xbf\x88\x2a\xf3\x03\x03\x84\xaf\x8b\x96\xbd\xea\x65\x60\x6f"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      33 |         "\x82\xfa\x51\xf4\x28\xad\x0c\xf1\xce\x0f\x91\xdd\x1a\x4c\x77\x5f";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:39:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      39 |         "\x4f\xf7\x9f\x6c\x00\xa8\x30\xdf\xff\xf3\x25\x9c\xf6\x0b\x1b\xfd"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |         "\x3b\x34\x5e\x67\x7c\xf8\x8b\x68\x9a\xb9\x5a\x89\x51\x51\xbd\x35";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:43:2: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      43 |         "\x0c\x05\xda\x64\x51\x0c\x8e\x6c\x86\x52\x46\xa8\x2d\xb1\xfe\x0f";
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:45:49: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      45 | static const u8 fips_hmac_key[16] __initconst = "128-bit HMAC key";
         |                                                 ^~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:48:2: warning: initializer-string for character array is too long, array size is 20 but initializer has size 21 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      48 |         "\x1b\x78\xc7\x4b\xd5\xd4\x83\xb1\x58\xc5\x96\x83\x4f\x16\x8d\x15"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         "\xb4\xaa\x22\x8c";
         |         ~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:52:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      52 |         "\x4e\x11\x83\x0c\x53\x80\x1e\x5f\x9b\x38\x33\x38\xe8\x74\x43\xb0"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |         "\xc1\x3a\xbe\xbf\x75\xf0\x12\x0f\x21\x33\xf5\x16\x33\xf1\xb0\x81";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:56:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      56 |         "\x63\x0e\xb5\x73\x79\xfc\xaf\x5f\x86\xe3\xaf\xf0\xc8\x36\xef\xd5"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      57 |         "\x35\x8d\x40\x25\x38\xb3\x65\x72\x98\xf3\x59\xd8\x1e\x54\x4c\xa1";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:60:2: warning: initializer-string for character array is too long, array size is 64 but initializer has size 65 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      60 |         "\x32\xe0\x44\x23\xbd\xe3\xec\x28\xbf\xf1\x34\x11\xd5\xae\xbf\xd5"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 |         "\xc0\x8e\xb5\xa1\x04\xef\x2f\x07\x84\xf1\xd9\x83\x0f\x6c\x31\xab"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |         "\xf7\xe7\x57\xfa\xf7\xae\xf0\x6f\xb2\x16\x08\x32\xcf\xc7\xef\x35"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      63 |         "\xb3\x3b\x51\xb9\xfd\xe7\xff\x5e\xb2\x8b\xc6\x79\xe6\x14\x04\xb4";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
--
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
   <scratch space>:139:1: note: expanded from here
     139 | trace_android_vh_sha256
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
   <scratch space>:142:1: note: expanded from here
     142 | trace_android_vh_aes_expandkey
         | ^
>> crypto/fips140-module.c:484:8: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt' [-Werror,-Wimplicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
>> crypto/fips140-module.c:485:8: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt' [-Werror,-Wimplicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/register_trace_android_vh_sha256 +482 crypto/fips140-module.c

2db9143a1b5a70 Ard Biesheuvel 2021-03-23  477  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  478  static bool update_fips140_library_routines(void)
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  479  {
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  480  	int ret;
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  481  
2db9143a1b5a70 Ard Biesheuvel 2021-03-23 @482  	ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
2db9143a1b5a70 Ard Biesheuvel 2021-03-23  483  	      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
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
