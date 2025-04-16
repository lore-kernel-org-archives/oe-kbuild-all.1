Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250817A2E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792033; cv=none; b=U+DdiIym8Yvxkld6JpAJp8chU3sCJQRA/ESn9Ey8fXn/MYFQs160Lj8QWaud4BFr3FXFYQc/lf97tKTIWjbGrluu7aJPQVcM3S79xDPpHye87nBaGffrPZJxwmVcsRouiA3TZULiXzH2qKrTYzqceVZmIPzfY5HjMR8uL2S9Y2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792033; c=relaxed/simple;
	bh=S6rfnroFHwvnLyCNjFpnVPlTGJjVDG5vzFysAojMGVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NW6hYujw5IWkdZ1FhBaKAirWPYDKOF7y0tZvMrssHwesk3r9MzUoo3JjQMctKaAnwV2ACbcJkF7NMcxrU8UU9AdlepEnjnbzpopL3Dq1pTM1QbxgAbaK8+4futYIoNitBJWjHfNUnsV0mY37ptrGhIlGjJ7KqFKdy31oafZe5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kW7K3BpN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kW7K3BpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744792031; x=1776328031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6rfnroFHwvnLyCNjFpnVPlTGJjVDG5vzFysAojMGVw=;
  b=kW7K3BpNWfqtS1+Lhngq5lMt/4fyNYy9Kdjc8CxrX6yAkoxu/Fnrad0/
   FSp7LWPQi+SM+xw5dfVbIYsDIgS5ndjlG8NsjEKSEucYxOa0cKmtUFbaH
   gRRCsRQHLVOPgXjRBatT7sKSaBSzKU9CyuwxVdBaKU+1h7HaB/d3BGSNd
   4i9g0Heaze8VNkYZavItsWZPBoiEwicGYb6sINkzmHRley8D2NE3Hmssy
   DRUTWv22ojrzoIyJBDQyo6Ffvq+12o1XfUmUx3GZClk1WJtw6AtuMgBJ4
   xxVBTtBWN3fCUatz154v7lDuKHQeZI0LTErIPBRQPqfxWNdiqBk+q8hqG
   g==;
X-CSE-ConnectionGUID: b4aKIcq0Q/mZVtsh5SxKrA==
X-CSE-MsgGUID: ndJemDW7TVmXdKBhSveQrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71719326"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="71719326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:27:11 -0700
X-CSE-ConnectionGUID: WkSK8ISvQr2ZX4LeU4G8Tg==
X-CSE-MsgGUID: nquSjgIMQcO8etezU6jeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130394236"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2025 01:27:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4y6t-000JKJ-35;
	Wed, 16 Apr 2025 08:27:07 +0000
Date: Wed, 16 Apr 2025 16:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 function 'wakeup_sources_stats_open'
Message-ID: <202504161615.5K3G1jq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0c9b4e9891173f6f40b280656c01d50c2dbf9840
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [0/3] ANDROID: Allow vendor modules to get wakeup sources data.
config: i386-buildonly-randconfig-001-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161615.5K3G1jq0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161615.5K3G1jq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161615.5K3G1jq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for function 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^
   drivers/base/power/wakeup.c:1219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
