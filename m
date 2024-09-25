Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7E156654
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248449; cv=none; b=EwI0IF9ivVLzE5PqaraIJQ5JiPCL0quRmDPM6J1Qob8D3ttqXMcXhy9n/583GPEhqbpXXxgeqV6Wl6pw3y1OHqFTvRl720DlBowpFo/3i7sORe8NdiI/JhigojCJhCHhMtP39ZwPkXb22CjjRYHZ5UbR5hnWRWD7tfGgk6rtyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248449; c=relaxed/simple;
	bh=QtTmbvK9zufRVrbx7SFz0PpG5FevBUH52bd/LpXdtyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFICNh6VqNhxIaIhUDdWajeilQh1lP3HIdQd2J0kR9FBaTdIM9TD6IwkxDlHGurbayTBCyBX9QX8ksGqXo8QPJemjLRTyNunLw9/cC7F/eESpbCd86dcy2VmJGBYYIgMPotz3UwPD6CrQ8xWVbvbcyk17qRCNqgZwJFlUHX89M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBEQRaO9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBEQRaO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727248447; x=1758784447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtTmbvK9zufRVrbx7SFz0PpG5FevBUH52bd/LpXdtyk=;
  b=JBEQRaO9GxfKITGDzUVIIZmKF1QdiZptSeaOnqmvy3K1hEn7BAbBGQIl
   lcSMKkypzvFKC0O6RgeFisyJ/890cVDGR+QfU4wOAXXdGw1ftT0nyjte9
   Sfhdj1uExugH5btLV2hNDqzfgrQ7i78sF/ykIhcTbX6GbPet0+oNQnBAv
   XWoIy5J6OD34VV21irIRqF59fWwI2E2sWSQqq5bmYMrYYJ78TXN+ZMPlZ
   z8Kav3DLECe5Cu1x0wf6twDC4gCdphlCoW+QurBFjyII+phvjUz1EJbKI
   x8ecFau9XJx5p9dOg9oc3QfPuuYFeAONJOeEjM4kymiQ+G7ixXaEYR+fF
   A==;
X-CSE-ConnectionGUID: y6UswY5LSY+OrWFMfehckg==
X-CSE-MsgGUID: dmV1wwdKRwiyC7Xwf3NjtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25790494"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="25790494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 00:14:06 -0700
X-CSE-ConnectionGUID: /BzSzBg2TIuh8Z0rOAP2Yw==
X-CSE-MsgGUID: IATjMOBsTwGukXSCzKnRcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="72136307"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2024 00:14:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stMDq-000JIT-36;
	Wed, 25 Sep 2024 07:14:02 +0000
Date: Wed, 25 Sep 2024 15:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/7] ld.lld: error: undefined
 symbol: lockdep_rtnl_is_held
Message-ID: <202409251511.jwmPxCZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4be14b7b159e3904d539f8038959035c58d446b4
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/7] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: i386-buildonly-randconfig-005-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251511.jwmPxCZ0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251511.jwmPxCZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251511.jwmPxCZ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: lockdep_rtnl_is_held
   >>> referenced by net_dim.c
   >>>               lib/dim/net_dim.o:(net_dim_free_irq_moder) in archive vmlinux.a
   >>> referenced by net_dim.c
   >>>               lib/dim/net_dim.o:(net_dim_free_irq_moder) in archive vmlinux.a

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
