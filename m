Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B68C8CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766862717; cv=none; b=JEcsZVMCszVTWLI1leLpuQnfDHBHqXRu44bBvRwGAtUGf84iVVe4pojrhjcsQCXi2sw47zdN+C8k239NSuJYMYyFqkZNxxG4rfpo+44vQtxNZ4ucUBqnNbLRZugPTTcufOfW8dPVr5VFIPNrfGYAzdfr2OmxWM/XmLcucOUK+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766862717; c=relaxed/simple;
	bh=3WHg59h2tYbN2iWg4367YQwFlskj5E5sFmSdtCduXfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IH0L1e43YEV5kqNOK5sbPQBFz6eqVn2cNteFasxhYnDot9qtP2DXnj1CTW8TbKxM3FLjbM5XyJ6q0Vji+MI+n13BSHEUsIPXgHebgPwXf8IsYw8shMrY7+saO+XRyt5BeQydOsTmA8YxtrjhZ2DeV3B7pSSI8XqkkQgyprpYUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mr9wK/cr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mr9wK/cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766862715; x=1798398715;
  h=date:from:to:cc:subject:message-id;
  bh=3WHg59h2tYbN2iWg4367YQwFlskj5E5sFmSdtCduXfk=;
  b=Mr9wK/crg4vvTlDyrCwMI1I3WMZepw6iumqme48D0rQCf/vk5CnqU+Yh
   FjXEPR+GzUHxYr1iPLeiuCcVUTdPILKjurIOQQUn8O8LJq+8jDY7IyqLg
   4QBn5FoNDCEId8lgpY9fqciv5bLQYAVyVlekkzxeWr7MwV0F9QLRiBLcU
   KXUZQljTN0ajgIrnYjLHtm7hG+8b2KHwck5e7V0vtPKU5GynJu4WNiDHJ
   ormhN1+lf3rrmaJygWgnDb08twezOrYt5SiZ18QgxqY7hvwuG2XrkIVPp
   RFYP18Z4XH2ew1znpSlRPAA8Kx9IZLf5o7IqDqH4awf/4s9XAzS3tycUk
   w==;
X-CSE-ConnectionGUID: deshggW0RaWQOuSkMHh1Iw==
X-CSE-MsgGUID: ExztUSW7QROLAw6830gNIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="67549252"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="67549252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 11:11:54 -0800
X-CSE-ConnectionGUID: wHWlfOU3TKemehI4x9X5yA==
X-CSE-MsgGUID: eOeDuiM3RW6/Q5KdWtC9zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="200613051"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 11:11:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZZhe-00000000621-2XlK;
	Sat, 27 Dec 2025 19:11:50 +0000
Date: Sun, 28 Dec 2025 03:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Carlos Song <carlos.song@nxp.com>,
 Adrian Fluturel <fluturel.adrian@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [jic23-iio:testing 47/65] regmap-i3c.c:undefined reference
 to `i3c_device_do_xfers'
Message-ID: <202512280443.lOhY75Df-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   cdffe36e1cf26b53250ed99d70c71c34ff5d4ac5
commit: 6e5f6bf2e3f036e6d7466d2a3322445729ea3356 [47/65] iio: magnetometer: Add mmc5633 sensor
config: nios2-randconfig-002-20251228 (https://download.01.org/0day-ci/archive/20251228/202512280443.lOhY75Df-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280443.lOhY75Df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512280443.lOhY75Df-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_read':
>> regmap-i3c.c:(.text+0x64): undefined reference to `i3c_device_do_xfers'
>> regmap-i3c.c:(.text+0x64): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_do_xfers'
   nios2-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_write':
   regmap-i3c.c:(.text+0xbc): undefined reference to `i3c_device_do_xfers'
   regmap-i3c.c:(.text+0xbc): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_do_xfers'
   nios2-linux-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_read_raw':
>> mmc5633.c:(.text+0x2ec): undefined reference to `i3c_device_get_supported_xfer_mode'
>> mmc5633.c:(.text+0x2ec): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_get_supported_xfer_mode'
>> nios2-linux-ld: mmc5633.c:(.text+0x38c): undefined reference to `i3c_device_do_xfers'
>> mmc5633.c:(.text+0x38c): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_do_xfers'
   nios2-linux-ld: mmc5633.c:(.text+0x3d8): undefined reference to `i3c_device_do_xfers'
   mmc5633.c:(.text+0x3d8): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_do_xfers'
   nios2-linux-ld: mmc5633.c:(.text+0x698): undefined reference to `i3c_device_do_xfers'
   mmc5633.c:(.text+0x698): relocation truncated to fit: R_NIOS2_CALL26 against `i3c_device_do_xfers'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_I3C
   Depends on [n]: I3C [=n]
   Selected by [y]:
   - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
