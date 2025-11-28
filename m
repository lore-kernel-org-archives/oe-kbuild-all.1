Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0E30595F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323290; cv=none; b=IbIoQo4UDLB/gej8D1kCXPMqgHTKsMtDnd0ddfcjFkT8fHrbiTWYbUDKBUtA9m/5BJ5LeBLH9QFemEbf0bVD08cXRU5bVTNJM5SzrAgj0Qoe/l30iJgFScFjVQHPWamsVCdJXpOcY8O9WbUFm354ORYYcjqFW5jBDpaCbwolh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323290; c=relaxed/simple;
	bh=66XKBQ+XQvza74Jv/9pxICfXo0CdJ2jWjCMXuXOidV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5n593vnjqE93IyuvVfz0cEDcpscPLBvGQ5wL5COIpvgAW/zaQMKfWTQWy3N0hvc6ZaWCR5tOjGBaFmAmXZKvzFN4FLfM+XMwBr3tm41p6FjLvg6LpxvGX+X7gg0/EYxMpBlqhBKrUNVVSUcxyv9bZsCq76z0ziTyolaMN1EqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFUNEICP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFUNEICP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764323289; x=1795859289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66XKBQ+XQvza74Jv/9pxICfXo0CdJ2jWjCMXuXOidV4=;
  b=RFUNEICPWNpq58zNCLb/aTdQaYdeBx9tt5hYrufEDdz4wYWg4J5QOytW
   iLHuMotUToqy+vuSMU84g2W1aV7e1+II/hpWytHZUvXNWj5qs1JBIZR9Z
   wLcKV67N6CJlW3fR0xxRcwHVHuOls25Gu98R1Gv1SD8BE4v1kfNpQHce8
   6zIYKQZFhuNax7hk6RL562v4rRZI9RJL+IkTGFTu/b0hyJGVVT7wo6jfK
   lbJ1JWatXPREdiKENUN12KsW8qWOpNgtVxPCwxAwoPSFb4m/PXLNrnVsC
   MNqByE3K0WR68NSH2cVZwXPfmFz/izBjj1BTXmG0ukRGlcc5A+2ETBH+T
   g==;
X-CSE-ConnectionGUID: jwf5OGV/Sg64nVouj/0IBg==
X-CSE-MsgGUID: zCC3K1JnRIauj+kSXwqwAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66072270"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66072270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:48:09 -0800
X-CSE-ConnectionGUID: DGdDf86PTEO1T9/xYrkNVQ==
X-CSE-MsgGUID: LMpMumqRSt2t4nkkbwnhrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="216774048"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2025 01:48:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOv5B-000000006Fh-0Pag;
	Fri, 28 Nov 2025 09:48:05 +0000
Date: Fri, 28 Nov 2025 17:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-mpfs-mssio.c:302:20:
 error: use of undeclared identifier
 'pinctrl_generic_pins_function_dt_node_to_map'
Message-ID: <202511281744.PfIM0bpi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   1e18058c8e8c6b9ff3310a9e9aa10d95e831cab9
commit: d1b023c3a5107668f367b2bfec08d721e2b2e7dd [21/23] pinctrl: add polarfire soc mssio pinctrl driver
config: um-randconfig-001-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281744.PfIM0bpi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281744.PfIM0bpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281744.PfIM0bpi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-mpfs-mssio.c:9:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:302:20: error: use of undeclared identifier 'pinctrl_generic_pins_function_dt_node_to_map'
     302 |         .dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
>> drivers/pinctrl/pinctrl-generic.c:111:5: warning: no previous prototype for function 'pinctrl_generic_pins_function_dt_node_to_map' [-Wmissing-prototypes]
     111 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   drivers/pinctrl/pinctrl-generic.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     111 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/pinctrl_generic_pins_function_dt_node_to_map +302 drivers/pinctrl/pinctrl-mpfs-mssio.c

   296	
   297	static const struct pinctrl_ops mpfs_pinctrl_ops = {
   298		.get_groups_count = pinctrl_generic_get_group_count,
   299		.get_group_name	= pinctrl_generic_get_group_name,
   300		.get_group_pins	= pinctrl_generic_get_group_pins,
   301		.pin_dbg_show = mpfs_pinctrl_dbg_show,
 > 302		.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
   303		.dt_free_map = pinctrl_utils_free_map,
   304	};
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
