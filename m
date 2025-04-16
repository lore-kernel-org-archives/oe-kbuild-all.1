Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB41E5B7D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 04:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779400; cv=none; b=p7/hZOBr00IYoToW8r9PdPjjHUEh6hm4I9GOx92KxaA3iT0yDGc3HQu9xAch/COmHgCkN+frOJwAVU6y8xzlE+yP7ISkYm3iR6JFxM9voxmi/Gj+oa2GcRWHdLL0O+7Z2hp2qG4dr6IcJgvBtHeQQLZtJDiLdz4CIFp7q5zXLFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779400; c=relaxed/simple;
	bh=IThipFhB3U+nEnWVcPHbxN8QKC11Tp92vlZ/aJvEj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WI1PTPo6ijggF9VNUqcpSXN7P4yhrP9vvBtFxWpedDS/xED8DTwnu0Zhi96R5RImbfQkx0RKT7i37wrhhE86b571oUTTray1s/i4t0m9BsVDYfGbfULWSRccG92SLHybAtjOlq7QEde+KveGm8utTZ1AXjyfcnC/lgh1Dfmc3UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvMESrIz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvMESrIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744779399; x=1776315399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IThipFhB3U+nEnWVcPHbxN8QKC11Tp92vlZ/aJvEj+U=;
  b=MvMESrIz8PaP0l49THI5l5b558oNvN2oapdlRCCSBn9SMb7/mT4Xj+tK
   QKrNyGaTT9pvV249mNFwo2je+Z9bNcMcG2J922g6+PKCD5kHVFeT3OC/O
   kcpL7TvWp95cf21VgjoHm8yFNCd/mSd52qO/mP0CIk4JmLs+sZanzyIoo
   GFd5d4QHXqwiF7ubvc51uprhgWa7JGcrehZF8yu/FY4YeSDYx8uPr1OEm
   iv48BBhhuGuiXogxVRenEsqiLSpOgj7ImDKGKlW+5ug5vNN+J2AlcVgjg
   qrKZwd8tUAnV0QKGUxrjOCdHqcfLQq4E2M6kEi4fhhChYd4QCCZYbSkpV
   A==;
X-CSE-ConnectionGUID: xMZFoVofT3y6eZH4bOES7Q==
X-CSE-MsgGUID: MTTkElTaTbKJAGDeP8DXog==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50110416"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50110416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 21:56:38 -0700
X-CSE-ConnectionGUID: c5BDxn+jRmm/ZWELqTga8Q==
X-CSE-MsgGUID: 7hvek0g1RyK+NcQcx6x4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="161361089"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2025 21:56:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4up8-000Ivc-31;
	Wed, 16 Apr 2025 04:56:34 +0000
Date: Wed, 16 Apr 2025 12:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2]
 drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member
 'scan.channels' not described in 'ak8974'
Message-ID: <202504161246.vUiVXL1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: f2117df663af08bac57d44a1816429f6e9d723f4 [0/2] iio:magnetometer:ak8974: Fix alignment and data leak issues
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250416/202504161246.vUiVXL1K-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161246.vUiVXL1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161246.vUiVXL1K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan' not described in 'ak8974'
>> drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan.channels' not described in 'ak8974'
>> drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan.ts' not described in 'ak8974'


vim +192 drivers/iio/magnetometer/ak8974.c

7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  162  
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  163  /**
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  164   * struct ak8974 - state container for the AK8974 driver
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  165   * @i2c: parent I2C client
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  166   * @orientation: mounting matrix, flipped axis etc
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  167   * @map: regmap to access the AK8974 registers over I2C
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  168   * @regs: the avdd and dvdd power regulators
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  169   * @name: the name of the part
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  170   * @variant: the whoami ID value (for selecting code paths)
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  171   * @lock: locks the magnetometer for exclusive use during a measurement
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  172   * @drdy_irq: uses the DRDY IRQ line
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  173   * @drdy_complete: completion for DRDY
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  174   * @drdy_active_low: the DRDY IRQ is active low
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  175   */
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  176  struct ak8974 {
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  177  	struct i2c_client *i2c;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  178  	struct iio_mount_matrix orientation;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  179  	struct regmap *map;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  180  	struct regulator_bulk_data regs[2];
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  181  	const char *name;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  182  	u8 variant;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  183  	struct mutex lock;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  184  	bool drdy_irq;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  185  	struct completion drdy_complete;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  186  	bool drdy_active_low;
f2117df663af08b Jonathan Cameron 2020-06-07  187  	/* Ensure timestamp is naturally aligned */
f2117df663af08b Jonathan Cameron 2020-06-07  188  	struct {
f2117df663af08b Jonathan Cameron 2020-06-07  189  		__le16 channels[3];
f2117df663af08b Jonathan Cameron 2020-06-07  190  		s64 ts __aligned(8);
f2117df663af08b Jonathan Cameron 2020-06-07  191  	} scan;
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25 @192  };
7c94a8b2ee8cfe9 Linus Walleij    2016-07-25  193  

:::::: The code at line 192 was first introduced by commit
:::::: 7c94a8b2ee8cfe915f332575566b4870976ab8f4 iio: magn: add a driver for AK8974

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
