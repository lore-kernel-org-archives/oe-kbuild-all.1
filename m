Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268559;
	b=qFL9Je7RLukTNqhfPk67q+tKgbWEjg/tELquaXo4gvEPU4Nh4nBJUqPHCrxZqiN9a30U
	 zAv6gbGkzwUabt1fdpMksyIyOA2wOX1hXGSm0nFY86ePDsh1a12Zfe7ptJpRLleAh6k2k
	 oEAtmY/2fD88xZbXyoyUS+tKf1xLVp5KDa9r1he80yCQZKpMZIashZy86Dc74Jpb1A4dZ
	 A0hINdQV2q8YaUPfBPGXDR+uO/B/eoQjrMl5ds1515h3BMbQ0dvsbp0ANKzCYAOI8HLJ/
	 gggGb2+yTZbZbq3kFgGhVblznSIJvk4rRGpCMzW4z46gQKvxcADO5yuJKgYyOPu7SkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mb5QS8md76HursNl7Hlwn8Zj4WcLaU2/qvqXZZsUK6s=;
	b=oNq69iiQSEvqZ+4/1QgYprGRX3msnzwYa2+c8dYXufHXW4ruVjvib//XENj1IkNk+JnP
	 f28RJXC7vJdKaDpxsOYajWcel7gVqzS4BkOkixJmKCBP0yzjxTSh9shDcD+8s4z3/qR98
	 M7A64elvYMitMjLB+c2S26wZJFLnjYPR8fsdkaxVMvcMIBWBtlmiFMUni4jihOd7AptVn
	 7LG1DAt7I2PYisE5xY5OQmLJ+cp/c9RF9oHZBTHDf+OEV6oqsazZ3OQmrPSXyDX71QR9d
	 iRnZ69NHpjTnvH1UCeNHkSfgvH0mAYmQ1NeKxAKWDTnHUVJzpQcVuDds8FzfNxxcjjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp3nNBWJ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CC606A337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 10:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877CC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp3nNBWJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793268558; x=1824804558;
  h=date:from:to:cc:subject:message-id;
  bh=RnokM0hsYotkP14BbhRFArFE1rrL5udYIqZNh+Oev9Y=;
  b=Jp3nNBWJOALwuTEIC27y5qoU4S1dGiqPl7d6ugQlIgySP4QvvgLUH4eA
   DFHboJXWDfXuAcdsLI3zEYNipAw3Kc938zJx7kdjwgUZK4Y0kxMxOUdWK
   eqvulojGgN3SypgBGz5sUme4EtGg5q1A3mM9+4xnTmAhA6+Pcc9Qb5D8q
   EDoA45NtRpJZWI4yJt5+isboVxWfRR/eVZUCKZW/rXtGP7TGma3cs6Qlj
   2DOWcAFGRpcTfMajOZfsr5hPKi6OpxpVwURdkadBBy0EWMd+rTwp939H3
   CyF7uuwZWZiH+Dknpj36C832j+DYC6swtAfKgnoxqeGlc8mSyPaTjnU6i
   g==;
X-CSE-ConnectionGUID: HzRyfMXzTCCYUkPsigwWpA==
X-CSE-MsgGUID: c34z3dZyQo2Vhffewf6qqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2011274"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2011274"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 03:09:17 -0700
X-CSE-ConnectionGUID: ti0JbxTQRnuQroHx/IQ2Fw==
X-CSE-MsgGUID: lnNSfd8SROm3aOjt2qrzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4982805"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 03:09:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMN4I-000000005DL-3yfG;
	Thu, 29 Oct 2026 10:09:10 +0000
Date: Thu, 29 Oct 2026 11:08:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 include/linux/pgtable.h:8:20: error: 'PMD_SHIFT' undeclared; did you mean
 'PUD_SHIFT'?
Message-ID: <202610291108.SJnw2kl5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   bc98d35a57962e5876c2021937cd8356f3d011f4
commit: 0cc6f52b2aab23f59b9b92188194b0847105ceee [1/1] Merge 0bcb517f0a70 ("Merge tag 'mm-hotfixes-stable-2026-03-28-10-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-r2304-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291108.SJnw2kl5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291108.SJnw2kl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291108.SJnw2kl5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:32,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-buf.h:19,
                    from drivers/gpu/drm/drm_gem_shmem_helper.c:6:
   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_any_fault':
>> include/linux/pgtable.h:8:20: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: note: in expansion of macro 'PMD_ORDER'
     if (order && order != PMD_ORDER)
                           ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: each undeclared identifier is reported only once for each function it appears in
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: note: in expansion of macro 'PMD_ORDER'
     if (order && order != PMD_ORDER)
                           ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]


vim +8 include/linux/pgtable.h

f25748e3c34eb8b include/asm-generic/pgtable.h Dan Williams            2016-01-15   7  
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  @8) #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18   9) #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  10) 

:::::: The code at line 8 was first introduced by commit
:::::: 051ddcfeb1bdbae45e660c0db2468d29ca15c6c2 mm: move PMD_ORDER to pgtable.h

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
