Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546031;
	b=G2ulZgFNKWY2V7jna3rwGUEG8sO2zsfnQLYa1bTH7WMaTdgcpvlQDZXCaApG+EQ42ymF
	 u4LCqkXHSeoLVCOSlHVRsdAmWCSNJhxUokxL8WI/8GoiIk0wXdWEja+YFDQG1S4AY755I
	 4Nho+ve1mqXQGL375JjYiiBHTzxQZe5QetTIUom6jqVtXio8Yceezib3v7sHAfPpW+iGM
	 7TTDV1AVryGcVDetJvCcu/i2AaOhwftNgOoyz6jiACkgA0/lEl7nbh52ZcjkFibgK5mrv
	 305bn6UQiliJaAP/NfvJ4Onc2nxs4YtMIjf2EepdouYingJjog5LJE9SwiSBVy24I6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546031;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sg9q+uajc60o5hQnqJFfEnmzGaVhIaOWzATlEvGt9A0=;
	b=GawH2P3HLeu2xAsX+gjeRCfKQ6jbkkzU6g8fqwJNSRxUPQUUquMJHmKVSLJLhm4h8vtQ
	 feOzyl+NLhzWfdaeX/gkgHCJDBRh2n6y6iTxIQg1XUee4qMJZH73GpAyJ0RweThGIV446
	 XdSv2SpITZGmWOThD824OQvALDDWUNtRwdrYQFA1O2mrNxBuFSwyco/4swZMa0t0snVNp
	 kjhG5kw2Rk1tV2gJPqZ7lTyiN/d8Y0C6rA4GxkZ2pFsY4MCNfhi9rdEw43qREFIe3q8kd
	 mN3443KwaMC1cz5nFsSgCMf6l9rpCIA1+/sqUXIT+tkefHjy0Pc8ltFH0V1PTnSdC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQ4fLMtJ;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536EE606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 05:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQ4fLMtJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794546031; x=1826082031;
  h=date:from:to:cc:subject:message-id;
  bh=CnPrNwvwJOf2TuwiCzc3e6z1MKhMrpNDtViYOtIO14A=;
  b=lQ4fLMtJhVz48ZyhT0ys9vLYlr+9/9FAQ9WYNIT/DzbEoKuWBAZRmx+x
   8ClQy8D2QfZ+Yz0wuU44tU69sjgDaO7xNGJ/xcYnL1Be1F9JzUXpzevec
   +8qrYlWwkRjWa8TZKcIthysyoOTw26Iu1ym8/5j+PZCXNdDLQFJyD8elO
   KqM7R1UUR/J72gdbStBMsKRajPsais8rlMGOsGjCBOdYM0Sq8VZ87/ikO
   VMwWSkbHD3dc5tIVPJblI7zPsn2BlmXLrJRrJtfawvCjy8yB6AgzJQtvd
   hN+HZThGb1DHIl2zImoQ/x+wpQngisXHuxqKYr8pEWp4UESalaTVzEYhj
   Q==;
X-CSE-ConnectionGUID: yG5+JPPERfa2cNOSpj6ElQ==
X-CSE-MsgGUID: YzpdqygTSACu4spIunAPjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3441209"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3441209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 21:00:30 -0800
X-CSE-ConnectionGUID: 4MMX04sqQJmZx10FUYTfOA==
X-CSE-MsgGUID: 7bZzJJ39TT2h9wCskD6xrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8682210"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 21:00:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRjOk-0000000016V-0MKF;
	Fri, 13 Nov 2026 05:00:26 +0000
Date: Fri, 13 Nov 2026 06:00:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 39/39]
 ./usr/include/linux/android_fuse.h:7:10: fatal error: stdint.h: No such file
 or directory
Message-ID: <202611130549.2mdMyesJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   4dd306a07b2f456fd70ddaa28f4f65640374f202
commit: 03e893c277ca546cba219fa7f82b93abc0250a7c [39/39] ANDROID: fuse-bpf: Add uapi, BPF_PROG_TYPE_FUSE and CONFIG_FUSE_BPF
config: arm-randconfig-r2108-20261113 (https://download.01.org/0day-ci/archive/20261113/202611130549.2mdMyesJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130549.2mdMyesJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130549.2mdMyesJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/android_fuse.h:7:10: fatal error: stdint.h: No such file or directory
       7 | #include <stdint.h>
         |          ^~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
