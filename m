Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3B73451
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235064; cv=none; b=FW3TGw26dmabsE5op13EFFWW70b+3KOGUQx0V8qpZoaFLRbw0ufUdbdngkKvjil5eI0GnQ0t7KgUVhK/7zsh0s+u4BmNrGPI+XG+H1RgGaYiFJZqyNS/P35g1X4Y9B8HtMXd/qO95lmDltUvu+blF8kez3lt2Q+j4rhmqrXi3PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235064; c=relaxed/simple;
	bh=yO+OM6oikunatpBPcAmulE84Wy9jxtkd9CcJBHbSj8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+UFjKFR1u/Il5zwyPGmyNUcSMo1kh/OWK9LvFMSNhpKfh+1YtSz4bSQFSG2+33TYKvCtQuMRAP6z4QgakhgU8Hy56TxrJkbYC7gHOAu4jNUxP/VKPC6oyun8/3z0BrjeHGg7arFB4emrcoKIhfS0+5f6RTteJcPkJt80Utka1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EquH9HV2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EquH9HV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760235062; x=1791771062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yO+OM6oikunatpBPcAmulE84Wy9jxtkd9CcJBHbSj8w=;
  b=EquH9HV2W/ZcqhA6gqoR+atidM2LcjX0I3diNWwHWLLGuLV9cLFI6n5E
   FgQ2wkmhv6LRRt/sHzFQlNYx11Tq18cDtrkfJsZHqmQpq18DRkHvT7uFD
   tUVWm6ZcAL7c+zLvhpzy80WCXOZqJS2q4ODM18vvv052EDO9NoaBxEROn
   ztrxLZyA3stKkYbgaIqQreup+iGZS1GVt1wO+qm/WriYrUNIuQRRyRfwb
   tOLD/UrFyblXC34MBqAL7BLJjUABuGINeCjFpbZSY/TnaMrmQN1+u9RUo
   rRJLvhltyV0llh1HgN8rO+Ppvr7/BLIYuomyZgrWbMF5DRxG/73P8oTcz
   A==;
X-CSE-ConnectionGUID: CD+3pQ8IRmSpxELGPPjtYw==
X-CSE-MsgGUID: SkDibQk1TH67hEwDD/eeAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79852638"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="79852638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 19:11:00 -0700
X-CSE-ConnectionGUID: YqtGDBOhS724wBBTa3H8yw==
X-CSE-MsgGUID: CPLLUDvjT76KPN529ahucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="180972209"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2025 19:10:59 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7lY0-00048P-2Q;
	Sun, 12 Oct 2025 02:10:56 +0000
Date: Sun, 12 Oct 2025 10:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 11/18] drivers/pinctrl/pinctrl-mpfs-iomux0.c:97:2:
 error: initializer element is not a compile-time constant
Message-ID: <202510121052.u70F9XJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   2667f57d9c48ccf9fe4d56c99191677bfabd8dc5
commit: 34b12d772119c994a5acde95e6b5767b37c8666b [11/18] pinctrl: add polarfire soc iomux0 pinmux driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251012/202510121052.u70F9XJX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121052.u70F9XJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121052.u70F9XJX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-mpfs-iomux0.c:97:2: error: initializer element is not a compile-time constant
           MPFS_IOMUX0_GROUP(spi0),
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-iomux0.c:87:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
           .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +97 drivers/pinctrl/pinctrl-mpfs-iomux0.c

    95	
    96	static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
  > 97		MPFS_IOMUX0_GROUP(spi0),
    98		MPFS_IOMUX0_GROUP(spi1),
    99		MPFS_IOMUX0_GROUP(i2c0),
   100		MPFS_IOMUX0_GROUP(i2c1),
   101		MPFS_IOMUX0_GROUP(can0),
   102		MPFS_IOMUX0_GROUP(can1),
   103		MPFS_IOMUX0_GROUP(qspi),
   104		MPFS_IOMUX0_GROUP(uart0),
   105		MPFS_IOMUX0_GROUP(uart1),
   106		MPFS_IOMUX0_GROUP(uart2),
   107		MPFS_IOMUX0_GROUP(uart3),
   108		MPFS_IOMUX0_GROUP(uart4),
   109		MPFS_IOMUX0_GROUP(mdio0),
   110		MPFS_IOMUX0_GROUP(mdio1),
   111	};
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
