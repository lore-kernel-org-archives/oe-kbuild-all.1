Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6035E1C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879208; cv=none; b=Ls+BX2CEvG5uK8Dt+7R5+PgO8csKhRRsC98GiOOh7N+U5lcPOcqfRjFUNqDBIaoGAHEndcS6EnV/53hee5CkvyJLFgw0traLKySyDe8kHt3Q4hYpt54F0+Z7U5LRUNjPsxFfqBoDoOH53+UD7GnOXTftfJTMNnGIf1Xrcbi1vNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879208; c=relaxed/simple;
	bh=1d3BhW528Eoe/B9BvzB7rpLvQ8Tu9cZqtHPCQWWzBpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRn6GbnxhmJM4wvKYY8l8FtiK2EqamnBQ6sUOC1Kq/e38Y+VdWqUQV3jHBwo7ZXHpAHUIrGRAu5TXtySBbXu1ZXjSCLFUAbQ8lpUGu9YinZAxz+Vj6dXhhCBtVxRF62dc/1Yo11Qvh9O9DwsC341w8Z9gFWctUOejOZKpOjWjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnQ+T+sS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnQ+T+sS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778879206; x=1810415206;
  h=date:from:to:cc:subject:message-id;
  bh=1d3BhW528Eoe/B9BvzB7rpLvQ8Tu9cZqtHPCQWWzBpM=;
  b=ZnQ+T+sSZ8axR9wYo4fRsfNlhYQG3f09I9CpaT9uszmxg+lAccq1Bu1X
   /1npPEyw/VSSVR8l+TeeZgr+E/nWRP6/gXowr936W0rcgoetlDmVParKx
   FH+yLKL5JCwNBFMdTjZgfd34Ad0vr5vBzsRKJRGWA7ZpjQp3aY9mmzsNB
   B3GXJbwsVtvRnayLA2pVCEsmkMhp4OKzpfrjxwSxDJOH986gnvORoEYNZ
   DFMytV84MqTSccWqYQp9k+WO3/f2ihta2m+XeGeKYUqRZF0gX/5E3ojkm
   aYI9fNDvLUMfDfgWn5qwyNXG78XO7XLDB82BFAkn/pN9tmi6lFTO+RRmb
   A==;
X-CSE-ConnectionGUID: v199xvoBR3KYL9W9Itl9Xw==
X-CSE-MsgGUID: lACZ0tplT++Gi7WXJ5QVgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91299966"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="91299966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 14:06:45 -0700
X-CSE-ConnectionGUID: xe2fbcKNTUOMHHCft68z2Q==
X-CSE-MsgGUID: djhJyOZJQveDXIIsw7pgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="234352726"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2026 14:06:43 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNzk1-0000000003t-135m;
	Fri, 15 May 2026 21:06:41 +0000
Date: Sat, 16 May 2026 05:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] phy_package.c:undefined
 reference to `__mdiobus_write'
Message-ID: <202605160418.nf3lIuMJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e4dfefbc266a4306a9ec161fe9f629fdfdf5033d
commit: e720a50b14c5896defc425452f52d3ee1d2de1c5 [1/1] ANDROID: GKI: Select PHY_PACKAGE for vendor modules
config: arm64-randconfig-003-20260515 (https://download.01.org/0day-ci/archive/20260516/202605160418.nf3lIuMJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160418.nf3lIuMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160418.nf3lIuMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phy_package.o: in function `__phy_package_read':
   phy_package.c:(.text+0xe0): undefined reference to `__mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phy_package.o: in function `__phy_package_write':
>> phy_package.c:(.text+0x1ac): undefined reference to `__mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phy_package.o: in function `__phy_package_read_mmd':
   phy_package.c:(.text+0x290): undefined reference to `mmd_phy_read'
   aarch64-linux-ld: drivers/net/phy/phy_package.o: in function `__phy_package_write_mmd':
   phy_package.c:(.text+0x398): undefined reference to `mmd_phy_write'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
