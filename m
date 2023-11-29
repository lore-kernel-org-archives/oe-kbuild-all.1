Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAF111BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9QIGhFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254704; x=1732790704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YT/tuB6ADBxgLlL+s+iLcm4OCBDDkD77otMxAiq1OrE=;
  b=C9QIGhFeAqsS1Os7hoCVmAFB4LVy4uZuBoHButRzLHD/twAWRgOHRjFo
   VobWzVOUU92WuDkUn6zXy5kicBfKFyOvaVYYBsr2z5l+JF5AN9ROwlMB0
   n0q0/ZCySWEeSSCn/lzqJpLNxXv+fSK/t4XJHdZJxkVqMIORSEESBdxOS
   7cq3n3rNjFQ32Ayi/zKm7c1aAOGx61E8l9orR3264MwZyvpylhOOF4npr
   TxiuUurnAe+eBiK0tON4IXQKZKG8pdasR3HJNsCvUsA0/itUBWFFjs5nR
   HMsINQVByv/7njHN/G5hST4DikQxDHIxnrfUT/ou05nqfApMiIp/eUkpv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="29528"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="29528"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834969696"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="834969696"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2023 02:45:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I3w-00006D-0K;
	Wed, 29 Nov 2023 10:45:00 +0000
Date: Wed, 29 Nov 2023 18:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4] ld.lld: error: undefined symbol:
 __per_cpu_start
Message-ID: <202311291512.77vFkQ8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   61ca1246d99e938cf894c2182fdd0a35e329d45b
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: arm-randconfig-003-20231128 (https://download.01.org/0day-ci/archive/20231129/202311291512.77vFkQ8O-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291512.77vFkQ8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291512.77vFkQ8O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __per_cpu_start
   >>> referenced by android_debug_symbols.c
   >>>               drivers/android/android_debug_symbols.o:(ads_entries) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __per_cpu_end
   >>> referenced by android_debug_symbols.c
   >>>               drivers/android/android_debug_symbols.o:(ads_entries) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
