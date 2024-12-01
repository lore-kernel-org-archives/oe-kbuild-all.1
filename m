Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A318654
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733040547; cv=none; b=tic3K56jppp9Ep1ARqilkVyXVlCckNjOWopFcNPAFKAOYVv0u8Y3TAqROB5vjMWUKTJ/BSs74QsZ73M9NC524j4cwicMKwQtZPPXmoJuvhGK73v87aaNVk7CL0sRoWIOa/XCrJyrQj8s+wD2N2hmH+dauVBD+AMwviJRaDifS2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733040547; c=relaxed/simple;
	bh=KiOffa7n1Ugx7G2wy+JSVHLsHihgi/1JVOwpg8Mn1fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvrjQfz4jQDuB6m7vWJP5iX3ZjKXh5ACktOG6olQPgEPc9d93Zht16qLKBDRCW79j5di8aurxaqYg+wTTLfUEoOA0iEvpNnwwJ3WRJbnyYNw0fCFyrqopS6AQ//dGYIYevd18ZyLpsB2kEwiAluGARbMzTaGn2RllfgGzEXXfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qa89wkyu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa89wkyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733040545; x=1764576545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KiOffa7n1Ugx7G2wy+JSVHLsHihgi/1JVOwpg8Mn1fA=;
  b=Qa89wkyuM/rgYu7GNqMpkoJ15+Aome9NbE2rqoXfX0/Bun3IJg+BDe/u
   HT3BcTID338MY/xWa73LQo+/p9TPjHq/kOAr7BJR5PITEgOucWDgmsF3A
   gOqwWhUxvexOIqMYEQCxqagTC4TyeZANpaN/y9h7q+YbySvZrh1Z/uSbv
   p/cndGrbyC8x0jsIIyueo4zaRpYZ5uCT68hrhY3M0yTPRw4xDHWMQ+utM
   L4s/zSirDYu4tFNYT/6UbdYFazKUaC6xOKjUokXSjGMHXmo9uAoLahq1P
   6ps+d/UnKduga66WxyzHn3DabTKPBlpQvC31n7Hql3RocO6H82yUJnHQA
   A==;
X-CSE-ConnectionGUID: wgFv/kHdT2WB2wk8cceJOA==
X-CSE-MsgGUID: OH/FoY+yR7Oo4jhBRfMTSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44256272"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44256272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:09:04 -0800
X-CSE-ConnectionGUID: lCBSXL3cQgiTlMk1FYeiUw==
X-CSE-MsgGUID: 27VM055ZQHCsJRFIlk+kHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92630134"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2024 00:09:03 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHf0A-0001Mx-1N;
	Sun, 01 Dec 2024 08:08:32 +0000
Date: Sun, 1 Dec 2024 16:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/gpio/gpio-phytium-platform.c:30:36: warning:
 'phytium_gpio_acpi_match' defined but not used
Message-ID: <202412011639.nWeLS0HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1294/1294] gpio: add phytium gpio driver
config: arm64-randconfig-001-20241114 (https://download.01.org/0day-ci/archive/20241201/202412011639.nWeLS0HH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011639.nWeLS0HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011639.nWeLS0HH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-platform.c:30:36: warning: 'phytium_gpio_acpi_match' defined but not used [-Wunused-const-variable=]
      30 | static const struct acpi_device_id phytium_gpio_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/phytium_gpio_acpi_match +30 drivers/gpio/gpio-phytium-platform.c

    29	
  > 30	static const struct acpi_device_id phytium_gpio_acpi_match[] = {
    31		{ "PHYT0001", 0 },
    32		{ }
    33	};
    34	MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
