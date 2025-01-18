Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9F3234
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737187183; cv=none; b=ATznK0jbCyGS28LIa8EMsd39AwbS8U+wBldtIZzbgtHrZdOs0VF3XUS8xde6tvsybpEz9Oajv6NKpRomTWIt+tUMNA9E0m3BnnBo8QAAEfwFWlw3QA2jLe1haJY4yolp9ziFUv4W8AhBwG9gJSMgNWfvRQIU/GyDkecXNdkGh0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737187183; c=relaxed/simple;
	bh=TwAT8TOx1YDDA0sprRgurrlYyORL6ILoODT1J3H9RcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zho5LIz/esMJzTK8WF4H69qxRadEXuQsZIrlOVCPqpgOu46VL/6At37qCxOonIbI8PJbQ0Xe1B6+eeM9Lz6NuRLeYUhwO9e1+LMz6ScSdY1oGQ68tygFBsNf/qh8KCQClnyTUsLZnvuIG2mycZTgHEFEeTtG0VRWgVxX0MWfmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS0sUZ/c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS0sUZ/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737187181; x=1768723181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwAT8TOx1YDDA0sprRgurrlYyORL6ILoODT1J3H9RcM=;
  b=WS0sUZ/c1vIHeyFLvi6RmlMmEJbGO6zkPAHnMgRcSY9ey5Cx5/+4juHW
   W5tuO/VQYH7UZ/ekLl3S5rwXCOPCgxNKiYj64VxqM/sy5XD5mnjcuXh66
   bRCbUWFIr87ZBqNFR2/ndeqh+3zepIpML6Jo6OgXaVIGvBQaC1h3edkiu
   75PEqH831vk1LgAsERPXM1AvI3Dy96mTkgYTfHvfWugnrMxCw1PmMbWqR
   DCox211I12nnsfBRpci76GtvxhPOd0QxhgRt+WYIgEqYiDZMHOq+ACnFj
   nBJJoS8kYkccmoILvY59TwrMlmr6PUSt6U3Sr32EZbeiEqljo/IB6dY2Q
   w==;
X-CSE-ConnectionGUID: Ry+1I+H0Tpe29KsPVsO1tg==
X-CSE-MsgGUID: FMLCTmpnT9yhm3YR82qoBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49041044"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49041044"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 23:59:40 -0800
X-CSE-ConnectionGUID: GpkcNN5RRy6/POOdhV7vcg==
X-CSE-MsgGUID: CLKMy26OQbOdCEm9pBuvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136914415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2025 23:59:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ3k0-000UCX-2m;
	Sat, 18 Jan 2025 07:59:36 +0000
Date: Sat, 18 Jan 2025 15:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/input/touchscreen/wdt87xx_i2c.c:1166:36: warning:
 'wdt87xx_acpi_id' defined but not used
Message-ID: <202501181549.uzdlBwuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 0bbadafdc49d11a1836e5946f517d18cceaea6c8 um: allow disabling NO_IOMEM
date:   3 years, 7 months ago
config: um-randconfig-002-20230916 (https://download.01.org/0day-ci/archive/20250118/202501181549.uzdlBwuN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181549.uzdlBwuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181549.uzdlBwuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/wdt87xx_i2c.c:1166:36: warning: 'wdt87xx_acpi_id' defined but not used [-Wunused-const-variable=]
    1166 | static const struct acpi_device_id wdt87xx_acpi_id[] = {
         |                                    ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && (FRAME_POINTER [=n] || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by [y]:
   - LOCK_STAT [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   - DEBUG_LOCK_ALLOC [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +/wdt87xx_acpi_id +1166 drivers/input/touchscreen/wdt87xx_i2c.c

3e30c11c8a902d HungNien Chen 2015-06-15  1165  
3e30c11c8a902d HungNien Chen 2015-06-15 @1166  static const struct acpi_device_id wdt87xx_acpi_id[] = {
3e30c11c8a902d HungNien Chen 2015-06-15  1167  	{ "WDHT0001", 0 },
3e30c11c8a902d HungNien Chen 2015-06-15  1168  	{ }
3e30c11c8a902d HungNien Chen 2015-06-15  1169  };
3e30c11c8a902d HungNien Chen 2015-06-15  1170  MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);
3e30c11c8a902d HungNien Chen 2015-06-15  1171  

:::::: The code at line 1166 was first introduced by commit
:::::: 3e30c11c8a902de350281a0d821e17cdb45ef156 Input: add a driver for wdt87xx touchscreen controller

:::::: TO: HungNien Chen <hn.chen@weidahitech.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
