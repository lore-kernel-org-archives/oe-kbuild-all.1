Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91C1F4C87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761794475; cv=none; b=QGO2I7thksDoxUXlUuKQfNFoY11RNXyNU5L/9vVKiozMa4hLcrEdGjuQva6M/NXpfYSnrITlhGASSEj4bwdzh1M1xg+EDqeQH54A734QLATphW7iq5I/dPzzAn8Sya8ZD9rNqHZmfhQo5Rfu1ZahTuc2CmkCYcWwSAKa13zH6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761794475; c=relaxed/simple;
	bh=Ljmd0Eby9tkP7JGh3MZOUtci6z/iyeAC6IDwd0BXcuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=du3NHUhPVGkDn1klhRy1dGnduRZg3BkvP53ovimsJsfzIZt6OYRphwSua3phG1XXDFKt+nKclTPFEyM+rpRn8fymAKQx4/tSDXBOPTr9h35JFC3WYOPZUbc35/nMzKs/TlnHcgrtN4X2btWQFcJxijab4EP39frMEGC89nDS+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6JfxLuC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6JfxLuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761794472; x=1793330472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ljmd0Eby9tkP7JGh3MZOUtci6z/iyeAC6IDwd0BXcuo=;
  b=l6JfxLuCc3HjnT2YY5GC3qT8A5CrsGP+XFEbwIfWrjU3Uo9K4kluq3ZG
   lJ86igw1eJJ810Aa4U4nRIDK2eNcW4/iLqy65ddM3320KUd0IJy+Axlxh
   wXU9uLbaVhUIfWFeM9UfOiqEMUYx5CGyIs5+oLIjiOdAv+3TIDFVQka5I
   F5wjVXB1p2yjdos1WEXlNPnuryMV9CrmwT0aDvd7xcG70DMdEHevYU/O1
   n3TRJI/sUDCk/Tp991oRPVbzR0nFtf6jZeebBY+p4jSYRsVn1DAPDZVrP
   URmXQLyW/AwpBFupu71vG6fshj3YOIi1wGOjOhzvNKYAMikLg8DqiNrOs
   A==;
X-CSE-ConnectionGUID: xLxXqBPQTRmq+2Ifd1e5ug==
X-CSE-MsgGUID: 5Jyq6LKwSTGv66CcEoHVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67762812"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67762812"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:21:10 -0700
X-CSE-ConnectionGUID: I3dx+uR4SamZQCNl9vtIfA==
X-CSE-MsgGUID: UGeEXTyZTSmYpiUcL0B6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185718204"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2025 20:21:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJCl-000LPg-1a;
	Thu, 30 Oct 2025 03:20:10 +0000
Date: Thu, 30 Oct 2025 11:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 1/1]
 crypto/fips140-module.c:691:8: error: call to undeclared function
 'register_trace_android_vh_sha256'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510301156.21YQaZCD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   42652f7d325ccc2b09daef4759086a7c1cddfdff
commit: 4084529fba5292734429ed383e66714154919b6b [1/1] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r121-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301156.21YQaZCD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301156.21YQaZCD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301156.21YQaZCD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/fips140-module.c:691:8: error: call to undeclared function 'register_trace_android_vh_sha256'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     691 |         ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
         |               ^
   crypto/fips140-module.c:691:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:18:1: note: 'trace_android_vh_sha256' declared here
      18 | DECLARE_HOOK(android_vh_sha256,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:605:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     605 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:111:1: note: expanded from here
     111 | trace_android_vh_sha256
         | ^
>> crypto/fips140-module.c:692:8: error: call to undeclared function 'register_trace_android_vh_aes_expandkey'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     692 |               register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
         |               ^
   crypto/fips140-module.c:692:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:25:1: note: 'trace_android_vh_aes_expandkey' declared here
      25 | DECLARE_HOOK(android_vh_aes_expandkey,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:605:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     605 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:114:1: note: expanded from here
     114 | trace_android_vh_aes_expandkey
         | ^
   crypto/fips140-module.c:693:8: error: call to undeclared function 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     693 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^
   crypto/fips140-module.c:694:8: error: call to undeclared function 'register_trace_android_vh_aes_decrypt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     694 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


vim +/register_trace_android_vh_sha256 +691 crypto/fips140-module.c

   686	
   687	static bool update_fips140_library_routines(void)
   688	{
   689		int ret;
   690	
 > 691		ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
 > 692		      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
   693		      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
   694		      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
   695	
   696		return ret == 0;
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
