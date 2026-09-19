Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7B45FFD5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812927; cv=none; b=cfPyrQKQRbNZpRNZdTbH5rEUQzz2SKNJl3VskaP2fGnLpAsj0E1ihVzUYuItKU1WfpRV1NnGZ42Dgar3v4sUFXh74zeeDk+GC4xm7bdw55GGoszbppXYIJuUyZbLCEdqoIz9Kle/4XvuoxhE/fJl+dd6zCfxKafyNXHwoUMy/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812927; c=relaxed/simple;
	bh=zBoiNDtauEq0FXWzk9d87sA8wGmJOfJ6nDo28NtLwrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSiwdSUmj9NJph3pxPvdgivlYCLTzOmqXOHUpLRrOIFiKQf2aDHUgUy9amdGISTShQ06m4ezB6BZhG66WV+yITrcwAf9pYYbsBfG4lxPwB5OFg9RfeEmI3EQ/shQaYsqEUrv5WHIEsP4P7DRg5ijAuYiW/cOVpowcrcUc+70C5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4qO9pHd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4qO9pHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789812925; x=1821348925;
  h=date:from:to:cc:subject:message-id;
  bh=zBoiNDtauEq0FXWzk9d87sA8wGmJOfJ6nDo28NtLwrA=;
  b=a4qO9pHd8KEtbm82fDstsmXeX8+GtBYuHO+H50CcjIZ0zMhFKfV8+3Xj
   SVTGmmncEXSswtuoHANG7Fn5JYQDY/wI3KgHBCyhYNDF7eNOBE2MbHymP
   46gPIns+VL5Ch+YWn9MHBIrY/d3GmS1Ewb9MRkaaCB+o8ahTwR8bomcGk
   EDCKLXHjVSSJUgdunIsbp4xVFXapsWdDRUwDlPUWJbPtVwPcsJQPb0Wkz
   rKvE1WGYsmZhQNTpWf13N+SI3VeS9AD1KhL5LCPEOyUCxF99xSM8aBOD8
   uNulvDsOH3T+LR1mXKbEWFUysjjLRgXLqP+/8VrA6JFGJffqWWuC8Beou
   Q==;
X-CSE-ConnectionGUID: TY/7uGcFTPO2OIGy6pLdDQ==
X-CSE-MsgGUID: PidDejDzQvSQbMqliMD7EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77911020"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="77911020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 03:15:24 -0700
X-CSE-ConnectionGUID: K9tpEEgqSCKgSXLrBVo8CA==
X-CSE-MsgGUID: T/tCmtLMRWKlm4JUn4TPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270484650"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2026 03:15:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7s6K-00000000Apt-1P7j;
	Sat, 19 Sep 2026 10:15:20 +0000
Date: Sat, 19 Sep 2026 18:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/tty/serial/qcom_geni_serial.c:1592:9: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202609191827.ojEhQ7yN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   77804d3596695c7b85fe038c81d9580283ffd2ca
commit: 710fd74d1dbb72c237548032941e84771551546a [2/2] FROMGIT: tty: serial: qcom-geni-serial: Add support for Hibernation feature
config: arm64-randconfig-r1305-20260919 (https://download.01.org/0day-ci/archive/20260919/202609191827.ojEhQ7yN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 05d706e9a816dbf9eff31f47869f53d6fe796089)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191827.ojEhQ7yN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191827.ojEhQ7yN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/qcom_geni_serial.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> drivers/tty/serial/qcom_geni_serial.c:1592:9: sparse: sparse: Initializer entry defined twice
   drivers/tty/serial/qcom_geni_serial.c:1595:10: sparse:   also defined here

vim +1592 drivers/tty/serial/qcom_geni_serial.c

710fd74d1dbb72 Aniket Randive              2022-09-27  1590  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1591  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
b1f84dd321667d Mukesh Kumar Savaliya       2018-10-16 @1592  	SET_SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
b1f84dd321667d Mukesh Kumar Savaliya       2018-10-16  1593  					qcom_geni_serial_sys_resume)
710fd74d1dbb72 Aniket Randive              2022-09-27  1594  	.restore = qcom_geni_serial_sys_hib_resume,
710fd74d1dbb72 Aniket Randive              2022-09-27  1595  	.thaw = qcom_geni_serial_sys_hib_resume,
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1596  };
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1597  

:::::: The code at line 1592 was first introduced by commit
:::::: b1f84dd321667d07f08fab99d042f1e39e9ee5bb tty: serial: qcom_geni_serial: Rectify UART suspend mechanism

:::::: TO: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
