Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A071A13635E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834387; cv=none; b=g1Q4u//tBIgVFvIbe7ZFse3xZgEucTt0146HeRLif5BpcwZrLcDi7kqnS6ZansjMrBDzeKO8HkoItbkG5JgJ5tjzWlhfikqZ3NhccoZx/S+n6FjZiGp8oHIYrnPpkXFyR+rfCEwzs3qD8bc05PE1yp1YXR6UlvuCURT/1iKXzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834387; c=relaxed/simple;
	bh=T9H1lj7CAKJtFiI9fskgDqDe8z9VJaCgsuipM0Jt3OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+Pb747Smfqc1sMrfoxYWpMm9BO3gMusMWPD5gUoQ2aYKS3+Q41n7+31Rr+RHTpJVdGwimxrJ/l4+DJgvkDv/BlmK5aeiJgIDPVCb7oxvSt7NSCJkTGryButa2dHigN01leRWfn6A6igiWyNAV7u0ihZrMrQEcYyJWzIFugIQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO+ub7ht; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO+ub7ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747834386; x=1779370386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9H1lj7CAKJtFiI9fskgDqDe8z9VJaCgsuipM0Jt3OI=;
  b=YO+ub7htD8Rkv7uktmPbNyFJGp+U9zu3UrLxbJl4HXJ5kb060MQdDjes
   /c10/Y6MAvI/E+nWQKwvaAtkxCfJdCcUd3Jm1dvSSFwHDJlCgnUKv278z
   gGM0OiBqseDV7bfRa71pq1w+Izx5a62dNZgSF2k3xqqcymPckZTutiQHa
   MJT5Xp6IDNUIvx8B+PLVQUySbm3tkLvyXsKddg9G/d0VZLsPTuBxjyaJA
   XbjBL5mwzMfDPYJ3pizls6OiH+c6puJ7j8UI1IfFEuB8AZrsH+rD0IkmU
   45abGXfAhkwsqD3wItHKe5MjCXqTn9/5fZcDLfHgEfIdErilOD0tLzimS
   w==;
X-CSE-ConnectionGUID: MnbmJjf5T6W2Oqxm9rRESg==
X-CSE-MsgGUID: wHhP5ui9RtqhND7HAtd4xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61152241"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61152241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:33:04 -0700
X-CSE-ConnectionGUID: PngT9VtjSZ+eV4LsVHxh4A==
X-CSE-MsgGUID: 3GVUNDKvSPKc7MfM0v7/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139926017"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2025 06:33:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHjZ7-000OJL-1A;
	Wed, 21 May 2025 13:33:01 +0000
Date: Wed, 21 May 2025 21:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2]
 drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member
 'scan.channels' not described in 'ak8974'
Message-ID: <202505212117.WOA5gg3C-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250521/202505212117.WOA5gg3C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212117.WOA5gg3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212117.WOA5gg3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan' not described in 'ak8974'
>> drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan.channels' not described in 'ak8974'
>> drivers/iio/magnetometer/ak8974.c:192: warning: Function parameter or member 'scan.ts' not described in 'ak8974'


vim +192 drivers/iio/magnetometer/ak8974.c

7c94a8b2ee8cfe Linus Walleij    2016-07-25  162  
7c94a8b2ee8cfe Linus Walleij    2016-07-25  163  /**
7c94a8b2ee8cfe Linus Walleij    2016-07-25  164   * struct ak8974 - state container for the AK8974 driver
7c94a8b2ee8cfe Linus Walleij    2016-07-25  165   * @i2c: parent I2C client
7c94a8b2ee8cfe Linus Walleij    2016-07-25  166   * @orientation: mounting matrix, flipped axis etc
7c94a8b2ee8cfe Linus Walleij    2016-07-25  167   * @map: regmap to access the AK8974 registers over I2C
7c94a8b2ee8cfe Linus Walleij    2016-07-25  168   * @regs: the avdd and dvdd power regulators
7c94a8b2ee8cfe Linus Walleij    2016-07-25  169   * @name: the name of the part
7c94a8b2ee8cfe Linus Walleij    2016-07-25  170   * @variant: the whoami ID value (for selecting code paths)
7c94a8b2ee8cfe Linus Walleij    2016-07-25  171   * @lock: locks the magnetometer for exclusive use during a measurement
7c94a8b2ee8cfe Linus Walleij    2016-07-25  172   * @drdy_irq: uses the DRDY IRQ line
7c94a8b2ee8cfe Linus Walleij    2016-07-25  173   * @drdy_complete: completion for DRDY
7c94a8b2ee8cfe Linus Walleij    2016-07-25  174   * @drdy_active_low: the DRDY IRQ is active low
7c94a8b2ee8cfe Linus Walleij    2016-07-25  175   */
7c94a8b2ee8cfe Linus Walleij    2016-07-25  176  struct ak8974 {
7c94a8b2ee8cfe Linus Walleij    2016-07-25  177  	struct i2c_client *i2c;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  178  	struct iio_mount_matrix orientation;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  179  	struct regmap *map;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  180  	struct regulator_bulk_data regs[2];
7c94a8b2ee8cfe Linus Walleij    2016-07-25  181  	const char *name;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  182  	u8 variant;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  183  	struct mutex lock;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  184  	bool drdy_irq;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  185  	struct completion drdy_complete;
7c94a8b2ee8cfe Linus Walleij    2016-07-25  186  	bool drdy_active_low;
f2117df663af08 Jonathan Cameron 2020-06-07  187  	/* Ensure timestamp is naturally aligned */
f2117df663af08 Jonathan Cameron 2020-06-07  188  	struct {
f2117df663af08 Jonathan Cameron 2020-06-07  189  		__le16 channels[3];
f2117df663af08 Jonathan Cameron 2020-06-07  190  		s64 ts __aligned(8);
f2117df663af08 Jonathan Cameron 2020-06-07  191  	} scan;
7c94a8b2ee8cfe Linus Walleij    2016-07-25 @192  };
7c94a8b2ee8cfe Linus Walleij    2016-07-25  193  

:::::: The code at line 192 was first introduced by commit
:::::: 7c94a8b2ee8cfe915f332575566b4870976ab8f4 iio: magn: add a driver for AK8974

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
