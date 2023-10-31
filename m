Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286233E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3aW8HHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698721666; x=1730257666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJCHsBgnwPjauTxGEpqUXbpt4hllq6mAfM3hmfrrnqM=;
  b=c3aW8HHbya8hfY7M1CYWmbIaQ+ed7YCZuJYWiHoVwBwGCr94a6w4eu+a
   ljJquO7e22oVCUZOHHHbriaA7KZrJwEPdZNo0LpfE13ifkDVDGpiyFpqM
   jBdLBBKYw/6EOwxAofPRGls/zsLb+Xm/tq+oviGlZtfX84Yjl+XJMOCMk
   Axl1yzy89mQYskaDx+gEhX/O82J9qFbTXwap3cmAJQJuMigt1UsNxSTAZ
   DRRVJMaiV0JllAAgRB6GQVtXLOCwTxC/9vghIEQuoVDLueUiGIwcrv/J8
   ztfrTX9iud1X1/CaWhZ1UrG7To7kNPNI6k9C3fZ1SGcyoMQJoLGgd7Wx0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9733071"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="9733071"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764107117"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="764107117"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 20:07:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxf6T-000DmR-2n;
	Tue, 31 Oct 2023 03:07:41 +0000
Date: Tue, 31 Oct 2023 11:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 19890/26269]
 crypto/fips140-module.c:482:15: error: implicit declaration of function
 'register_trace_android_vh_sha256'; did you mean 'trace_android_vh_sha256'?
Message-ID: <202310311036.g2U2EqEs-lkp@intel.com>
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
head:   0772c040aea277e4492dc359e7f9282c7cc3792d
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [19890/26269] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-004-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311036.g2U2EqEs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311036.g2U2EqEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311036.g2U2EqEs-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/fips140-module.c: In function 'update_fips140_library_routines':
>> crypto/fips140-module.c:482:15: error: implicit declaration of function 'register_trace_android_vh_sha256'; did you mean 'trace_android_vh_sha256'? [-Werror=implicit-function-declaration]
     482 |         ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_sha256
>> crypto/fips140-module.c:483:15: error: implicit declaration of function 'register_trace_android_vh_aes_expandkey'; did you mean 'trace_android_vh_aes_expandkey'? [-Werror=implicit-function-declaration]
     483 |               register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_expandkey
>> crypto/fips140-module.c:484:15: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt'; did you mean 'trace_android_vh_aes_encrypt'? [-Werror=implicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_encrypt
>> crypto/fips140-module.c:485:15: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt'; did you mean 'trace_android_vh_aes_decrypt'? [-Werror=implicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_decrypt
   crypto/fips140-module.c: At top level:
   crypto/fips140-module.c:502:1: warning: 'cfi' attribute directive ignored [-Wattributes]
     502 | {
         | ^
   crypto/fips140-module.c:561:1: internal compiler error: Segmentation fault
     561 | module_init(fips140_init);
         | ^~~~~~~~~~~
   0xc6393f crash_signal
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/toplev.cc:314
   0x7cca7b handle_no_sanitize_attribute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c-family/c-attribs.cc:1184
   0x6cfdaa decl_attributes(tree_node**, tree_node*, int, tree_node*)
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/attribs.cc:878
   0x7cbaec handle_copy_attribute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c-family/c-attribs.cc:3024
   0x6cfdaa decl_attributes(tree_node**, tree_node*, int, tree_node*)
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/attribs.cc:878
   0x6e8e5a start_decl(c_declarator*, c_declspecs*, bool, tree_node*, bool, unsigned int*)
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c/c-decl.cc:5467
   0x73c3fb c_parser_declaration_or_fndef
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c/c-parser.cc:2599
   0x744463 c_parser_external_declaration
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c/c-parser.cc:1925
   0x744e93 c_parser_translation_unit
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c/c-parser.cc:1779
   0x744e93 c_parse_file()
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c/c-parser.cc:24635
   0x7b1f91 c_common_parse_file()
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/c-family/c-opts.cc:1248
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +482 crypto/fips140-module.c

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
