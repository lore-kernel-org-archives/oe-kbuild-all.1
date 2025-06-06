Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA4F125DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250358; cv=none; b=T3PgPFddEUWxt61BeGqSD/u/WuCgQpYM23MZ18bvUmwXFRsLwW+iTgpNnNHseUhXCAlViiERIjqz7lB65YOPfCAbYuKKvHGf3bhTt6TTxj9PAZ0JaMutNaBT2h4/uQV2I+LLLSoAWzasTld5ph+SADdE6YTvSXNYi9q0FassNdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250358; c=relaxed/simple;
	bh=KOzEnIna62/K86BWj0kVTvADQVL8XiABVRzHxlkTkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiBmnlahFwwt8SPR7p3Z/5gEe0x8a8Cua9XtiLzpA6XvHBDPIkuTW0yQ1zuzL+mO33xraXMS7jjSA8Oc1TN1YngvaF54NBasA9tX1gyf05cYP3PvT+MoCaKfIDNR+QaDxswY6l3GcWl25eHuoUPzzkEcqOnu92eajWUKSZzu77w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOr6qonH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOr6qonH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749250356; x=1780786356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOzEnIna62/K86BWj0kVTvADQVL8XiABVRzHxlkTkVI=;
  b=JOr6qonH0ESkN3eyuLLNyyCiKScittvXmsC7fNtMJmOoSyU5hMeaD0HQ
   eLOIObwVU3t9Vina5JyhfjdDDUIbNq4dxNVhWMNlNRIu67G1vvFe7moaW
   Un2+C2YfrgPDZAWjW2sTmmRCUcCot/PqUp0kJQCB8nvdk6LGWbsKlIzC3
   OGEnsR3zuSxn5eLv4SbDpcwwwu/HEcKuyiwqvrHni6KpoHU5NdZ0E/KhZ
   QXU8v1ZEITEBnvg1ghMZMX3XuYRJpN18QBUNglzt2NugcCnzNfP+8gbBW
   Fyi55q6YD0HDzSpX/JzWmFCjv3wlsQpClRAgm+U8i3ENxbqSKRDG5cJpw
   g==;
X-CSE-ConnectionGUID: VixaUrvLTx6p02c6sdHYsQ==
X-CSE-MsgGUID: pI5F4WNITfm0Zh8sgy31zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73939291"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="73939291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 15:52:36 -0700
X-CSE-ConnectionGUID: 0ljc/QBORmWumLl1Ad2HgA==
X-CSE-MsgGUID: 6CPNK2zUSkqeBPlsBNsjsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="169138493"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jun 2025 15:52:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNfvM-0005K9-2d;
	Fri, 06 Jun 2025 22:52:32 +0000
Date: Sat, 7 Jun 2025 06:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-04 1/1]
 crypto/fips140-module.c:577:8: error: call to undeclared function
 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202506070652.h8OvA7Rm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-04
head:   ae950bc89347a3e34598894d6baf7f5656214cc5
commit: 8a99ad0b72e2f0a56d72221a9a20f4f261dfa3c7 [1/1] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070652.h8OvA7Rm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070652.h8OvA7Rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070652.h8OvA7Rm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/fips140-module.c:37:
   In file included from crypto/internal.h:21:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2222:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/fips140-module.c:37:
   crypto/internal.h:85:2: error: call to undeclared function 'static_key_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |         static_branch_enable(&__crypto_boot_test_finished);
         |         ^
   include/linux/jump_label.h:553:35: note: expanded from macro 'static_branch_enable'
     553 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                 ^
   crypto/internal.h:85:2: note: did you mean 'static_key_false'?
   include/linux/jump_label.h:553:35: note: expanded from macro 'static_branch_enable'
     553 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                 ^
   include/linux/jump_label.h:207:29: note: 'static_key_false' declared here
     207 | static __always_inline bool static_key_false(struct static_key *key)
         |                             ^
   crypto/fips140-module.c:575:8: error: call to undeclared function 'register_trace_android_vh_sha256'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     575 |         ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
         |               ^
   crypto/fips140-module.c:575:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:18:1: note: 'trace_android_vh_sha256' declared here
      18 | DECLARE_HOOK(android_vh_sha256,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     584 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:134:1: note: expanded from here
     134 | trace_android_vh_sha256
         | ^
   crypto/fips140-module.c:576:8: error: call to undeclared function 'register_trace_android_vh_aes_expandkey'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     576 |               register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
         |               ^
   crypto/fips140-module.c:576:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:25:1: note: 'trace_android_vh_aes_expandkey' declared here
      25 | DECLARE_HOOK(android_vh_aes_expandkey,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     584 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:137:1: note: expanded from here
     137 | trace_android_vh_aes_expandkey
         | ^
>> crypto/fips140-module.c:577:8: error: call to undeclared function 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
   crypto/fips140-module.c:578:8: error: call to undeclared function 'register_trace_android_vh_aes_decrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   1 warning and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/register_trace_android_vh_aes_encrypt +577 crypto/fips140-module.c

   570	
   571	static bool update_fips140_library_routines(void)
   572	{
   573		int ret;
   574	
   575		ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
   576		      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
 > 577		      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
   578		      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
   579	
   580		return ret == 0;
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
