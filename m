Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A43481B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758306919; cv=none; b=grkZleLs1UHgSqtrnqmjwIeX2IuvMlqHnkhaSCkYilYGfWkCaAx8q8HHuTrH3RmisJ9fzxRu+qsAbzaTLqS3P7g9f63s4YGoEET6gTkyhDlJHmT6EQY8dwPc2dW0LmO8cdghRlYKTTc2t5nzPN2BuIcPE2JQfXMb5eEoguh43VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758306919; c=relaxed/simple;
	bh=W92u855kkQU363kyri60jG7yRz+432mVmRuV4eGHjfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dX69cX49zsEbUCQ2aeZMvim63ygZjOH2cspmNURcLPl8ufzNJRG1rhZIcYXAGL2OYK1YdSgcfxnwf3kzJPXMq1VALmz8bSGwCrChIvyAUFCgRYMyfALuNapwMgQP7KjHZkrRyjXx7iUbYnzmpD3x+fzqqLYZaqzWWyGdRje/wC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US6eaOYt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US6eaOYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758306917; x=1789842917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W92u855kkQU363kyri60jG7yRz+432mVmRuV4eGHjfg=;
  b=US6eaOYtIvg9FXHZH3V8M0D2QqXFQuqFP1lgQx1AHoM8otA1EwPOWuRS
   2XLln1rsvuu3ISKCBL5zdgdvwPHT8Sw5/fNMm2pFy32Vq4pk80LEjSzLW
   iS+UbPvGwGOWFFGmGqobF8KslJQhzK3m70kb9TQCibDl5c/J3o9a/lKo0
   Q5xiUL/ZaL+3qh/MQO/iC1fhQQC3Jv0ZwTQ8MaqDQWH1EKmd8O3PkNVVA
   M36mHE2KClhwRMPVInfcAB9IBOfyFogK7YIV6ohw8bSN/57tviC4kyRgI
   fC3PEn3VY+mkaXIS7q1MFJA+sGluZKxmyNT1cuxj3n+tP4lhbisxesK9y
   g==;
X-CSE-ConnectionGUID: pEbBLwMmRGWh8xmnrdA6bA==
X-CSE-MsgGUID: Kzwkk4n4SNGY9/xyvU+DqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60813282"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60813282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 11:35:15 -0700
X-CSE-ConnectionGUID: +Z0vLr38RCy3WvOgeMW4TA==
X-CSE-MsgGUID: DGXv3uH8RXOZzj1eYHSyuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175825670"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 11:35:13 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzfws-0004h5-33;
	Fri, 19 Sep 2025 18:35:10 +0000
Date: Sat, 20 Sep 2025 02:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6458/11136] drivers/hwmon/gpd-fan.c:231:9: error:
 implicit declaration of function 'outb'
Message-ID: <202509200214.i2QX7iwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: 0ab88e2394392f475b8857ac82c0c987841217f8 [6458/11136] hwmon: add GPD devices sensor driver
config: i386-buildonly-randconfig-004-20250920 (https://download.01.org/0day-ci/archive/20250920/202509200214.i2QX7iwD-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200214.i2QX7iwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200214.i2QX7iwD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/gpd-fan.c: In function 'gpd_ecram_read':
>> drivers/hwmon/gpd-fan.c:231:9: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
     231 |         outb(0x2E, addr_port);
         |         ^~~~
>> drivers/hwmon/gpd-fan.c:244:16: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
     244 |         *val = inb(data_port);
         |                ^~~
   cc1: some warnings being treated as errors


vim +/outb +231 drivers/hwmon/gpd-fan.c

   224	
   225	// Helper functions to handle EC read/write
   226	static void gpd_ecram_read(u16 offset, u8 *val)
   227	{
   228		u16 addr_port = gpd_driver_priv.drvdata->addr_port;
   229		u16 data_port = gpd_driver_priv.drvdata->data_port;
   230	
 > 231		outb(0x2E, addr_port);
   232		outb(0x11, data_port);
   233		outb(0x2F, addr_port);
   234		outb((u8)((offset >> 8) & 0xFF), data_port);
   235	
   236		outb(0x2E, addr_port);
   237		outb(0x10, data_port);
   238		outb(0x2F, addr_port);
   239		outb((u8)(offset & 0xFF), data_port);
   240	
   241		outb(0x2E, addr_port);
   242		outb(0x12, data_port);
   243		outb(0x2F, addr_port);
 > 244		*val = inb(data_port);
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
