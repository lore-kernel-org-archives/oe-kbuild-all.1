Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779F173
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfu9OBHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701130781; x=1732666781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kyg6/dCZruKR8HeSAjmnRgqxmiW6ETtByNRS1QWMMMI=;
  b=kfu9OBHXwa1XSmTx0bIeT7L8LoDnwx+bvysHDCyuU+CzWjwgtMH1wGK6
   KtTgAhvO8kZPDh9qYPIegI6UhyXYnV/5jwdy0QImH5s/eDIkcqVUXK4ne
   Uiq1p72Wq+fjm/ebThjuXTq32DASkyLTDPtc0LViLvJCVMDueGaoW06lK
   FUqAFH4A0DU4Ld/vzh/8THhedwEIBRGYy9AQdKA0Wt6MMEkKqXkgkqWpj
   k2kaB1krAGiArwqlVLk+LBzOYJ0VfK1uJHmn1EAGzg5wd8kG44TTGxMKF
   cbnmepZhvsWfWbkk7X/llR8aF+rKZrNaMg4Z9bNjiy0V/wFUPm8iW8+/1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14374349"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="14374349"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 16:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941743826"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="941743826"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2023 16:19:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7lpA-0006nr-0A;
	Tue, 28 Nov 2023 00:19:36 +0000
Date: Tue, 28 Nov 2023 08:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/10] crypto/internal.h:66:2: error:
 call to undeclared function 'static_key_enable'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202311280632.ONDg6t2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c57b152c45cd71b48fe9c1ee2f957fc7060830d6
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [9/10] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-004-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280632.ONDg6t2P-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280632.ONDg6t2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280632.ONDg6t2P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/fips140-module.c:36:
>> crypto/internal.h:66:2: error: call to undeclared function 'static_key_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           static_branch_enable(&__crypto_boot_test_finished);
           ^
   include/linux/jump_label.h:540:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   crypto/internal.h:66:2: note: did you mean 'static_key_false'?
   include/linux/jump_label.h:540:35: note: expanded from macro 'static_branch_enable'
   #define static_branch_enable(x)                 static_key_enable(&(x)->key)
                                                   ^
   include/linux/jump_label.h:207:29: note: 'static_key_false' declared here
   static __always_inline bool static_key_false(struct static_key *key)
                               ^
>> crypto/fips140-module.c:482:8: error: call to undeclared function 'register_trace_android_vh_sha256'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
                 ^
   crypto/fips140-module.c:482:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:19:1: note: 'trace_android_vh_sha256' declared here
   DECLARE_HOOK(android_vh_sha256,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:87:1: note: expanded from here
   trace_android_vh_sha256
   ^
>> crypto/fips140-module.c:483:8: error: call to undeclared function 'register_trace_android_vh_aes_expandkey'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
                 ^
   crypto/fips140-module.c:483:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:26:1: note: 'trace_android_vh_aes_expandkey' declared here
   DECLARE_HOOK(android_vh_aes_expandkey,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:571:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:90:1: note: expanded from here
   trace_android_vh_aes_expandkey
   ^
>> crypto/fips140-module.c:484:8: error: call to undeclared function 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
                 ^
>> crypto/fips140-module.c:485:8: error: call to undeclared function 'register_trace_android_vh_aes_decrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
                 ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/static_key_enable +66 crypto/internal.h

5cb1454b862ab3 Herbert Xu   2005-11-05  49  
1e15da5148f593 Eric Biggers 2022-11-13  50  #ifdef CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
1e15da5148f593 Eric Biggers 2022-11-13  51  static inline bool crypto_boot_test_finished(void)
1e15da5148f593 Eric Biggers 2022-11-13  52  {
1e15da5148f593 Eric Biggers 2022-11-13  53  	return true;
1e15da5148f593 Eric Biggers 2022-11-13  54  }
1e15da5148f593 Eric Biggers 2022-11-13  55  static inline void set_crypto_boot_test_finished(void)
1e15da5148f593 Eric Biggers 2022-11-13  56  {
1e15da5148f593 Eric Biggers 2022-11-13  57  }
1e15da5148f593 Eric Biggers 2022-11-13  58  #else
1e15da5148f593 Eric Biggers 2022-11-13  59  DECLARE_STATIC_KEY_FALSE(__crypto_boot_test_finished);
1e15da5148f593 Eric Biggers 2022-11-13  60  static inline bool crypto_boot_test_finished(void)
1e15da5148f593 Eric Biggers 2022-11-13  61  {
1e15da5148f593 Eric Biggers 2022-11-13  62  	return static_branch_likely(&__crypto_boot_test_finished);
1e15da5148f593 Eric Biggers 2022-11-13  63  }
1e15da5148f593 Eric Biggers 2022-11-13  64  static inline void set_crypto_boot_test_finished(void)
1e15da5148f593 Eric Biggers 2022-11-13  65  {
1e15da5148f593 Eric Biggers 2022-11-13 @66  	static_branch_enable(&__crypto_boot_test_finished);
1e15da5148f593 Eric Biggers 2022-11-13  67  }
1e15da5148f593 Eric Biggers 2022-11-13  68  #endif /* !CONFIG_CRYPTO_MANAGER_DISABLE_TESTS */
adad556efcdd42 Herbert Xu   2021-09-17  69  

:::::: The code at line 66 was first introduced by commit
:::::: 1e15da5148f593374a744405efb133a84fe47d01 UPSTREAM: crypto: api - compile out crypto_boot_test_finished when tests disabled

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
