Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413B113E028
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 22:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252110; cv=none; b=lj0AtZmigidtFb8vWiahIaLCmBj5EU3STZzV+juvkKah+pYYLK09MJgG68PCrVxeELQUQzyGIm5ht/YRp3LpMhiYx033NppYg4MtXHCqmbggFajKfRti2V+f1cFXCBZaq/b4e+8PbKBW/NU1fvPw+X1OdsdivcNX+r6UdFCy9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252110; c=relaxed/simple;
	bh=5ErWsaATHJ3S2n5h6Klx2Gc7HeyMoZlIAQCWSXRqCkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5c3ZhIKDuB45ZKE3UM6d/VZliAbNyAxYZUcEOKdQu1u2JVFBnB1hbADv7mh7P0dsfq+BrkfymyEx9LVNdSUmxeNbwgwXeZJAw4rKsa9OjPNkMxjDcyq8BnGGNDBKB63Y0R0xFIVVQ7stnNt+b8LQVRfIjtTix1aB8MhYhy5DzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwPr2je5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwPr2je5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735252108; x=1766788108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ErWsaATHJ3S2n5h6Klx2Gc7HeyMoZlIAQCWSXRqCkM=;
  b=gwPr2je5uccW7v4HgSDT2Oyiin5x7NblI4Yt93o+vwmcjX8ctVEbB1Rb
   rFj62SbRRnNyaqI2sRTYEdllHiLLb8+Ggpyed9NUJPnGsRbvJfqj0iDui
   lGYa+Vam4MCzqvv/ASU5YlaLN2kQ0RmyztVV6ifZpCYgy9lJWHxCretYR
   rq+cDCj807Y0sn3bPP046ZxNEwK1TUch4XR1iAm48m5N+tB6XpLDQ7cqY
   k4sH6Lc1tqhoDz68OXELVgG4Kp4g9wvWr4SuDDRlphqy4OLiYpDjGy/9c
   cxVSWT1zIZIF6y54bJ7vpnr88ITTquba6tkm+W6+eKmEZ9NLyHtIzTey2
   g==;
X-CSE-ConnectionGUID: fxdMWHszTFysx1G5Qc+MUg==
X-CSE-MsgGUID: BfQcBqmETgO5sUYpgyXlnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="46260230"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="46260230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 14:28:25 -0800
X-CSE-ConnectionGUID: KFyrNoARRnqD0bTtC9CY6A==
X-CSE-MsgGUID: YoN3WvfpT1mzvW5tnUCfcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="100383469"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Dec 2024 14:28:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQwL8-0002pe-2i;
	Thu, 26 Dec 2024 22:28:22 +0000
Date: Fri, 27 Dec 2024 06:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667]
 drivers/i2c/busses/i2c-zhaoxin-smbus.c:367:36: warning: 'zxsmb_acpi_match'
 defined but not used
Message-ID: <202412270617.vikLQkom-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 08d91e70564c8af05a673fef3dbae0b2278529fd [1667/1667] i2c: smbus: Add support for Zhaoxin SMBUS controller
config: arm64-randconfig-r111-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270617.vikLQkom-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270617.vikLQkom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270617.vikLQkom-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-zhaoxin-smbus.c:367:36: warning: 'zxsmb_acpi_match' defined but not used [-Wunused-const-variable=]
     367 | static const struct acpi_device_id zxsmb_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/zxsmb_acpi_match +367 drivers/i2c/busses/i2c-zhaoxin-smbus.c

   366	
 > 367	static const struct acpi_device_id zxsmb_acpi_match[] = {
   368		{"SMB3324", 0 },
   369		{ }
   370	};
   371	MODULE_DEVICE_TABLE(acpi, zxsmb_acpi_match);
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
