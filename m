Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0B1459FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769298944; cv=none; b=nVKcgsl7/rZ19pU0WPnBxtGDcN5lVz7Z69unCmCI6k+zzc43sFQOoBVvrbDLG/bkktFn6Qo46HMhx6vi34/FoO7HHp6mDIQOpsiHNqcDJTfsC80t2I8abgtPcQo0FQk2Ksf8UG60KApyVyPpIPSUx5W4gpDNttx+mO69AVPYj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769298944; c=relaxed/simple;
	bh=DsIdU4WQkc+e6Zj4WZ5+fxwCrJ00W/AwFZCszbj5/00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VCE+MfklkHRddv5qQJXB9d01RFHlD5iVzYVrYI7k/jpq2vO3TxmAD/jrMC2eW6025pYdHSyQ2XLgGkKH1vG58KEPrDMa/UXJRmi9g3eGnBd0T6kpLCIWk8UL2k/c5yurdgDQ8KUk4rXq9QhDPN8pB+UG1FjixZClZuo9fJl68Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEVeIXUU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEVeIXUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769298942; x=1800834942;
  h=date:from:to:cc:subject:message-id;
  bh=DsIdU4WQkc+e6Zj4WZ5+fxwCrJ00W/AwFZCszbj5/00=;
  b=hEVeIXUUJlVQJpnr2uZEYNcMUPcpQkinfacyLzDSk0N0tXikA2HTgNUs
   JTCENcCWmQl97kSwl5Ndm43tI9oW5VOi8WiyI7sm4YHUuaX/4+neGEy7e
   Wt5jNWt7YmCjxsam3LXQrnFkqco9+dZF9sTPZjaQHnTBA6U2qYvdEd9Kf
   wkPn50IGaZh9erAjzPjEyY+mrTJCLFvJIkEheXWhcsNe8sreM7BTcMVhg
   5dtM6MaMZhPoItmzNdMbqSUaN6NSDGWqz8K4M3tsUhKxSQC/0KfKTx7NN
   IEIIbJk5VHJwtjb8v1Ew5WkiQy6zXRzRqCZq2suwgwkmTiz6V/ArkzSVS
   w==;
X-CSE-ConnectionGUID: FlaUF4ufR76rap+E/QwWkw==
X-CSE-MsgGUID: sBjboXgWS1GeEN4tdpqQaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70423084"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70423084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 15:55:41 -0800
X-CSE-ConnectionGUID: Ur/l8Ko8QOSAfZzZ2eXyFQ==
X-CSE-MsgGUID: F2olGwRRSnudiA3d95NuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="206943617"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2026 15:55:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjnTd-00000000Vcc-1zyp;
	Sat, 24 Jan 2026 23:55:37 +0000
Date: Sun, 25 Jan 2026 07:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:pic64gx-6.17 23/39]
 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:89:2: error: initializer
 element is not a compile-time constant
Message-ID: <202601250745.xHh8le3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Conor,

First bad commit (maybe != root cause):

tree:   https://github.com/esmil/linux pic64gx-6.17
head:   3f5721f67fb351e261bf172ff238d77197a0be05
commit: 1c3245a86de81b098714e611777add8d019cf70f [23/39] pinctrl: move microchip riscv pinctrl drivers to a folder
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260125/202601250745.xHh8le3c-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250745.xHh8le3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250745.xHh8le3c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
           MPFS_IOMUX0_GROUP(spi0),
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
           .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +89 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c

5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   87  
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   88  static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  @89  	MPFS_IOMUX0_GROUP(spi0),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   90  	MPFS_IOMUX0_GROUP(spi1),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   91  	MPFS_IOMUX0_GROUP(i2c0),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   92  	MPFS_IOMUX0_GROUP(i2c1),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   93  	MPFS_IOMUX0_GROUP(can0),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   94  	MPFS_IOMUX0_GROUP(can1),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   95  	MPFS_IOMUX0_GROUP(qspi),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   96  	MPFS_IOMUX0_GROUP(uart0),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   97  	MPFS_IOMUX0_GROUP(uart1),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   98  	MPFS_IOMUX0_GROUP(uart2),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23   99  	MPFS_IOMUX0_GROUP(uart3),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  100  	MPFS_IOMUX0_GROUP(uart4),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  101  	MPFS_IOMUX0_GROUP(mdio0),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  102  	MPFS_IOMUX0_GROUP(mdio1),
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  103  };
5862273cd45421 drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  104  

:::::: The code at line 89 was first introduced by commit
:::::: 5862273cd45421c2c40b7fadafbedc4ad515ccb2 pinctrl: add polarfire soc iomux0 pinmux driver

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
