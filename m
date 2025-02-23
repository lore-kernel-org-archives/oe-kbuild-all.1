Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037811FC7F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740305165; cv=none; b=D50pXHlarnBM/pUsVBWEvfcK2IwHKZCmf+G0RJ8s1Cv3TnrEZP2MlpHSm+C9VZWNNUyifSpFYvhhWcp06Fjv3U+cgW8EbqZJpRcHZebsXkugLO5euBW62f+ao7s+EBlKHqVRYcWoLfPSfNQHv39snXHEnTSx4MIsD1YRGJOaGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740305165; c=relaxed/simple;
	bh=f6bqVP3/8gFKYeM5oihOLnOzz9a+pMJveX+lOVb0d3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bg6+pcEXBTcTZvxe0awYW4FOJg0w5ohQRxBMQkWM1MD1jZmWcLX9+SnDXszZxwxIbm4QkhvcaXZ76HcjNrm/v6T0t4S0zRtlT07Y2CLJ7P5Ce+KCzDXb+TziA16dxuTUtpbavgJ39G1Urr5v3EDfK720Urs/RY9AG3abe+Jx8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Utg9mhmO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Utg9mhmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740305164; x=1771841164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6bqVP3/8gFKYeM5oihOLnOzz9a+pMJveX+lOVb0d3k=;
  b=Utg9mhmO4fxmvEDA70QCCoeluYhsbVBzG3XOtJ8kPeGd0fMRbuRKR0xC
   oqrUSumkq8I/d3H86N1lOF2mRsRYKW+eq8NYQad9iPzxMUdTiojODayEm
   B1b9nuB84xr+H/2PS4HVDsySFt3qhSWwkz3sh6/kHfLo8LZ5l5B00V66F
   E40mhuv9SoQZZouEVhTrhUcHHJF9ETBMG0YhfuMyKOsUgpwdbfIQ47Qsf
   uB7vz8UjzmTbhGoeVuw/ockFv9WxFtRuxAEEB8QsMHHBXJ0I5Og21vgoQ
   ELCerWtqe0fUSgvNy7Akdn5rMXjw58qQLRicJIBeooeFyRsUnniv/WCx/
   g==;
X-CSE-ConnectionGUID: tANikJWnTfOHt+PhYGuU4A==
X-CSE-MsgGUID: Z6frI5msTy6STr+6X7JzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="63542567"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63542567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:06:04 -0800
X-CSE-ConnectionGUID: mZLZCBWDRG6h+7dkVaiuRg==
X-CSE-MsgGUID: 5nT/9n+kQ4u6LEreh9S+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116275444"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Feb 2025 02:06:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm8s4-0007Ft-1i;
	Sun, 23 Feb 2025 10:06:00 +0000
Date: Sun, 23 Feb 2025 18:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2] ERROR: modpost:
 "copy_to_kernel_nofault" [mm/kasan/kasan_test.ko] undefined!
Message-ID: <202502231752.OdJiDSCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   f7484783574ddf341e3c60bd31189fc918a16e11
commit: e4137f08816bbf91fe76d1b60fa16862a4827ac1 [2/2] mm, kasan, kmsan: instrument copy_from/to_kernel_nofault
config: x86_64-randconfig-161-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231752.OdJiDSCj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231752.OdJiDSCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231752.OdJiDSCj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "copy_to_kernel_nofault" [mm/kasan/kasan_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
