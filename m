Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556D4643A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 23:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714692310; cv=none; b=MsJv8f2w/LDE96L/Mnj8xXfSm04ZJHwvGtJpoomjn36ynA/Hk/9nmmNVRLrMijBSNrQrVFEGmrtVmlzaXsi7BI+nDARG1PvSqxc/IIxxLQ1rFvu9nN3MBMME6V43XifBvvs2H0zOyCMY4sjZsSsOOIK0yhcUwVVKzmC2jSFMeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714692310; c=relaxed/simple;
	bh=Ma7egQ84TFdNT7Zd2F8AB185QkRKM9l7AMN01x2twjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBY/9AJ5kTkux/3pjiLNPHLoEkq5UIFABpEtkZpif3xJnI3snTA1H6h4/hLYgqF79Akm1EzwuxT/jcjkqO9yY34tq3VuooFaMMfb5Kk6ra1x1ef0wzGObzuqQC44xL/XLL+brZF7Bzs3+DwUh3P3YNK+tRSg51JEmY4zVv9/8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHutBBVV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHutBBVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714692309; x=1746228309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ma7egQ84TFdNT7Zd2F8AB185QkRKM9l7AMN01x2twjU=;
  b=FHutBBVVO/twYFjzkCbMKLPiN+CFJvP+HeXaf5d6biRWmcTAOSSomr7K
   sZue32cNJgFxO19SomWaQfy/bbgrjlAW9HZ1+HXYpqtPjH71bLXo/tY/a
   75zJDFP+B0UskVRQsLO7KcMOVIft7tQCIaBfri582Wys3ZWRizeLiTxJO
   pTST4a/mNrJbj2I3fwgxCAt3Hyhu3FWYKdeJHXE8KE+BsvnT1wZLC2OU7
   f4JBzOq5w7WPY9jjObq2p8W4pmi7rcUi8uxaoCJIXgrw68OJi7myCDJFU
   qT8sEh4vJQ8Y3VMnoLYf5vALH3ZjBzEX9SlKDwEgMWztsVwuOy+tuDZSs
   g==;
X-CSE-ConnectionGUID: cuTL/EpSTaOlS0oWzRHdEw==
X-CSE-MsgGUID: XnHMY/qzQ5Wnj9GcnTKQ5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10652636"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10652636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 16:25:07 -0700
X-CSE-ConnectionGUID: qRPii7LtSNWqXtRM9BwcsA==
X-CSE-MsgGUID: TErJkAnuQ32qf7wfg4yWyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31955337"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 May 2024 16:25:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2fnS-000B8S-36;
	Thu, 02 May 2024 23:25:02 +0000
Date: Fri, 3 May 2024 07:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>
Subject: [linux-next:master 6160/10463] ad9739a.c:undefined reference to
 `__spi_register_driver'
Message-ID: <202405030706.7EBRJDrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
commit: e77603d5468b9093c111a998a86604e21a9e7f48 [6160/10463] iio: dac: support the ad9739a RF DAC
config: nios2-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240503/202405030706.7EBRJDrD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030706.7EBRJDrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030706.7EBRJDrD-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_read':
>> regmap-spi.c:(.text+0x1a8): undefined reference to `spi_write_then_read'
>> regmap-spi.c:(.text+0x1a8): relocation truncated to fit: R_NIOS2_CALL26 against `spi_write_then_read'
   nios2-linux-ld: drivers/base/regmap/regmap-spi.o: in function `spi_sync_transfer.constprop.0':
>> regmap-spi.c:(.text+0x330): undefined reference to `spi_sync'
>> regmap-spi.c:(.text+0x330): relocation truncated to fit: R_NIOS2_CALL26 against `spi_sync'
   nios2-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_gather_write':
   regmap-spi.c:(.text+0x4c0): undefined reference to `spi_sync'
   regmap-spi.c:(.text+0x4c0): relocation truncated to fit: R_NIOS2_CALL26 against `spi_sync'
   nios2-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_async_write':
>> regmap-spi.c:(.text+0x598): undefined reference to `spi_async'
>> regmap-spi.c:(.text+0x598): relocation truncated to fit: R_NIOS2_CALL26 against `spi_async'
   nios2-linux-ld: drivers/iio/dac/ad9739a.o: in function `ad9739a_driver_init':
>> ad9739a.c:(.init.text+0x14): undefined reference to `__spi_register_driver'
>> ad9739a.c:(.init.text+0x14): relocation truncated to fit: R_NIOS2_CALL26 against `__spi_register_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
