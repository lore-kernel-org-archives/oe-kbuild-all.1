Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8C1640D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVCsu13o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700723853; x=1732259853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PXxc0t+++cE6UP8C+/3s6Jl5Zp1vVRFCGZntxVr4Jk=;
  b=JVCsu13ovtVT05YMPBVx3khXCK6JqH5hLlmTYFYBuzllXViP9kFI7yZW
   U+ic+vPy29eG0KQxhT/JqejG5RSnqNgT3SCTK34iLH3gO0mbWltpnJYCL
   SnXmHMDh6pjpxRV+5M7bZuIDJx6l2qXhKwglAdakWaISYmvgb+B3AGY6h
   nJpaoOmV0ajV0VY+uVuAhgestvqmOBEUyyNd6k/H3/uShzpkHZjbzJkvX
   SYtp8wGJdo8ryGVVN8TilNeOfhRUwTxKUazhqitKbNgtl5gUDA1SlrB2R
   TrVecRmufV/x7Ay9ilQdKdtLb1NQmIeKpH8IrWqK7VPOOVCKwLDanmVhC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456548942"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="456548942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 23:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="743523280"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="743523280"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Nov 2023 23:17:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r63xp-0001Kt-1X;
	Thu, 23 Nov 2023 07:17:29 +0000
Date: Thu, 23 Nov 2023 15:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Jones <rjones@gateworks.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/imu/fxos8700_spi.c:34:36: warning: 'fxos8700_acpi_match'
 defined but not used
Message-ID: <202311231427.vEQAuxvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b6de136b5f0158c60844f85286a593cb70fb364
commit: 84e5ddd5c46ea3bf0cad670da32028994cad5936 iio: imu: Add support for the FXOS8700 IMU
date:   4 years, 1 month ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231123/202311231427.vEQAuxvI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311231427.vEQAuxvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311231427.vEQAuxvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/fxos8700_spi.c:34:36: warning: 'fxos8700_acpi_match' defined but not used [-Wunused-const-variable=]
      34 | static const struct acpi_device_id fxos8700_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/fxos8700_acpi_match +34 drivers/iio/imu/fxos8700_spi.c

    33	
  > 34	static const struct acpi_device_id fxos8700_acpi_match[] = {
    35		{"FXOS8700", 0},
    36		{ }
    37	};
    38	MODULE_DEVICE_TABLE(acpi, fxos8700_acpi_match);
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
